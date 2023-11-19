var app = angular.module('checkout', []);
app.controller('ctrl', function($scope, $http) {
        $http.get("/gio-hang/getTotalProduct").then(function (response){
            $scope.totalProduct = response.data
        })
        $http.get("/gio-hang/getTotalPrice").then(function (response){
            $scope.totalPrice = response.data
        })
})