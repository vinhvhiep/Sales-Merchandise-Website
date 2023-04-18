<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
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
<link rel="stylesheet" href="<c:url value= "resource/css/style.css"> </c:url>" />

<!-- Đường dẫn tới file css của bootstrap 4-->
<link rel="stylesheet"
	href="<c:url value="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"></c:url>">
<!--Đường dẫn tới js của bootstrap 4-->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script src="resource/js/style.js"></script>	
</head>

<body>	
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
            <li class="nav-item" style="background-color: tomato;" >
              <a  class="nav-link">  <i class="fa fa-shopping-basket"></i>Thanh Toán</a>
            </li>
            <li class="nav-item" style="display: ${nguoidung}">
             	
              <div class="btn-group">
               		<a href="user/signin.htm" class="nav-link dropdown-toggle"   data-toggle="dropdown"> Đơn hàng của ${user} </a> 
		             <div class="dropdown-menu ml-15">
		    			<a class="dropdown-item" href="./user/dangxuat.htm">Đăng xuất</a>
		   			 	<!-- <a class="dropdown-item" href="#">Smartphone</a> -->
		  			</div>
		  		</div>
            </li>
          </ul>
          <form class="form-inline" action="/action_page.php" >
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
  
	<div class="container"  >
		<f:form method="POST">
		
      		 <h2 class="mt-5">Đơn hàng</h2>
	      	<div id="accordion" class="mt-3"]>
	      			      		
				<c:forEach var="u" items="${dssanpham}">
					
					<div class="card" >
						
						<div class="card-header" style="padding:0" >
							<a class="card-link" data-toggle="collapse">
								<div class="media " style="width:650px; float:left">
									<img src="resource/img/${u.key.hinhAnh}" alt="${u.key.id}" class="m-3  "
										style="width: 60px;">
									<div class="media-body ">
										<h4 style="margin-top:20px;">
											<strong name ="id" class="idSP" value="${u.key.id}" >${u.key.tenSP}</strong>  <small class="badge badge-secondary"><i class="donGia" donGia="${u.key.donGia}"><fm:formatNumber type="currency">${u.key.donGia}</fm:formatNumber> </i></small>
										</h4>
		
									</div>
									
								</div>
							</a>
							<div class="btn-group" style="float: right;z-index: 15">							       				
	    												 															
								<a href="./dathang/delete/${u.key.id}.htm?btn-xoa" style="float: right"><button type="button" class="btn btn-warning" data-toggle="modal" data-target="#myModal" name = "btn-xoa">Xóa</button> </a>
								 <div class="input-group">         
						          <div class="input-group-append" style="border-radius: 50px !important;">
						            <span class="input-group-text">Số lượng</span>
						          </div>					        
						          <input name="dsSoLuong" onchange= "capNhatGia()" type="number" class="soLuong form-control" value="${u.value}" min="1" max="50" style="width:100px"/>	       
						          <input name="dsIdSanPham" value="${u.key.id}" style="display:none">
						        </div>	
							</div>
						</div>
		
					</div>
				</c:forEach>
			
			</div>
		
			<div   class="jumbotron " style="text-align:right;height:150px;padding-top:20px">
				  <h3>Tiền hàng:</h3>
				  <h4  id="tongTien"><fm:formatNumber type="currency">${tongTien}</fm:formatNumber>
				  </h4>
				  <input id="tongTienBuf" name = "tongTien" value="${tongTien}" style="display:none">
				  
			</div>		
			<button type="submit" class="btn btn-primary btn-block" value="d"> Đặt hàng</button>
			<button type="button" class="btn btn-secondary btn-block"><a style="color:white"" href="./dathang/huydonhang.htm">Hủy đơn hàng</a> </button>
		</f:form>
	</div>
  </section>
	<script type="text/javascript">
		function capNhatGia(){
			var tongTienBuf=document.getElementById("tongTienBuf");
			var tongTien = document.getElementById("tongTien");
			var thanhTien = 0;
		    var dsDonGia = document.getElementsByClassName('donGia');
			var dsSoLuong = document.getElementsByClassName("soLuong");
			var dsIdSP = document.getElementsByClassName("d")
			for(var i  = 0;i<dsDonGia.length;i++){
				thanhTien += Number(dsDonGia[i].getAttribute("donGia"))*dsSoLuong[i].value;
			}
			tongTien.innerHTML=thanhTien;
			tongTienBuf.setAttribute("value",thanhTien);
		}
	</script>
</body>
</html>