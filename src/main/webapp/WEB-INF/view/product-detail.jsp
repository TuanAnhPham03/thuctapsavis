<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<body ng-app="product-detail" ng-controller="ctrl">
<div class="colorlib-loader"></div>
<div id="page">
    <jsp:include page="navbar.jsp"></jsp:include>

    <div class="breadcrumbs">
        <div class="container">
            <div class="row">
                <div class="col">
                    <p class="bread"><span><a href="index.jsp">Trang Chủ</a></span> / <span>Chi Tiết Sản Phẩm</span></p>
                </div>
            </div>
        </div>
    </div>


    <div class="colorlib-product">
        <div class="container ">
            <div class="row row-pb-lg product-detail-wrap d-flex justify-content-center">
                <div class="col-sm-6 ">
                    <div class="owl-carousel">
                        <div class="item">
                            <div class="product-entry border">
                                <a class="prod-img">
                                    <img src="/images/${product.anh}" class="img-fluid"
                                         alt="Free html5 bootstrap 4 template">
                                </a>
                            </div>
                        </div>
                        <div class="item">
                            <div class="product-entry border">
                                <a href="#" class="prod-img">
                                    <img src="/images/${product.anh}" class="img-fluid"
                                         alt="Free html5 bootstrap 4 template">
                                </a>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="col-sm-5">
                    <div class="product-desc">
                        <h3>${product.ten}</h3>
                        <p class="price">
                            <span id="price"><fmt:formatNumber pattern="#,### VNĐ" value="${product.giaBan}"
                                                    type="currency"/></span>
                            <span id="donGiaSauGiam"></span>
                        </p>
                        <p>Chất Liệu: ${product.chatLieu}</p>
                        <div class="size-wrap">
                            <div class="block-26 mb-4">
                                <h4>Màu Sắc</h4>
                                <ul class="d-flex justify-content-start">
                                    <c:forEach items="${colors}" var="c">
                                        <div class="text-center"
                                             style="background-color: ${c.ma};height: 30px;width: 50px;margin-right: 10px;border: 1px solid"
                                             ng-click="showColorName('${c.ten}','${c.id}')"
                                        >
                                        </div>
                                    </c:forEach>
                                </ul>
                                <p id="colorName"></p>
                            </div>
                            <div class="block-26 mb-2">
                                <div class="d-flex justify-content-between">
                                    <h4>Size</h4>
                                    <p data-toggle="modal" data-target="#exampleModal" style="cursor: pointer">
                                        Hướng dẫn chọn size
                                    </p>
                                </div>
                                <div class="d-flex flex-row">
                                    <c:forEach items="${sizes}" var="s">
<%--                                        <li><a href="#" style="color: black">${s.ma}</a></li>--%>
                                        <label class="btn btn-light active p-2">
                                            <input type="radio" name="sizes" id="${s.id}" autocomplete="off" ng-click="getKichThuoc('${s.id}')" disabled > ${s.ma}
                                        </label>
                                    </c:forEach>
                                </div>
                                <p>{{soLuongStatus}}</p>
                            </div>
                        </div>
                        <div class="input-group mb-4">
                     	<span class="input-group-btn">
                        	<button type="button" class="quantity-left-minus btn" data-type="minus" data-field="">
                           <i class="icon-minus2"></i>
                        	</button>
                    		</span>
                            <input type="text" id="quantity" name="quantity" class="form-control input-number" value="1"
                                   min="1" >
                            <span class="input-group-btn ml-1">
                        	<button type="button" class="quantity-right-plus btn" data-type="plus" data-field="">
                             <i class="icon-plus2"></i>
                         </button>
                     	</span>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 text-center">
                                <p class="addtocart"><a ng-click="addToCart()" style="color: white" class="btn btn-primary btn-addtocart" id="btnAdd" ><i
                                        class="icon-shopping-cart"></i>Thêm vào giỏ hàng</a></p>
                            </div>
                            <div class="col-sm-12 text-center">
                                <p class="addtocart"><a ng-click="muaNgay()" style="color: white" class="btn btn-primary btn-addtocart" >Mua Ngay</a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-12">
                    <div class="row">
                        <div class="col-md-12 pills">
                            <div class="bd-example bd-example-tabs">
                                <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">

                                    <li class="nav-item">
                                        <a class="nav-link active" id="pills-description-tab" data-toggle="pill"
                                           href="#pills-description" role="tab" aria-controls="pills-description"
                                           aria-expanded="true">Mô Tả</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="pills-manufacturer-tab" data-toggle="pill"
                                           href="#pills-manufacturer" role="tab" aria-controls="pills-manufacturer"
                                           aria-expanded="true">Manufacturer</a>
                                    </li>
                                </ul>

                                <div class="tab-content" id="pills-tabContent">
                                    <div class="tab-pane border fade show active" id="pills-description" role="tabpanel"
                                         aria-labelledby="pills-description-tab">
                                        ${product.moTa}
                                    </div>

                                    <div class="tab-pane border fade" id="pills-manufacturer" role="tabpanel"
                                         aria-labelledby="pills-manufacturer-tab">
                                        <p>Even the all-powerful Pointing has no control about the blind texts it is an
                                            almost unorthographic life One day however a small line of blind text by the
                                            name of Lorem Ipsum decided to leave for the far World of Grammar.</p>
                                        <p>When she reached the first hills of the Italic Mountains, she had a last view
                                            back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet
                                            Village and the subline of her own road, the Line Lane. Pityful a rethoric
                                            question ran over her cheek, then she continued her way.</p>
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


<!-- //---------------------------------------------------------------- -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Hướng Dẫn Chọn Size</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="d-flex justify-content-between">
                    <h5>Độ dài bàn chân:</h5>
                    <h5> {{showLengthFoot}} CM </h5>
                </div>
                <input type="range" class="form-range" min="20" max="32" step="0.5" ng-model="lengthFoot"
                       style="width: 100%;" ng-change="showLength()">
                <h5 ng-repeat="k in kichThuoc">Size phù hợp là: {{k.ma}}</h5>
                <hr>
                <img src="/images/lengthFoot.jpg " style="width: 70%; height: 150px; margin-left: 15%;"
                     class="text-center"/>
                <p class="text-center font-italic">Hướng dẫn đo chiều dài bàn chân</p>
            </div>
        </div>
    </div>
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
<script src="/js/js/product-detail.js"></script>

<script>
    $(document).ready(function () {
        var quantitiy = 0;
        $('.quantity-right-plus').click(function (e) {
            // Stop acting like a button
            e.preventDefault();
            // Get the field name
            var quantity = parseInt($('#quantity').val());
            // If is not undefined
            $('#quantity').val(quantity + 1);
            // Increment
        });
        $('.quantity-left-minus').click(function (e) {
            // Stop acting like a button
            e.preventDefault();
            // Get the field name
            var quantity = parseInt($('#quantity').val());
            // If is not undefined
            // Increment
            if (quantity > 0) {
                $('#quantity').val(quantity - 1);
            }
        });
    });

    function showColorName(colorName) {
        document.getElementById("colorName").innerText = colorName
    }
</script>


</body>
</html>

