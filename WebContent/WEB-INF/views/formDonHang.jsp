<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
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
</head>
<body>	
<header  >
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
            <li class="nav-item" style="background-color: tomato;" >
              <a href="./dathang/${userId}.htm" class="nav-link">  <i class="fa fa-shopping-basket"></i>Thanh Toán</a>
            </li>
            <!-- Chức năng Đăng kí -->
           <li class="nav-item" style="display: ${nguoidung}">
             	<%-- <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">${user}</button> --%>
              <div class="btn-group">
               		<a href="user/signin.htm" class="nav-link dropdown-toggle"   data-toggle="dropdown"> Đơn hàng của ${user} </a> 
		             <div class="dropdown-menu ml-15">
		    			<a class="dropdown-item" href="./user/dangxuat.htm">Đăng xuất</a>
		   			 	<!-- <a class="dropdown-item" href="#">Smartphone</a> -->
		  			</div>
		  		</div>
            </li>
          </ul>
          <form class="form-inline" action="/action_page.php">
            <div class="input-group">
              <input class="form-control" type="text" placeholder="Search">
              <button class="btn" type="submit"> <span class="fa fa-search"></span></button>
            </div>
          </form> 
        </div>
      </nav>
    </div>
  </header>
  
<section>
${massage}
${massage1}
	<div class="container" style="width: 50% ; background-color: orange; margin-top: 15px; border-radius: 15px" >
		<br>
		
		<h2>Đơn hàng</h2>
		
		<!-- lấy thông tin khách hàng của đơn hàng hiện tại  -->
		<f:form action="./dathang/donhang.htm"  modelAttribute="donHang">
			
			<div class="form-group">
				<label for="ten">Họ và Tên:</label> 
				<f:input type="text" class="form-control" id="ten" placeholder="Nhập họ và tên" path="tenKH"/>
				<span style="color: red">${LoiDinhDangTen}</span>
			</div>
			<div class="form-group">
				<label for="sdt">Số điện thoại:</label> 
				<f:input type="number" class="form-control" id="sdt" placeholder="Nhập số điện thoại" path="sdtKH"/>
				<span style="color: red">${LoiDinhDangSDT}</span>
			</div>
			<div class="form-group">
				<label for="diachi">Địa chỉ:</label> 
				<f:input type="text" class=	"form-control" id="diachi" placeholder="Nhập địa chỉ" path="diaChiKH"/>
				<span style="color: red">${LoiDinhDangDiaChi }</span>
			</div>
			<div class="form-group">
				<label for="email">Email:</label> 
				<f:input type="email" class="form-control" id="email" placeholder="Nhập email" path="emailKH"/>
				<span style="color: red">${LoiDinhDangEmail}</span>
			</div>
			<div class="form-group">
				<label for="tongTien">Tổng tiền:</label> 
				<f:input type="number" class="form-control" id="tongTien" path="tongTien" />
				<span style="color: red">${LoiDinhDangDiaChi }</span>
			</div>
			
			<f:button  data-toggle="modal" data-target="#myModal" type="submit" class="btn btn-primary btn-block"> Hoàn tất đơn hàng</f:button>
			<button type="button" class="btn btn-secondary btn-block"><a style="color:white"" href="./dathang/huydonhang.htm">Hủy đơn hàng</a> </button>
		</f:form>
		<br>
	</div>
</section>
	<!-- Button to Open the Modal -->


  <!-- The Modal -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Thông báo</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          Đặt hàng thành công
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-success" data-dismiss="modal">Okey</button>
        </div>
        
      </div>
    </div>
  </div>
</body>
</html>