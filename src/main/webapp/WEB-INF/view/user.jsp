<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE HTML>
<html>

<head>
	<title>Footwear - Free Bootstrap 4 Template by Colorlib</title>
	<link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Rokkitt:100,300,400,700" rel="stylesheet">

	<!-- Animate.css -->
	<link rel="stylesheet" href="/css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="/css/icomoon.css">
	<!-- Ion Icon Fonts-->
	<link rel="stylesheet" href="/css/ionicons.min.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="/css/bootstrap.min.css">

	<!-- Magnific Popup -->
	<link rel="stylesheet" href="/css/magnific-popup.css">

	<!-- Flexslider  -->
	<link rel="stylesheet" href="/css/flexslider.css">

	<!-- Owl Carousel -->
	<link rel="stylesheet" href="/css/owl.carousel.min.css">
	<link rel="stylesheet" href="/css/owl.theme.default.min.css">

	<!-- Date Picker -->
	<link rel="stylesheet" href="/css/bootstrap-datepicker.css">
	<!-- Flaticons  -->
	<link rel="stylesheet" href="/fonts/flaticon/font/flaticon.css">

	<!-- Theme style  -->
	<link rel="stylesheet" href="/css/style.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0//css/all.min.css">

</head>

<body onload="${alert}">
<jsp:include page="navbar.jsp"></jsp:include>
	<div class="colorlib-product">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-xl-3">
					<div class="row text-center">
							<div class="form-group">
								<input class="form-control form-control-sm" id="upload" type="file"
									onchange="loadImg()" />
							</div>
						<div><img src="images/user.png" alt="" width="80%" style="border-radius: 140px;" id="imgUser">
						</div>
						<br>
						<div class="d-flex justify-content-center" style="width: 100%;">
							<p style="text-align: center;">User</p>
						</div>
					</div>
				</div>
				<div class="col-lg-9 col-xl-9" style="border-left: 1px solid rgb(140, 139, 139);">
					<h2 class="text-center">Thông Tin Tài Khoản</h2>

					<form:form action="/user/update/${user.id}" class="colorlib-form" method="post" modelAttribute="user" onsubmit="return confirm('Cập nhật thông tin?')">
						<div class="row">
							<div class="col-md-4">
								<div class="form-group">
									<label >Họ</label>
									<form:input path="ho" cssClass="form-control" palaceholder="Họ"/>
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label >Tên Đệm</label>
									<form:input path="tenDem" cssClass="form-control" palaceholder="Tên đệm"/>
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label >Tên</label>
									<form:input path="ten" cssClass="form-control" palaceholder="Tên"/>
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<label style="margin-right: 50px;">Giới Tính</label>
									<div style="margin-left: 100px;">
										<form:radiobutton path="gioiTinh" value="1" label="Nam"/>
										<form:radiobutton path="gioiTinh" value="0" label="Nữ"/>
									</div>
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<label>Ngày Sinh</label>
									<form:input path="ngaySinh" type="date" cssClass="form-control"/>
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<label >Số Điện Thoại</label>
									<form:input path="sdt" cssClass="form-control"/>
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<label >Email</label>
									<form:input path="email" cssClass="form-control"/>
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<label >Địa Chỉ</label>
									<form:input path="diaChi" cssClass="form-control" palaceholder="Địa chỉ"/>
								</div>
							</div>
						</div>
						<div class="row">
							<button class="btn btn-primary" style="margin-left: 84%;">Lưu thông tin</button>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
<!-- jQuery -->
<script src="/js/jquery.min.js"></script>
<!-- popper -->
<script src="/js/popper.min.js"></script>
<!-- bootstrap 4.1 -->
<script src="/js/bootstrap.min.js"></script>
<!-- jQuery easing -->
<script src="/js/jquery.easing.1.3.js"></script>
<!-- Waypoints -->
<script src="/js/jquery.waypoints.min.js"></script>
<!-- Flexslider -->
<script src="/js/jquery.flexslider-min.js"></script>
<!-- Owl carousel -->
<script src="/js/owl.carousel.min.js"></script>
<!-- Magnific Popup -->
<script src="/js/jquery.magnific-popup.min.js"></script>
<script src="/js/magnific-popup-options.js"></script>
<!-- Date Picker -->
<script src="/js/bootstrap-datepicker.js"></script>
<!-- Stellar Parallax -->
<script src="/js/jquery.stellar.min.js"></script>
<!-- Main -->
<script src="/js/main.js"></script>
<script>

	console.log('${user.ngaySinh}')

	function loadImg() {
		// document.getElementById('imgUser').src =  document.getElementById('upload').value
		// console.log( document.getElementById('upload').files[0])

		const reader = new FileReader()
		let files = document.getElementById('upload').files
		console.log(files.item(0).name)
		reader.onload = async (event) => {
			document.getElementById('imgUser').setAttribute('src', event.target.result)
		}
		reader.readAsDataURL(files[0])
		var fileName = document.getElementById('imgUser').src.split('/')
		console.log(fileName[fileName.length-1])
	}
	function load(){
		document.getElementById('imgUser').setAttribute('src','images/'+"women.jpg")
	}
</script>

</html>