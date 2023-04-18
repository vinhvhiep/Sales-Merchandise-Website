<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<base href="${pageContext.servletContext.contextPath}/"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
  	<link rel="stylesheet" href= "<c:url value="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"></c:url>">
  	<link rel="stylesheet" href="<c:url value= "resource/css/style.css"> </c:url>"/>
  	<link rel="stylesheet" href= "<c:url value="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"></c:url>">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
  
  <title>WebSite bán hàng</title>
  
   <style>
  body {
    position: relative;
  }
  ul.nav-pills {
    top: 20px;
    position: fixed;
  }
  div.col-8 div {
    height: 500px;
  }
  </style>
</head>



<body>
	
	${message}
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
            <li class="nav-item" style="background-color: tomato;display: ${nguoidung}" >
              <a href="./dathang/${userId}.htm" class="nav-link" id="thanhtoan">  <i class="fa fa-shopping-basket" style="position: relative;"><span style="border-radius: 50%; background-color:green;color:white;right:65%;top:60%;position:absolute ;padding:1px 8px">${soSanPham}</span></i>Thanh Toán</a>         
            </li>
            <!-- Chức năng Đăng kí -->
            <li class="nav-item" style="display: ${chedo}">
              <a href="user/signup.htm" class="nav-link">Đăng ký</a>
            </li>
            <li class="nav-item" style="display: ${chedo}">
               <a href="user/signin.htm" class="nav-link">Đăng nhập</a>
            </li>
            <li class="nav-item" style="display: ${userId}">
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
          </ul>
          <form class="form-inline" action="/action_page.php">
            <div class="input-group">
               <input class="form-control" id="myInput" type="text" placeholder="Search..">
              <!-- <button class="btn" type="submit"> <span class="fa fa-search"></span></button> -->
            </div>
          </form> 
        </div>
      </nav>
    </div>
  </header>
  
<!--Phần chính chứa nội dung ở phía bên dưới nav-->
  <section class="section-main">
    <!--Phần menu các lựa chọn loại mặt hàng-->
    <aside class="side-menu">
      <ul class="mt-3">
        <li><i class="fa fa-angle-right"></i>
	 		<a class="nav-link active pt-0" href="user/index.htm?#section1">ĐỒ UỐNG</a>
        </li>
        <li><i class="fa fa-angle-right"></i>
			<a class="nav-link active pt-0" href="user/index.htm?#section2">THỰC PHẨM</a>
        </li>
        <li><i class="fa fa-angle-right"></i>
			<a class="nav-link active pt-0" href="user/index.htm?#section3">BÁNH KẸO</a>
        </li>
      </ul>
    </aside>
    <!--Phần chứa nội dung chi tiết của từng loại-->
    <section class="side-content">
      
      <!-- Khung băng chuyền quảng cáo-->
      <div class="carousel slide" data-ride="carousel">
        
        <!-- Indicators -->
        <ul class="carousel-indicators">
          <li data-target="#slides" data-slide-to="0" class="active"></li>
          <li data-target="#slides" data-slide-to="1"></li>
          <!-- <li data-target="#slides" data-slide-to="2"></li> -->
        </ul>
    
        <!-- The slideshow -->
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img src="https://cdn.tgdd.vn/bachhoaxanh/banners/2505/mua-ca-phe-boss-tang-oolong-12052020101455.jpg" alt="Los Angeles" >
          </div>
          <div class="carousel-item">
            <img src="https://cdn.tgdd.vn/bachhoaxanh/banners/2505/hoa-don-50000d-duoc-mua-san-pham-gia-soc-22-5-2205202011013.jpg" alt="Chicago" >
          </div>
        </div>
      </div>

      <!--Hiển thị sản phẩm-->
      <section class="featured-categories">
        <div class="container" id="myTable">
        	
       		<div class="title-box" id="section1">
            	<h2>THỨC UỐNG</h2>
          	</div>
			<div class="row">
	          	<c:forEach var="u" items="${dssanpham}">
				
					<c:if test="${u.loaiSanPham.id == 1}">					
			            <div class="col-md-3">
			              <div class="product-top">
				                <img src="resource/img/${u.hinhAnh}" alt="" >
				                <div class="overlay-right">
					                  <button type="button" class="btn btn-secondary" title="Quick short">
					                    	<i class="fa fa-eye "></i>
					                  </button>
					                  <button type="button" class="btn btn-secondary " title="Add to Wishlist">
					                    	<i class="fa fa-heart-o"></i>
					                  </button>
					                  <button type="button" class="btn btn-secondary" title="Add to Cart">				                    	
					                    	<a href="./dathang/${u.id}.htm?btn-dat"><i class="fa fa-shopping-cart"></i>  </a>
					                  </button>
			                	</div>
			              </div>
				
			              <div class="product-bottom">
			                <h3>${u.tenSP}</h3>
			                <h5> <fmt:formatNumber type="currency"> ${u.donGia} </fmt:formatNumber> </h5>
			              </div>
				
				       </div>
					
					</c:if>	
				</c:forEach>	
				
	          

           
            
          </div>
                  
          <div class="title-box" id="section2">
            <h2>THỰC PHẨM</h2>
          </div>

          <div class="row">
          <c:forEach var="u" items="${dssanpham}">
            <c:if test="${u.loaiSanPham.id == 2}">					
			            <div class="col-md-3">
			              <div class="product-top">
				                <img src="resource/img/${u.hinhAnh}" alt="" >
				                <div class="overlay-right">
					                  <button type="button" class="btn btn-secondary" title="Qhick short">
					                    	<i class="fa fa-eye "></i>
					                  </button>
					                  <button type="button" class="btn btn-secondary " title="Add to Wishlist">
					                    	<i class="fa fa-heart-o"></i>
					                  </button>
					                  
					                  <button type="button" class="btn btn-secondary" title="Add to Cart">
					                    	<a href="./dathang/${u.id}.htm?btn-dat"><i class="fa fa-shopping-cart"></i>  </a>
					                  </button>
					                
					                  
			                	</div>
			              </div>
				
			              <div class="product-bottom">
			                <h3>${u.tenSP}</h3>
			                <h5> <fmt:formatNumber type="currency"> ${u.donGia} </fmt:formatNumber> </h5>
			              </div>
				
				       </div>
					
					</c:if>	
					</c:forEach>	
           </div>
           
          <div class="title-box" id="section3">
            <h2>BÁNH KẸO</h2>
          </div>

          <div class="row">
          <c:forEach var="u" items="${dssanpham}">
            <c:if test="${u.loaiSanPham.id == 3}">					
	            <div class="col-md-3">
	              <div class="product-top">
		                <img src="resource/img/${u.hinhAnh}" alt="" >
		                <div class="overlay-right">
			                  <button type="button" class="btn btn-secondary" title="Qhick short">
			                    	<i class="fa fa-eye "></i>
			                  </button>
			                  <button type="button" class="btn btn-secondary " title="Add to Wishlist">
			                    	<i class="fa fa-heart-o"></i>
			                  </button>
			                  <button type="button" class="btn btn-secondary" title="Add to Cart">
			                    	<a href="./dathang/${u.id}.htm?btn-dat"><i class="fa fa-shopping-cart"></i>  </a>
			                  </button>
		               	</div>
	              </div>		
	              <div class="product-bottom">
	                <h3>${u.tenSP}</h3>
	                <h5> <fmt:formatNumber type="currency"> ${u.donGia} </fmt:formatNumber> </h5>
	              </div>		
		       </div>			
			</c:if>		
				</c:forEach>
            </div>
           
        </div>
      </section>
      

      
      <section class="footer">
  
        <div class="text-center">
            <div class="row">
  
              <div class="col-md">
                <h1>Userful Links</h1>
                <p>Privacy Policy</p>
                <p>Terms of Use</p>
                <p>Return Policy</p>
                <p>Discount Coupons</p>
              </div>
  
              <div class="col-md">
                <h1>Company</h1>
                <p>About Us</p>
                <p>Contact Us</p>
                <p>Career</p>
                <p>Affiliate</p>
              </div>
  
              <div class="col-md">
                <h1>Follow Us On</h1>
                <p><i class="fa fa-facebook-official"></i>   Facebook</p>
                <p><i class="fa fa-youtube-play"></i>   Youtube</p>
                <p><i class="fa fa-linkedin"></i>   Linked In</p>
                <p><i class="fa fa-twitter"></i>   Twitter</p>
              </div>
              
            </div>
        </div>
      </section>
      <div></div>
      <div></div>
      <div></div>
      

    </section>

  </section>

<script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable .col-md-3").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>	
</body>

</html>