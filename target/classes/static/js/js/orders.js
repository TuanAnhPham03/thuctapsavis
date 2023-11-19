var app = angular.module('orders', []);
app.controller('ctrl', function($scope, $http) {

    $scope.getOrder = function (id){
        $http.get("/don-hang/getdonhang/"+id).then(function (response){
            $scope.order = response.data
        })
        $scope.getProductinOrder(id)
    }

    $scope.getProductinOrder = function (id){
        $http.get("/don-hang/getproductinorder/"+id).then(function (response){
            $scope.products = response.data
        })
    }

    $scope.getTotal = function (){
        var totalPrice = 0;
        var products = $scope.products
        var sl = products.length
        for (let i = 0; i < sl; i++) {
            totalPrice += products[i].soLuong * products[i].donGiaSauGiam
        }
        return totalPrice;
    }

    $scope.getTotalProduct = function (){
        var total = 0;
        var products = $scope.products
        var sl = products.length
        for (let i = 0; i < sl; i++) {
            total += products[i].soLuong;
        }
        return total;
    }

    $scope.totalProdct = function (id){
        let total = 0
        // $http.get("/don-hang/total-product?id="+id).then(function (response){
        //     total = response.data
        // })
        return total
    }
    $scope.totalPrice = function (id){
        let total = 0
        // $http.get("/don-hang/total-price?id="+id).then(function (response){
        //     total = response.data
        // })
        return total
    }
})
