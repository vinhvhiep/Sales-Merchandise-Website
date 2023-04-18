package ptithcm.entity;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "LOAI")
public class LoaiSanPham {
	@Id
	@GeneratedValue
	@Column(name = "id")
	private Integer id;
	
	@Column(name = "TENLOAI")
	private String tenLoai;

	@OneToMany(mappedBy = "loaiSanPham",fetch = FetchType.EAGER)
	private Collection<SanPham> sanPham;	
	
	public Integer getId() {
		return id;
	}

	public Collection<SanPham> getSanPham() {
		return sanPham;
	}

	public void setSanPham(Collection<SanPham> sanPham) {
		this.sanPham = sanPham;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTenLoai() {
		return tenLoai;
	}

	public void setTenLoai(String tenLoai) {
		this.tenLoai = tenLoai;
	}
	
	public LoaiSanPham() {
		
	}
	public LoaiSanPham(int id,String ten) {
		this.id = id;
		this.tenLoai =ten;
	}
}
