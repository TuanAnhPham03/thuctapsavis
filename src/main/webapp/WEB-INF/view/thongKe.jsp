<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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

    <script src="https://cdnjs.cloudflare.com/ajax/libs/highcharts/7.1.3/highcharts.js"></script>

</head>

<body ng-app="thongke" ng-controller="ctrl" onload="${alert}">
<div id="page">
    <jsp:include page="navbar.jsp"></jsp:include>
    <div class="row container col-12 d-flex justify-content-center" style="margin-top: 50px">
        <div class="col-10 d-flex justify-content-start">
            Ngày bắt đầu:<input type="date" class="form-control col-2" id="firstDate">
            <span style="width: 50px"></span>
            Ngày kết thúc: <input type="date" class="form-control col-2" id="lastDate">
            <span style="width: 50px"></span>
            <button class="btn btn-success" ng-click="getByBanChayByDate()">Thống kê</button>
        </div>
        <div id="chart" class="col-10 container" style="margin-top: 50px"></div>
    </div>
    <hr class="container" style="border: 1px solid ">
    <div class="row container col-12 d-flex justify-content-center" style="margin-top: 50px">
        <div class="col-10 d-flex justify-content-start">
            Ngày bắt đầu:<input type="date" class="form-control col-2" id="first">
            <span style="width: 50px"></span>
            Ngày kết thúc: <input type="date" class="form-control col-2" id="last">
            <span style="width: 50px"></span>
            <button class="btn btn-success" ng-click="getByHangTonByDate()">Thống kê</button>
        </div>
        <div id="chart1" class="col-10 container" style="margin-top: 50px"></div>
        <div class="col-10 d-flex justify-content-start">
            <div class="col-8">
                <div class="product-name d-flex">
                    <div class="one-forth text-left">
                        <span style="margin-left: 20px;">Tên </span>
                    </div>
                    <div class="one-eight text-center">
                        <span>Giảm giá(%)</span>
                    </div>
                    <div class="one-eight text-center">
                        <span>Trạng thái</span>
                    </div>
                    <div class="one-eight text-center">
                        <span>Số SP</span>
                    </div>
                    <div class="one-eight text-center">
                        <span>Cập Nhật</span>
                    </div>
                    <div class="one-eight text-center px-4">
                        <span>Xóa</span>
                    </div>
                </div>
                <c:forEach items="${deals}" var="d">
                <div class="product-cart d-flex">
                    <div class="one-forth text-left">
                        <div class="display-tc">
                        <span style="margin-left: 20px;">${d.ten} </span>
                        </div>
                    </div>
                    <div class="one-eight text-center">
                        <div class="display-tc">
                        <span>${d.mucGiam}</span>
                        </div>
                    </div>
                    <div class="one-eight text-center">
                        <div class="display-tc">
                        <span>${d.trangThai == 1 ? "Hoạt động" : "Không hoạt động"}</span>
                        </div>
                    </div>
                    <div class="one-eight text-center">
                        <div class="display-tc">
                        <span>${d.getTotalProductOnDeal()}</span>
                        </div>
                    </div>
                    <div class="one-eight text-center">
                        <div class="display-tc">
                            <a href="/khuyen-mai/view-update/${d.id}" ><i
                                    class="fa-sharp fa-solid fa-pen-to-square"></i></a>
                        </div>
                    </div>
                    <div class="one-eight text-center">
                        <div class="display-tc">
                            <a href="/khuyen-mai/delete/${d.id}"  class="closed" onclick="return confirm('Xóa khuyến mại?')"></a>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
            <div class="col-4">
                <form:form cssClass="colorlib-form" action="/khuyen-mai/add" method="post" modelAttribute="KhuyenMai"
                onsubmit="return confirm('Thêm khuyến mại?')">
                    <div class="form-group col-12">
                        <label>Tên khuyến mại</label>
                        <form:input path="ten" cssClass="form-control"/>
                        <form:errors path="ten" element="p" cssStyle="color: red"/>
                    </div>
                    <div class="form-group col-12">
                        <label>Trạng thái</label>
                        <form:radiobutton path="trangThai" label="Áp dụng" value="1" checked="checked" />
                        <form:radiobutton path="trangThai" label="Không áp dụng" value="0"/>
                    </div>
                    <div class="form-group col-12">
                        <label>Mực giảm giá(%)</label>
                        <form:input path="mucGiam" cssClass="form-control"/>
                        <form:errors path="mucGiam" element="p" cssStyle="color: red"/>
                    </div>
                    <div class="form-group">
                        <label>Sản Phẩm</label>
                        <select class="form-control" multiple name="products">
                            <option value="{{p.sanPham.id}}" ng-repeat="p in productsHangTon">{{p.sanPham.ten}}</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-success">Thêm Khuyến Mại</button>
                </form:form>
            </div>
        </div>
    </div>

    <jsp:include page="footer.jsp"></jsp:include>
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

</body>

<script>

    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth() + 1; //January is 0!
    var yyyy = today.getFullYear();

    if (dd < 10) {
        dd = '0' + dd
    }

    if (mm < 10) {
        mm = '0' + mm
    }

    today = yyyy + '-' + mm + '-' + dd;
    console.log(today);
    document.getElementById("firstDate").value = today;
    document.getElementById("lastDate").value = today;
    document.getElementById("first").value = today;
    document.getElementById("last").value = today;

    var app = angular.module('thongke', []);
    app.controller('ctrl', function ($scope, $http) {
        $http.get("/sandal/top10-banchay?firstDate=" + today + "&lastDate=" + today).then(function (response) {
            $scope.products = response.data.content
            console.log(response.data)
            var soLuong = [], productNames = []

            for (let i = 0; i < $scope.products.length; i++) {
                soLuong.push($scope.products[i].totalProductInOrder);
                productNames.push($scope.products[i].sanPham.ten)
            }

            $scope.fillChart('chart', productNames, soLuong, "Top 10 Sản Phẩm Bán Chạy")
        })
        $http.get("/sandal/top10-hangton?firstDate=" + today + "&lastDate=" + today).then(function (response) {
            $scope.productsHangTon = response.data.content
            console.log(response.data)
            var soLuong = [], productNames = []

            for (let i = 0; i < $scope.productsHangTon.length; i++) {
                soLuong.push($scope.productsHangTon[i].totalProductInOrder);
                productNames.push($scope.productsHangTon[i].sanPham.ten)
            }

            $scope.fillChart('chart1', productNames, soLuong, "Top 10 Hàng Tồn")
        })


        $scope.getByBanChayByDate = function () {
            var firstDate = document.getElementById("firstDate").value
            var lastDate = document.getElementById("lastDate").value
            if (firstDate > lastDate) {
                alert("Ngày bắt đầu phải lớn hơn ngày kết thúc")
            } else {
                $http.get("/sandal/top10-banchay?firstDate=" + firstDate + "&lastDate=" + lastDate).then(function (response) {
                    $scope.products = response.data.content
                    console.log(response.data)
                    var soLuong = [], productNames = []

                    for (let i = 0; i < $scope.products.length; i++) {
                        soLuong.push($scope.products[i].totalProductInOrder);
                        productNames.push($scope.products[i].sanPham.ten)
                    }

                    $scope.fillChart('chart', productNames, soLuong, "Top 10 Sản Phẩm Bán Chạy")
                })
            }
        }
        $scope.getByHangTonByDate = function () {
            var firstDate = document.getElementById("first").value
            var lastDate = document.getElementById("last").value
            if (firstDate > lastDate) {
                alert("Ngày bắt đầu phải lớn hơn ngày kết thúc")
            } else {
                $http.get("/sandal/top10-hangton?firstDate=" + firstDate + "&lastDate=" + lastDate).then(function (response) {
                    $scope.productsHangTon = response.data.content
                    console.log(response.data)
                    var soLuong = [], productNames = []

                    for (let i = 0; i < $scope.productsHangTon.length; i++) {
                        soLuong.push($scope.productsHangTon[i].totalProductInOrder);
                        productNames.push($scope.productsHangTon[i].sanPham.ten)
                    }

                    $scope.fillChart('chart1', productNames, soLuong, "Top 10 Hàng Tồn")
                })
            }
        }


        $scope.fillChart = function (id, xAxis, data, title) {
            Highcharts.chart(id, {
                chart: {
                    type: "line",
                    // width : 2000
                },
                title: {
                    text: title
                },
                xAxis: {
                    categories: xAxis
                },
                tooltip: {
                    formatter: function () {
                        return this.x + ": " + this.y
                    }
                },
                series: [{
                    data: data
                }],
                plotOptions: {
                    series: {
                        label: {connectorAllowed: false}
                    }
                }
            })
        }
    })

</script>

</html>