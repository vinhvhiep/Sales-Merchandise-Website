package ptithcm.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import ptithcm.bean.UserNow;
import ptithcm.entity.CTDH;
import ptithcm.entity.DonHang;
import ptithcm.entity.SanPham;
@Transactional
@Controller

// bên admin
@RequestMapping("donhang")
public class DonHangController {
	@Autowired
	SessionFactory factory;

	@RequestMapping("")
	public String donHang(ModelMap model) {
		Session s = factory.getCurrentSession();
		String hql = "FROM DonHang";
		Query q= s.createQuery(hql);		  
		List<DonHang> dsDH = q.list();
		Map<SanPham,Integer> dsSP = null; 
		//model.addAttribute("dsDonHang", dsDonHang);
		Map<DonHang,Map<SanPham,Integer>> dsDonHang = new HashMap<DonHang, Map<SanPham,Integer>>();
		for (DonHang donHang : dsDH) {
			hql="FROM CTDH WHERE dh_ID =:idDH";
			q=s.createQuery(hql);
			q.setParameter("idDH",donHang.getId());
			List<CTDH> dsCTDH = q.list();
			dsSP = new HashMap<SanPham,Integer>();
			for (CTDH sp : dsCTDH) {
				hql="FROM SanPham WHERE id =:ids";
				q=s.createQuery(hql);
				q.setParameter("ids", sp.getSp_ID());
				dsSP.put((SanPham)q.uniqueResult(),sp.getSoLuong());
			}
			dsDonHang.put(donHang,dsSP);
		}
		
		model.addAttribute("dsDonHang", dsDonHang);	
		model.addAttribute("user","Admin "+UserNow.ten);
		return "formxacnhan";
	}
	@RequestMapping(value="xacnhan/{iddonhang}",params = "btn-xacnhan")
	public String xacNhanDonHang(@PathVariable("iddonhang")int idDonHang) {
		Session s = factory.openSession();
		String hql = "UPDATE DonHang SET trangThai = true WHERE id = :id";
		Query query = s.createQuery(hql);
		query.setParameter("id",idDonHang);
			
		query.executeUpdate();
		return "redirect:/donhang.htm";
	}
	@RequestMapping(value="xacnhan/{iddonhang}",params = "btn-xoa")
	public String xoaDonHang(@PathVariable("iddonhang")int idDonHang,ModelMap model) {
		Session s = factory.openSession();
		Transaction t = s.beginTransaction();
		try {
			Criteria c = s.createCriteria(CTDH.class);
			c.add(Restrictions.eq("dh_ID",idDonHang));			
			List<CTDH> lsCT = c.list();
			for (CTDH ctdh : lsCT) {
				s.delete(ctdh);
			}
			c = s.createCriteria(DonHang.class);
			c.add(Restrictions.eq("id",idDonHang));
			s.delete((DonHang)c.uniqueResult());
			t.commit();
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("message","Xóa đơn hàng thất bại");
		}
		return "redirect:/donhang.htm";
	}
}
