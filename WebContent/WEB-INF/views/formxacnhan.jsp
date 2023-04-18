<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fm" %>
<!DOCTYPE html>
<html>
<head>
  	<meta charset="utf-8">
	<base href="${pageContext.servletContext.contextPath}/">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!--Đường dẫn icon-->
	<link rel="stylesheet" href="<c:url value="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"></c:url>">
	<!-- Đường dẫn file.css -->
	<link rel="stylesheet" href="resource/css/style.css"/>

	<!-- Đường dẫn tới file css của bootstrap 4-->
	<link rel="stylesheet"
	href="<c:url value="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"></c:url>">
	<!--Đường dẫn tới js của bootstrap 4-->
	<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
	
	
	<style type="text/css">
		.section-main{
			
			background-color: darkred;
		}
	
		.benphai{

		    min-height: 1050px;
		    float: right;
		    margin: 0 auto; 
		    
		}	
		strong{
			color: black;
		}
	</style>
</head>

<body>
${message}
  <header >
    <div class="container ">
      <nav class="navbar navbar-expand-md navbar-light  ">
        <a class="navbar-brand " href="user/index.htm">
          <img src="resource/img/logo.png" alt="logo" style="width:50%;">
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive">
          <span class="navbar-toggler-icon"></span>
        </button> 
        <div class="collapse navbar-collapse" id="navbarResponsive" >
          <ul class="navbar-nav ml-auto">
            <li class="nav-item" style="display: ${nguoidung}">
             	<%-- <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">${user}</button> --%>
              <div class="btn-group">
               		<a href="user/signin.htm" class="nav-link dropdown-toggle"   data-toggle="dropdown"> ${user} </a> 
		             <div class="dropdown-menu ml-15">
		    			<a class="dropdown-item" href="./user/dangxuat.htm">Đăng xuất</a>
		   			 	<!-- <a class="dropdown-item" href="#">Smartphone</a> -->
		  			</div>
		  		</div>
            </li>
             <li class="nav-item" style="display: ${admin}">
               <a href="sanpham/insert.htm" class="nav-link">Quản lý Sản Phẩm </a>
            </li>
            <li class="nav-item" style="display: ${admin}">
               <a href="donhang.htm" class="nav-link">Quản lý Đơn Hàng </a>
            </li>
          <%--   <li class="nav-item" style="display: ${nguoidung}">
               <a href="sanpham/insert.htm" class="nav-link">Quản lý Sản Phẩm </a>
            </li> --%>
          </ul>
          <form class="form-inline" action="/action_page.php">
            <div class="input-group">
              <input class="form-control" id="myInput" type="text" placeholder="Search..">
            </div>
          </form> 
        </div>
      </nav>
    </div>
  </header>
<section class="section-main"  >   
	<h2 style="color:orange;margin-left:15px;margin-top:15px">Danh Sách Đơn Hàng</h2>
      <div class="container" id="myTable">     	
	      	<div id="accordion" class="mt-15" style="margin-top:50px !important;">
				<c:forEach var="u" items="${dsDonHang}">
				<div class="card" >
					
					<div class="card-header" style="padding:0" >
						<a class="card-link" data-toggle="collapse" href="#m${u.key.id}" >
							<div class="media " style="width:650px; float:left">
								<div class="media-body ">
									<h4 style="margin:15px 10px;">
										<strong>Đơn hàng: ${u.key.id}</strong>  																				
										<small class="badge badge-secondary"><i><fm:formatNumber type="currency">${u.key.tongTien}</fm:formatNumber> </i></small>									
										
									</h4>
									<small style="color:black;margin-left:5px">Ngày đặt: </small>${u.key.ngayLap}
									<small style="color:black">Tên khách hàng: </small>${u.key.tenKH}
									<small style="color:black">Số điện thoại: </small>${u.key.sdtKH}
									<small style="color:black">Địa chỉ: </small>${u.key.diaChiKH}
									<br>
									<small style="color:black">Trạng thái đơn hàng: </small> 
									<c:choose>
										<c:when test="${u.key.trangThai==true}"> Đã xác nhận</c:when>
										<c:when test="${u.key.trangThai==false}"> Chưa xác nhận</c:when>
									</c:choose>
								</div>
								
							</div>
						</a>
						
						<div class="btn-group" style="float: right;z-index: 15">							       				
    						<c:if test="${u.key.trangThai==false}">
    							<a href="donhang/xacnhan/${u.key.id}.htm?btn-xacnhan"><button type="button" class="btn btn-warning" name = "btn-sua">Xác nhận</button> </a>						 															
							</c:if>
							<a href="donhang/xacnhan/${u.key.id}.htm?btn-xoa"><button type="button" class="btn btn-warning" data-toggle="modal" data-target="#myModal" name = "btn-xoa">Hủy</button> </a>
							 
						</div>
						
					</div>
	
					<div id="m${u.key.id}" class="collapse" data-parent="#accordion">
						<div class="card-body">
							<div id="accordion" class="mt-3">
								<c:forEach var="uu" items="${u.value}">
								<div class="card" >
									
									<div class="card-header" style="padding:0" >
										<a class="card-link" data-toggle="collapse" href="#m${uu.key.id}" >
											<div class="media " style="width:650px; float:left">
												<img src="./resource/img/${uu.key.hinhAnh}" alt="${uu.key.id}" class="m-3  "
													style="width: 60px;">
												<div class="media-body ">
													<h4 style="margin-top:20px;">
														<strong >${uu.key.tenSP}</strong>  <small class="badge badge-secondary"><i><fm:formatNumber type="currency">${uu.key.donGia}</fm:formatNumber> </i></small>
													</h4>
													<span>Số lượng:</span>${uu.value}
												</div>
												
											</div>
										</a>
										<%-- <div class="btn-group-vertical" style="float: right;z-index: 15">							       								 															
											<a href="sanpham/delete/${uu.id}.htm?btn-xoa"><button type="button" class="btn btn-warning" data-toggle="modal" data-target="#myModal" name = "btn-xoa">Xóa</button> </a>
											 
										</div> --%>
									</div>
		
								</div>
								</c:forEach>
							</div>
						
						</div>
					</div>
				</div>
				</c:forEach>
			</div>
			</div>  
			   	
      	
		
      </div>
      



 </section>
<script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable .card").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>
</body>
</html>
