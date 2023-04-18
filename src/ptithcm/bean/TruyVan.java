package ptithcm.bean;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import ptithcm.entity.CTDH;

public class TruyVan {
	//Tạo 1 dsMaSanPham mới
	
	static public Map<Integer,Integer> dsMaSanPham = new HashMap<Integer, Integer>();
	
	static public List<CTDH> ctdh=  new ArrayList();  //Chi tiết hóa đơn
	
	public static Map<Integer, Integer> getDsMaSanPham() {
		return dsMaSanPham;
	}
	public static void setDsMaSanPham(Map<Integer, Integer> dsMaSanPham) {
		TruyVan.dsMaSanPham = dsMaSanPham;
	}
}
