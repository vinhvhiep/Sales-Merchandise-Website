package ptithcm.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ptithcm.bean.TruyVan;
import ptithcm.bean.UserNow;
import ptithcm.entity.CTDH;
import ptithcm.entity.DonHang;
import ptithcm.entity.SanPham;
import ptithcm.entity.User;
@Transactional
@Controller
@RequestMapping("dathang")
public class DatHangController {

	@Autowired
	SessionFactory factory;
	
	@RequestMapping("none")
	public String index() {
		return "redirect:/user/signin.htm";
	}
	
	// thêm sản phẩm mới chọn vào List tạm
	@RequestMapping(value = "/{idUser}",params = "btn-dat")
	public String order(@PathVariable("idUser")int id) {
		
		boolean trong = true;
		for (Integer i : TruyVan.getDsMaSanPham().keySet()) {
			if(i==id) {
				trong = false;
				TruyVan.dsMaSanPham.put(i, TruyVan.dsMaSanPham.get(i) + 1);
			}
		}
		if(trong)
			TruyVan.dsMaSanPham.put(id,1);
		return"redirect:/user/index.htm#thanhtoan";
	}
	
	// hiện thị những sản phẩm đã chọn bên trong giỏ hàng
	@RequestMapping(value = "/{userid}",method = RequestMethod.GET)
	public String order(ModelMap model,@PathVariable("userid")int id) {
		
		Session s = factory.getCurrentSession();
		//kiểm tra id trên URL có đúng với user đăng nhập nếu không thì phải đăng nhập
		if(!(id==Integer.parseInt(UserNow.userName) && UserNow.passWord!="")	)
			return "redirect:/user/signin.htm";
		
		// lấy những đối tượng sản phẩm dựa vào những id trong danh sách sản phẩm đã chọn
		String hql = "FROM SanPham WHERE id = :maSP ";		
		Query q = s.createQuery(hql);
		Map<SanPham,Integer> list = new HashMap<SanPham,Integer>();
		SanPham sp;
		double tongTien = 0;
		for (Integer id1 : TruyVan.dsMaSanPham.keySet()) {
			q.setParameter("maSP",id1);
			sp = (SanPham)q.uniqueResult();
			tongTien+=sp.getDonGia()*TruyVan.dsMaSanPham.get(id1); // với .get để lấy value với id1
			list.put(sp,TruyVan.dsMaSanPham.get(id1));
			
		}
		model.addAttribute("tongTien",tongTien);
		model.addAttribute("dssanpham",list);
		model.addAttribute("user",UserNow.ten);
		return "formdathang";
	}
	// khi bấm đặt hàng thì sẽ chuyển qua form lấy thông tin khách hàng
	@RequestMapping(value = "/{userid}",method = RequestMethod.POST)
	public String order(@PathVariable("userid")int id,ModelMap model,HttpServletRequest h) {
		//kiểm tra giỏ hàng có rỗng hay ko
		if(TruyVan.dsMaSanPham.isEmpty()) {
			model.addAttribute("message","Vui lòng thêm sản phẩm");
			return "redirect:/dathang/"+id+".htm";
		}
		
		//set lại ds CTDH tạm
		TruyVan.ctdh=new ArrayList<CTDH>();
		
		Session s = factory.getCurrentSession();
		String hql = "FROM User WHERE id = :id";
		Query q = s.createQuery(hql);
		q.setParameter("id", id);
		User u = (User)q.uniqueResult();
		String dsSL[]=h.getParameterValues("dsSoLuong");
		String dsID[]=h.getParameterValues("dsIdSanPham");
		String tongTien = h.getParameter("tongTien");
		
		CTDH ctdh = new CTDH();
		
		// thêm danh sách sản phẩm và số lượng vào đối tượng tạm
		for (int i = 0; i < dsID.length; i++) {
			TruyVan.ctdh.add(new CTDH(Integer.parseInt(dsID[i]),Integer.parseInt(dsSL[i])));
		}
		DonHang donHang = new DonHang();
		
		donHang.setNgayLap(new Date());
		donHang.setTenKH(u.getTen());
		donHang.setSdtKH(u.getSoDienThoai());
		donHang.setEmailKH(u.getEmail());
		donHang.setDiaChiKH(u.getDiaChi());
		donHang.setTongTien(Double.parseDouble(tongTien));
		
		model.addAttribute("donHang", donHang);
		// để khi bấm vào giỏ hàng thì quay lại giỏ hàng 
		model.addAttribute("userId",id);
		return "formDonHang";
	}
	//Hoàn tất đơn hàng
	@RequestMapping(value = "donhang",method = RequestMethod.POST )
	public String chotDon(ModelMap model,@ModelAttribute("donHang")DonHang donHang) {	
		Session s = factory.openSession();
		Transaction t = s.beginTransaction();
		String hql = "FROM User WHERE id =:user";
		Query q = s.createQuery(hql);
		q.setParameter("user", Integer.parseInt(UserNow.userName));
		User user = (User)q.uniqueResult();
		donHang.setUser(user);
		donHang.setNgayLap(new Date());
		donHang.setTrangThai(false);
		try {
			 s.save(donHang);
			for (CTDH c : TruyVan.ctdh) {
				c.setDh_ID(donHang.getId());
				s.save(c);
			}
			t.commit();
			model.addAttribute("message", "Đặt hàng thành công");
			
			TruyVan.ctdh= new ArrayList<CTDH>();
			TruyVan.dsMaSanPham = new HashMap<Integer, Integer>();
		} catch (Exception e) {
			t.rollback();
		}
		finally {
			s.close();			
		}

		return "redirect:/user/index.htm";
	}
	
	@RequestMapping(value ="delete/{name}",params = "btn-xoa")
	public String delete(@PathVariable("name")int id) {
		TruyVan.dsMaSanPham.remove(id);
		return "redirect:/dathang/"+UserNow.userName+".htm";
	}
	
	
	@RequestMapping(value="huydonhang")
	public String huyDonHang() {
		TruyVan.dsMaSanPham  = new HashMap<Integer, Integer>();
		return "redirect:/user/index.htm";
	}
	

	
}
