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

<link rel="stylesheet"
	href="<c:url value="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"></c:url>">
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
              <a href="./user/signin.htm" class="nav-link">  <i class="fa fa-shopping-basket"></i>Thanh Toán</a>
            </li>
            <!-- Chức năng Đăng kí -->
            <li class="nav-item">
              <a href="user/signup.htm" class="nav-link">Đăng ký</a>

            </li>
               <!-- Chức năng Đăng kí -->
            <li class="nav-item">
               <a href="user/signin.htm" class="nav-link">Đăng nhập</a>
            </li>
          </ul>
          <form class="form-inline" action="/action_page.php">
            <div class="input-group">
              <input class="form-control" type="text" placeholder="Search">
           <!--    <button class="btn" type="submit"> <span class="fa fa-search"></span></button> -->
            </div>
          </form> 
        </div>
      </nav>
    </div>
  </header>
  
<section>
${massage}
	<div class="container" style="width: 50% ; background-color: orange; margin-top: 15px; border-radius: 15px" >
		<br>
		
		<h2>Đăng ký tài khoản</h2>
		<f:form action="./user/signup.htm"  modelAttribute="user">
			<div class="form-group">
				<label for="email">Email:</label> 
				<f:input type="email" class="form-control" id="email" placeholder="Nhập email" path="email"/>
				<span style="color: red">${LoiDinhDangEmail}</span>
			</div>
			<div class="form-group">
				<label for="pwd">Mật khẩu:</label> 
				<f:input type="password" class="form-control" id="pwd" placeholder="Nhập mật khẩu" path="matKhau"/>
				<span style="color: red">${LoiDinhDangMatKhau}</span>
			</div>
			<div class="form-group">
				<label for="ten">Họ và Tên:</label> 
				<f:input type="text" class="form-control" id="ten" placeholder="Nhập họ và tên" path="ten"/>
				<span style="color: red">${LoiDinhDangTen}</span>
			</div>
			<div class="form-group">
				<label for="sdt">Số điện thoại:</label> 
				<f:input type="number" class="form-control" id="sdt" placeholder="Nhập số điện thoại" path="soDienThoai"/>
				<span style="color: red">${LoiDinhDangSDT}</span>
			</div>
			<div class="form-group">
				<label for="diachi">Địa chỉ:</label> 
				<f:input type="text" class="form-control" id="diachi" placeholder="Nhập địa chỉ" path="diaChi"/>
				<span style="color: red">${LoiDinhDangDiaChi }</span>
			</div>
			
			<f:button type="submit" class="btn btn-primary"> Đăng kí</f:button>
		</f:form>
		<br>
	</div>
</section>
	
</body>
</html>