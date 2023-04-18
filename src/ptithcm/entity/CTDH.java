package ptithcm.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;

@Entity
@Table(name="CTDH")
public class CTDH {
	@Id
	@GeneratedValue
	@Column(name = "ID")
	private Integer id;
	
	@Column(name = "DH_ID")
	private Integer dh_ID;
		
	@Column (name = "SP_ID")
	private Integer sp_ID;
	
	@Column(name = "SOLUONG")
	private Integer soLuong;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getDh_ID() {
		return dh_ID;
	}

	public void setDh_ID(Integer dh_ID) {
		this.dh_ID = dh_ID;
	}

	public Integer getSp_ID() {
		return sp_ID;
	}

	public void setSp_ID(Integer sp_ID) {
		this.sp_ID = sp_ID;
	}

	public Integer getSoLuong() {
		return soLuong;
	}

	public void setSoLuong(Integer soLuong) {
		this.soLuong = soLuong;
	}

	public CTDH(Integer id, Integer dh_ID, Integer sp_ID, Integer soLuong) {
		super();
		this.id = id;
		this.dh_ID = dh_ID;
		this.sp_ID = sp_ID;
		this.soLuong = soLuong;
	}

	public CTDH() {
		
	}
	
	//cmt
	public CTDH(Integer sp_ID,Integer soLuong) {
		this.sp_ID=sp_ID;
		this.soLuong=soLuong;
	}

	
	
	
	
	
}
