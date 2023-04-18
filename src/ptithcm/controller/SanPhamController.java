package ptithcm.controller;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.websocket.server.PathParam;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import other.Check;
import ptithcm.bean.UserNow;
import ptithcm.entity.LoaiSanPham;
import ptithcm.entity.SanPham;
@Transactional
@Controller
@RequestMapping("sanpham")
public class SanPhamController {
	@Autowired
	SessionFactory factory;

	@RequestMapping(value = "insert",method = RequestMethod.GET)
	public String insert(ModelMap model) {
		model.addAttribute("sanpham", new SanPham());
		model.addAttribute("user","Admin "+UserNow.ten);	
		model.addAttribute("userId",UserNow.userName);
		
		return "formcapnhatsanpham";		
	}
	
	@Autowired
	ServletContext context;
	@RequestMapping(value = "insert",method = RequestMethod.POST)
	// sửa nếu sản phẩm đã tồn tại
	public String insert(@ModelAttribute("sanpham")SanPham sp,@RequestParam("photo")MultipartFile image,ModelMap model) {
		Session session = factory.openSession();
		Transaction tr = session.beginTransaction();
		String tenHinhAnh = image.getOriginalFilename();			
		String path = context.getRealPath("resource/img/"+image.getOriginalFilename());					
		// kiem tra su ton tai cua san pham 
		String hql = "FROM SanPham WHERE id = :ten";
		Query q  = session.createQuery(hql);
		q.setParameter("ten", sp.getId());
		SanPham sp1= (SanPham)q.uniqueResult();		
		// nếu sản phẩm chưa tồn tại thì thêm mới
		if(sp1==null) {
			Check check = new Check();
			if (check.checkRegrex(sp.getTenSP())) {
				model.addAttribute("message","Cập nhật sản phẩm thất bại vì XSS");
				return "formcapnhatsanpham";
			}
			if (check.checkRegrex(sp.getMoTa())) {
				model.addAttribute("message","Cập nhật sản phẩm thất bại vì XSS");
				return "formcapnhatsanpham";
			}
			// nếu chưa có file thì thêm
			if(image.isEmpty()) {
				model.addAttribute("message","Vui lòng thêm file");
				return "formcapnhatsanpham";
			}
			
			else {
				try {
					image.transferTo(new File(path));	
					sp.setNgayDang(new Date());	
					sp.setHinhAnh(tenHinhAnh);
					session.save(sp);
					tr.commit();				
					return "redirect:/sanpham/insert.htm";
				} catch (Exception e) {
					tr.rollback();
					model.addAttribute("message","Thêm mới thất bại");
				}
				finally {
					session.close();
				}
				
			}
			return "formcapnhatsanpham";
		}
		// sản pham da ton thì chỉnh sủa lại thông tin
		else {		
			try {
				if(!image.isEmpty()) {
					File f = new File(context.getRealPath("resource/img/"+sp.getHinhAnh()));
					f.delete();
					image.transferTo(new File(path));			
					sp1.setHinhAnh(tenHinhAnh);
				}
				Check check = new Check();
				if (check.checkRegrex(sp.getTenSP())) {
					model.addAttribute("message","Cập nhật sản phẩm thất bại");
					return "formcapnhatsanpham";
				}
				if (check.checkRegrex(sp.getMoTa())) {
					model.addAttribute("message","Cập nhật sản phẩm thất bại vì XSS");
					return "formcapnhatsanpham";
				}
				sp1.setTenSP(sp.getTenSP());
				sp1.setLoaiSanPham(sp.getLoaiSanPham());
				sp1.setDonGia(sp.getDonGia());
				sp1.setMoTa(sp.getMoTa());
				session.update(sp1);
				tr.commit();				
				return "redirect:/sanpham/insert.htm";
			} catch (Exception e) {
				tr.rollback();
				model.addAttribute("message","Cập nhật sản phẩm thất bại");
			}
			finally {
				session.close();
			}
					
			return "formcapnhatsanpham";
		}
		
		
	}
		
	@RequestMapping(value="update/{name}",params = "btn-sua")
	public String update(ModelMap model, @PathVariable("name")int id) {
		Session s = factory.getCurrentSession();
		String hql = "FROM SanPham where id = :sp";
		Query q = s.createQuery(hql);
		q.setParameter("sp",id);
		SanPham sp = (SanPham)q.uniqueResult();
		model.addAttribute("sanpham",sp);	
		model.addAttribute("user", "Admin "+UserNow.ten);
		return "formcapnhatsanpham";
	}
	
	@RequestMapping(value="delete/{name}",params = "btn-xoa")
	public String delete(ModelMap model,@PathVariable("name")int id) {
		Session s = factory.openSession();
		String hql = "FROM SanPham where id = :sp";
		Query q = s.createQuery(hql);
		q.setParameter("sp",id);
		SanPham sp = (SanPham)q.uniqueResult();
		Transaction t = s.beginTransaction();
		try {
			s.delete(sp);
			t.commit();
			
		} catch (Exception e) {
			model.addAttribute("message","Xóa không thành công");
			t.rollback();
		}
		finally {
			s.close();
		}	
		return "redirect:/sanpham/insert.htm";
	}
	@ModelAttribute("loai") 
	  public List<LoaiSanPham> nhanLoai()
	  { 
		  Session s = factory.getCurrentSession();
		  String hql = "FROM LoaiSanPham";
		  Query q= s.createQuery(hql);		  
		  List<LoaiSanPham> dsLoai = q.list();
		return dsLoai; 
	  } 
	  @ModelAttribute("dsSanPham") 
	  public List<LoaiSanPham> sanPham()
	  { 
		  Session s = factory.getCurrentSession();
		  String hql = "FROM SanPham";
		  Query q= s.createQuery(hql);		  
		  List<LoaiSanPham> dsSanPham = q.list();
		return dsSanPham; 
	  } 
	
}
