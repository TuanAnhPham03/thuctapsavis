var app = angular.module('index', []);
app.controller('ctrl', function ($scope, $http) {

    check = 1;
    urlFilter = "";
    $http.get("/sandal/product?page=0").then(function (response) {
        $scope.status = "Tất cả sản phẩm"
        console.log(response.data)
        $scope.page = response.data
        $scope.pageNumbers = response.data.totalPages
    })

    $http.get("/khuyenmai-sanpham/getall").then(function (response) {
        console.log(response.data)
        $scope.productsOnKhuyenMai = response.data
    })


    $scope.getPageNumbers = function () {
        $scope.getDonGiaSauGiam()
        if ($scope.pageNumbers <= 1) {
            document.getElementById("prev").style.display = "none"
            document.getElementById("next").style.display = "none"
        } else {
            let pages = []
            for (let i = 0; i < $scope.pageNumbers; i++) {
                pages.push(i)
            }
            return pages;
        }
    }

    $scope.filter = function () {

        if (confirm("Lọc sản phẩm ?")) {

            urlFilter = "/sandal/filter";

            if ($scope.min == undefined || $scope.min.length == 0) $scope.min = "";
            if ($scope.max == undefined || $scope.max.length == 0) $scope.max = "";
            if ($scope.thuongHieu == undefined || $scope.thuongHieu.length == 0) $scope.thuongHieu = "";
            if ($scope.danhMuc == undefined || $scope.danhMuc.length == 0) $scope.danhMuc = "";

            if ($scope.min == "" && $scope.max == "" && $scope.thuongHieu == "" && $scope.danhMuc == "") {

                check = 1;
                $scope.status = "Tất cả sản phẩm"
                $http.get("/sandal/product?page=0").then(function (response) {
                    $scope.status = "Tất cả sản phẩm"
                    console.log(response.data)
                    $scope.page = response.data
                    $scope.pageNumbers = response.data.totalPages
                    document.getElementById("next").style.display = "inline"
                    alert("Không có điều kiện lọc")
                })

            } else {

                if($scope.pageNumbers == 0) {
                    for (let i = 0; i < $scope.pageNumbers; i++) {
                        document.getElementById(i).removeAttribute("class");
                    }
                }

                check = 2
                urlFilter += "?min=" + $scope.min + "&max=" + $scope.max + "&thuongHieu=" + $scope.thuongHieu + "&gioiTinh=" + $scope.danhMuc
                console.log(urlFilter)
                $http.get(urlFilter).then(function (response) {
                    console.log(response.data)
                    $scope.page = response.data
                    $scope.pageNumbers = response.data.totalPages
                    if($scope.pageNumbers > 1) document.getElementById("next").style.display = "inline"
                    document.getElementById("prev").style.display = "none"
                    $scope.getPageNumbers()
                    alert("Có " + response.data.totalElements + " sản phẩm liên quan")
                    $scope.status = "Có " + response.data.totalElements + " sản phẩm liên quan"
                })
                $scope.getDonGiaSauGiam()
            }
        }
    }

    $scope.getPage = function (pageNumber) {
        if ($scope.pageNumbers > 1) $scope.removeActive(pageNumber)
        var url = "/sandal/product?page=" + pageNumber;
        if (check == 2) url = urlFilter + "&page=" + pageNumber;
        console.log(url)
        $http.get(url).then(function (response) {
            console.log(response.data)
            $scope.page = response.data
        })
        $scope.getDonGiaSauGiam()
    }

    $scope.removeActive = function (pageNumber) {
        for (let i = 0; i < $scope.pageNumbers; i++) {
            document.getElementById(i).removeAttribute("class");
        }

        // disabled prev
        if (pageNumber <= 0) document.getElementById("prev").style.display = "none"
        else document.getElementById("prev").style.display = "inline"
        // disabled next
        if (pageNumber >= $scope.pageNumbers - 1) document.getElementById("next").style.display = "none"
        else document.getElementById("next").style.display = "inline"
        //Add class active
        document.getElementById(pageNumber).setAttribute("class", "active")
    }

    $scope.getDonGiaSauGiam = function (){
        var donGia = document.getElementsByClassName("price")
        var product = $scope.productsOnKhuyenMai
        console.log("donGia"+donGia.length)
        for (let i =0;i<donGia.length;i++){
            console.log(donGia[i].id)
            for (let j = 0;j<product.length;j++){
                if(donGia[i].id == product[j].sanPham.id){
                    console.log("aa")
                    donGia[i].style.textDecoration = "line-through"
                    var donGiaSauGiam = product[j].sanPham.giaBan - (product[j].sanPham.giaBan*(product[j].khuyenMai.mucGiam / 100))
                    document.getElementById("sauGiam"+donGia[i].id).innerText = donGiaSauGiam.toLocaleString('it-IT', {style : 'currency', currency : 'VND'});
                }
            }
        }
    }
});
