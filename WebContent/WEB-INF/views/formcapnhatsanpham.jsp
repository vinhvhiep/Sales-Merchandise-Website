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

		}
		.bentrai{
		    min-height: 650px; 
		    width: 30%;
		    font-size: 14px;
		    float: left; 
		    background-color: orange !important;
		}
		.benphai{
		    width: 69%;
		    min-height: 1050px;
		    float: right;
		    margin-left: 5px; 
		    background-color: darkred;
		}	
		strong{
			color: black;
		}
	</style>
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
          </ul>
          <form class="form-inline" action="/action_page.php">
            <div class="input-group">
              <input class="form-control" id="myInput" type="text" placeholder="Search..">
             <!--  <button class="btn" type="submit"> <span class="fa fa-search"></span></button> -->
            </div>
          </form> 
        </div>
      </nav>
    </div>
  </header>
<section class="section-main"  >

    <div class="bentrai" >
      <div class="container mt-3" >
      <f:form action="sanpham/insert.htm"  modelAttribute="sanpham"  method="POST"  enctype="multipart/form-data">
      		<f:input path="id" style="display:none"/>
	        <div class="form-group">       	
	          <label >Tên sản phẩm:</label>
	          <f:input type="text" class="form-control"  path = "tenSP"/>
	        </div>
	       	
	       	<div class=" form-group">
	          <label >Loại sản phẩm:</label>
	          <f:select   class="custom-select" path="loaiSanPham.id"  items="${loai}" itemValue="id" itemLabel="tenLoai" >
	          </f:select>
	        </div>
          
	        <label>Giá thành:</label>
	        <div class="input-group">         
	          <f:input type="number" class="form-control" path="donGia"/>	       
	          <div class="input-group-append" style="border-radius: 50px !important;">
	            <span class="input-group-text">VND</span>
	          </div>	
	        </div>
	        
	        <label for="myFile" class="mt-3">Hình ảnh:</label>
	        <div class="form-group">	  
	          <input type="file" id="myFile"  name ="photo" />
	          <label style="color: red"> ${message} </label>
	        </div>
	        
	        <div class="form-group">
	          <label for="comment">Mô tả:</label>
	          <f:textarea path="moTa" class="form-control" rows="5" id="comment" style="border-radius: 5px !important"></f:textarea>
	        </div>
	        <button type="submit" class="btn btn-danger">Cập nhật</button>
	     
		        <div class="progress mt-3" >
	    			<div class="progress-bar progress-bar-striped progress-bar-animated" style="width:100%"> 100% </div>
	  			</div>
	 
	         
        </f:form>
      </div>
   
    </div>


    <div class="benphai">
      <div class="container" id="myTable">
      	
	      	<div id="accordion" class="mt-3">
				<c:forEach var="u" items="${dsSanPham}">
				<div class="card" >
					
					<div class="card-header" style="padding:0" >
						<a class="card-link" data-toggle="collapse" href="#m${u.id}" >
							<div class="media " style="width:650px; float:left">
								<img src="./resource/img/${u.hinhAnh}" alt="${u.id}" class="m-3  "
									style="width: 60px;">
								<div class="media-body ">
									<h4 style="margin-top:20px;">
										<strong >${u.tenSP}</strong>  <small class="badge badge-secondary"><i><fm:formatNumber type="currency">${u.donGia}</fm:formatNumber> </i></small>
									</h4>
	
								</div>
								
							</div>
						</a>
						<div class="btn-group-vertical" style="float: right;z-index: 15">							       				
    						<a href="sanpham/update/${u.id}.htm?btn-sua"><button type="button" class="btn btn-warning" name = "btn-sua">Sửa</button> </a>						 															
							<a href="sanpham/delete/${u.id}.htm?btn-xoa"><button type="button" class="btn btn-warning" data-toggle="modal" data-target="#myModal" name = "btn-xoa">Xóa</button> </a>
							 
						</div>
					</div>
					<div id="m${u.id}" class="collapse" data-parent="#accordion">
				        <div class="card-body">
				          <span>${u.moTa}</span>
				        </div>
			      	</div>					
				</div>
				</c:forEach>
			</div>
			</div>  
			   	
      	
		
      </div>
      

    </div>

 </section>

 <div class="modal fade" id="myModal">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Cảnh báo</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
         	Bạn có chắc chắn muốn xóa sản phẩm này
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
         <button type="button" class="btn btn-primary" data-dismiss="modal">Hủy</button>
          <button type="button" class="btn btn-danger" data-dismiss="modal">Xóa</button>
         
        </div>
        
      </div>
    </div>



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
