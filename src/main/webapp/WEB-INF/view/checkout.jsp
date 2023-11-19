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

</head>

<body ng-app="checkout" ng-controller="ctrl">

	<div class="colorlib-loader"></div>

	<div id="page">
		<jsp:include page="navbar.jsp"></jsp:include>

		<div class="breadcrumbs">
			<div class="container">
				<div class="row">
					<div class="col">
						<p class="bread"><span><a href="index.jsp">Trang chủ</a></span> / <span>Thanh Toán</span></p>
					</div>
				</div>
			</div>
		</div>


		<div class="colorlib-product">
			<div class="container">
				<div class="row row-pb-lg">
					<div class="col-md-10 offset-md-1">
						<div class="process-wrap">
							<div class="process text-center ">
								<p><span>01</span></p>
								<h3>Giỏ Hàng</h3>
							</div>
							<div class="process text-center active">
								<p><span>02</span></p>
								<h3>Thanh Toán</h3>
							</div>
							<div class="process text-center">
								<p><span>03</span></p>
								<h3>Thanh Toán Thàng Công</h3>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-7">
						<form:form method="post" class="colorlib-form" action="/don-hang/thanh-toan/success" modelAttribute="DonHang" onsubmit=" return confirm('Xác nhận thanh toán?') ">
							<h2>Thông Tin Thanh Toán</h2>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label >Tên Người Nhận</label>
										<form:input path="tenNguoiNhan" cssClass="form-control" value="${sessionScope.user.getHoTen()}" />
									</div>
								</div>
								<div class="col-md-12">
									<div class="form-group">
										<label >Địa Chỉ</label>
										<form:input path="diaChi" cssClass="form-control" value="${sessionScope.user.diaChi}"/>
									</div>
								</div>
								<div class="col-md-12">
									<div class="form-group">
										<label >Số Điện Thoại</label>
										<form:input path="sdt" cssClass="form-control" value="${sessionScope.user.sdt}"/>
									</div>
								</div>
								<div class="col-md-12">
									<div class="form-group">
										<label >Phương Thức Thanh Toán</label>
										<br>
										<div class="d-flex justify-content-around">
											<div><form:radiobutton path="phuongThucTT" value="1" label="Khi nhận hàng" checked="true" /></div>
											<div><form:radiobutton path="phuongThucTT" value="0" label="Ngân hàng nội địa"/></div>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12 text-right">
									<p><button class="btn btn-primary">Đặt Hàng</button></p>
								</div>
							</div>
						</form:form>
					</div>

					<div class="col-lg-5">
						<div class="row">
							<div class="col-md-12">
								<div class="cart-detail">
									<h2>Thông Tin Giỏ Hàng</h2>
									<ul>
										<li>
											
											<ul>
												<li><span>Sản Phẩm</span> <span>{{totalProduct}}</span></li>
												<li><span>Tổng Tiền</span> <span>{{ totalPrice | currency : "" : 1}} VNĐ</span></li>
											</ul>
											
										</li>
										<li><span>Phí Vận Chuyển</span> <span>{{30000 | currency : "" : 1}} VNĐ</span></li>
										<li><span>Tổng Đơn Hàng</span> <span>{{ totalPrice+30000 | currency : "" : 1}} VNĐ</span></li>
									</ul>
								</div>
							</div>

							<div class="w-100"></div>

						</div>

					</div>
				</div>
			</div>
		</div>

		<jsp:include page="footer.jsp"></jsp:include>
	</div>

	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="ion-ios-arrow-up"></i></a>
	</div>

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
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
	<script src="/js/js/checkout.js"></script>
</body>

</html>