<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<base href="${pageContext.servletContext.contextPath}/">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!--Đường dẫn icon-->
	<link rel="stylesheet" href="<c:url value="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"></c:url>">
	<!-- Đường dẫn file.css -->
	<link rel="stylesheet" href="<c:url value= "resource/css/style.css"> </c:url>" />

<!-- Đường dẫn tới file css của bootstrap 4-->
<link rel="stylesheet"
	href="<c:url value="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"></c:url>">
<!--Đường dẫn tới js của bootstrap 4-->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

<title>WebSite bán hàng</title>
</head>
<body>
	<h3>User</h3>
	<table border="1">
		<tr>
			<th>STT</th>
			<th>Email</th>
			<th>Password</th>
			<th>Họ và tên</th>
			<th>Số điện thoại</th>
			<th>Địa chỉ</th>
			<th></th>
		</tr>
		<c:forEach var="u" items="${user}">
			<tr>
				<td>${u.id}</td>
				<td>${u.email}</td>
				<td>${u.matKhau}</td>
				<td>${u.ten}</td>
				<td>${u.soDienThoai}</td>
				<td>${u.diaChi}</td>
				<td><a href="user/show/delete/${u.id}/${u.soDienThoai}.htm"> Delete</a></td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<br>
	<h3>Đơn Hàng</h3>
	<table border="1">
		<tr>
			<th>STT</th>
			<th>Tên Khách hàng</th>
			<th>Số điện thoại</th>
			<th>Email</th>
			<th>Địa chỉ</th>
			<th>Tổng tiền</th>
			<th>Tài khoản đặt</th>
			<th>Ngày lập</th>
			<th>Trạng thái</th>
			<th></th>
		</tr>
		<c:forEach var="u" items="${DonHang}">
			<tr>
				<td>${u.id}</td>
				<td>${u.tenKH}</td>
				<td>${u.sdtKH}</td>
				<td>${u.emailKH}</td>
				<td>${u.diaChiKH}</td>
				<td>${u.tongTien}</td>
				<td>${u.user.ten}</td>
				<td>${u.ngayLap}</td>
				<td>${u.trangThai}</td>
				<td><a href="user/show/delete/${u.id}/${u.user.id}.htm"> Delete</a></td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<br>
	<h3>CTDH</h3>
	<table border="1">
		<tr>
			<th>STT</th>
			<th>Mã đơn hàng</th>
			<th>Mã sản phẩm</th>
			<th>Số lượng</th>

			<th></th>
		</tr>
		<c:forEach var="u" items="${CTDH}">
			<tr>
				<td>${u.id}</td>
				<td>${u.dh_ID}</td>
				<td>${u.sp_ID}</td>
				<td>${u.soLuong}</td>
				<td><a href="user/show/delete/${u.id}/${u.sp_ID}.htm"> Delete</a></td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<br>
	<h3>Sản phẩm</h3>
	<table border="1">
		<tr>
			<th>STT</th>
			<th>Tên sản phẩm</th>
			<th>Loại hàng</th>
			<th>Đơn giá</th>
			<th>Hình ảnh</th>
			<th>Mô tả</th>
			<th>Ngày đăng</th>
			<th></th>
		</tr>
		<c:forEach var="u" items="${dssanpham}">
			<tr>
				<td>${u.id}</td>
				<td>${u.tenSP}</td>
				<td>${u.loaiSanPham.tenLoai}</td>
				<td>${u.donGia}</td>
				<td>${u.hinhAnh}</td>
				<td>${u.moTa}</td>
				<td>${u.ngayDang}</td>
				<td><a href="user/show/delete/${u.id}/${u.tenSP}.htm"> Delete</a></td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<br>
	<h3>Loại Sản phẩm</h3>
	<table border="1">
		<tr>
			<th>STT</th>
			<th>Tên Loại</th>
		</tr>
		<c:forEach var="u" items="${LoaiSanPham}">
			<tr>
				<td>${u.id}</td>
				<td>${u.tenLoai}</td>		
			</tr>
		</c:forEach>
	</table>
	<br>
	<br><br>
	<br>
</body>
</html>





