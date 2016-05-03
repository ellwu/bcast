<#import "/common/js.ftl" as js/>
<#import "/common/spring.ftl" as spring/>
<#assign base=request.contextPath/>

var app = angular.module('myApp', []);
app.controller('appCtl', function($scope, $http) {
	$scope.noTopMsg = true;
	$scope.topMsg = "";
	
	$scope.showTopMsg = function(msg){
		$scope.topMsg = msg;
		$scope.noTopMsg = false;
		
		setTimeout(function(){
			$scope.noTopMsg = true;
		}, 2000);
	};

	//pageable table begin
	$scope.pageIndex = 0;
	$scope.pageSize = 10;
	
	$scope.getData = function(){
		var listUrl = "${base}/count/listByMerchant.do?size=" + $scope.pageSize + "&page=" + $scope.pageIndex;
	    
	    $.ajax({
			cache: true,
			type: 'POST',
			url: listUrl,
			data: $scope.queryItem,
			async: false,
			error: function(req){
			},
			success: function(data){
				$scope.page = data;
			}
		});
    };
    		
	$scope.next = function(){
		$scope.pageIndex += 1;
		$scope.getData();
	};
	
	$scope.previous = function(){
		$scope.pageIndex -= 1;
		$scope.getData();
	};
	
	$scope.perPage = function(size){
		$scope.pageSize = size;
		$scope.pageIndex = 0;
		
		$scope.getData();
	};
	//pageable table end
	
	//query action begin
	$scope.queryItem = {};
	
    $scope.query = function(){
    	$scope.getData();
    };
    
    $scope.resetQuery = function(){
    	$scope.queryItem = {};
    };
    
	//query action end
	
	//init begin
    $scope.getData();
    //init end
    
    //query action begin
	$scope.merchant = {};
	
	$scope.merchant.queryItem = {};
	
    $scope.merchant.query = function(){
    	$scope.merchant.getData();
    };
    
    $scope.merchant.resetQuery = function(){
    	$scope.merchant.queryItem = {};
    };
    
	//query action end
	
	//pageable table begin
	$scope.merchant.pageIndex = 0;
	$scope.merchant.pageSize = 10;
	
	$scope.merchant.getData = function(){
		var listUrl = "${base}/merchant/list.do?size=" + $scope.merchant.pageSize + "&page=" + $scope.merchant.pageIndex;
	    
	    $.ajax({
			cache: true,
			type: 'POST',
			url: listUrl,
			data: $scope.merchant.queryItem,
			async: false,
			error: function(req){
			},
			success: function(data){
				$scope.merchant.page = data;
			}
		});
    };
    
	$scope.merchant.next = function(){
		$scope.merchant.pageIndex += 1;
		$scope.merchant.getData();
	};
	
	$scope.merchant.previous = function(){
		$scope.merchant.pageIndex -= 1;
		$scope.merchant.getData();
	};
	
	$scope.merchant.perPage = function(size){
		$scope.merchant.pageSize = size;
		$scope.merchant.pageIndex = 0;
		
		$scope.merchant.getData();
	};
	//pageable table end
	
	//select option values begin
	$scope.merchant.options = {};
	
	$scope.merchant.optionsInit = function(){
		var optionsUrl = "${base}/lookup/values.do?categoryKey=MERCHANT_LEVEL";
	    
	    $http.get(optionsUrl).success(function (response) {
	    	$scope.merchant.options.levelOptions = response;
	    });
	    
	    optionsUrl = "${base}/lookup/values.do?categoryKey=MERCHANT_CATEGORY";
	    
	    $http.get(optionsUrl).success(function (response) {
	    	$scope.merchant.options.categoryOptions = response;
	    });
	    
	    $scope.merchant.options.disableOptions = [{"value":0,"desc":"<@spring.message "prompt.enabled"/>"},{"value":1,"desc":"<@spring.message "prompt.disabled"/>"}];
	};
	
	$scope.merchant.optionsInit();
	
	$scope.merchant.selectMerchant = function(item){
		$scope.queryItem.merchantId = item.id;
		$scope.queryItem.merchantName = item.name;
		
		console.info($scope.merchant.queryItem);
		
		$("#searchMerchantModal").modal("hide");
	};
	
	$scope.searchMerchant = function(){
		
		$scope.merchant.optionsInit();
	
		$("#searchMerchantModal").modal("show");
	};
});