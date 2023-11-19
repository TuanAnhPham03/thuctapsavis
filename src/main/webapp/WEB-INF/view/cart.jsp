<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>

<head>
	<title>Footwear - Free Bootstrap 4 Template by Colorlib</title>
	<link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Rokkitt:100,300,400,700" rel="stylesheet">

	<!-- Animate.css -->
	<link rel="stylesheet" rel="stylesheet" href="/css/animate.css">
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

<body ng-app="cart" ng-controller="ctrl">

	<div class="colorlib-loader"></div>

	<div id="page">
		<jsp:include page="navbar.jsp"></jsp:include>

		<div class="breadcrumbs">
			<div class="container">
				<div class="row">
					<div class="col">
						<p class="bread"><span><a href="index.jsp">Trang chủ</a></span> / <span>Giỏ Hàng</span></p>
					</div>
				</div>
			</div>
		</div>


		<div class="colorlib-product">
			<div class="container">
				<div class="row row-pb-lg">
					<div class="col-md-10 offset-md-1">
						<div class="process-wrap">
							<div class="process text-center active">
								<p><span>01</span></p>
								<h3>Giỏ Hàng</h3>
							</div>
							<div class="process text-center">
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
				<div class="row row-pb-lg">
					<div class="col-md-12">
						<div class="product-name d-flex">

							<div class="one-forth text-left px-4">
								<span>Sản Phầm</span>
							</div>|

							<div class="one-eight text-center">
								<span>Phân loại</span>
							</div>|
							<div class="one-eight text-center">
								<span>Đơn Giá</span>
							</div>|
							<div class="one-eight text-center">
								<span>Đơn Giá Sau Giảm</span>
							</div>|
							<div class="one-eight text-center">
								<span>Số Lượng</span>
							</div>|
							<div class="one-eight text-center">
								<span>Thành Tiền</span>
							</div>|
							<div class="one-eight text-center px-4">
								<span>Xóa</span>
							</div>
						</div>
						<div class="product-cart d-flex" ng-repeat="p in productsInCart">
							<div class="one-forth text-left px-4">
								<a href="/sandal/detail/{{p.idSP}}" class="prod-img">
								<div class="product-img" style="background-image: url(/images/{{p.anh}});">
								</div>
								<div class="display-tc">
									<h3>{{p.ten}}</h3>
								</div>
								</a>
							</div>
							<div class="one-eight text-center">
								<div class="display-tc">
									<span class="price">{{p.size}} - {{p.mauSac}}</span>
								</div>
							</div>
							<div class="one-eight text-center">
								<div class="display-tc">
									<span class="price" style="text-decoration: line-through">{{ p.donGia | currency : "" : 0}} VNĐ</span>
								</div>
							</div>
							<div class="one-eight text-center">
								<div class="display-tc">
									<span class="price">{{ p.donGia - (p.donGia * (p.giamGia / 100)) | currency : "" : 0}} VNĐ</span>
								</div>
							</div>
							<div class="one-eight text-center">
								<div class="display-tc">
									<input type="button" id="quantity" ng-click="getUpdateSL(p.idCTSP,p.sl)" style="cursor: pointer" data-toggle="modal" data-target="#exampleModal"
										class="form-control input-number text-center" value="{{p.sl}}">
								</div>
							</div>
							<div class="one-eight text-center">
								<div class="display-tc">
									<span class="price">{{ (p.donGia - (p.donGia * (p.giamGia / 100))) * p.sl | currency : "" : 0}} VNĐ</span>
								</div>
							</div>
							<div class="one-eight text-center">
								<div class="display-tc">
									<a ng-click="removeProductIncart(p.idCTSP)" style="cursor: pointer" class="closed"></a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row row-pb-lg">
					<div class="col-md-12">
						<div class="total-wrap">
							<div class="row">
								<div class="col-sm-8">
									<a style="color: white;cursor: pointer" ng-click="thanhToan()" class="btn btn-primary">Thanh Toán</a>
								</div>
								<div class="col-sm-4 text-center">
									<div class="total">
										<div class="sub">
											<p><span>Tổng Tiền:</span> <span>{{ getTotal() | currency : "" : 1}} VNĐ</span></p>
											<p><span>Giảm Giá:</span> <span>{{ getTotalSoTienGiam() | currency : "" : 1}} VNĐ</span></p>
										</div>
										<div class="grand-total">
											<p><span><strong>Thành tiền:</strong></span> <span>{{ getTotal() - getTotalSoTienGiam() | currency : "" : 1}} VNĐ</span></p>
										</div>
									</div>
								</div>
							</div>
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


	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Update số lượng</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
				<input type="number" id="slUpdate" class="form-control">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal" ng-click="setUpdateSL()">Save changes</button>
				</div>
			</div>
		</div>
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
	<script src="/js/js/cart.js"></script>

</body>

<script>

</script>

</html>