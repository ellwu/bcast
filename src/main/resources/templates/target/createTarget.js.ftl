<#import "/common/js.ftl" as js/>
<#import "/common/spring.ftl" as spring/>
<#assign base=request.contextPath/>

var app = angular.module('myApp', []);
app.controller('appCtl', function($scope, $http) {

	//option values begin
	$scope.options = {};
	
	$scope.optionsInit = function(){
		var optionsUrl = "${base}/lookup/values.do?categoryKey=RESOURCE_CATEGORY";
	    
	    $http.get(optionsUrl).success(function (response) {
	    	$scope.options.categoryOptions = response;
	    });
	    
	    optionsUrl = "${base}/lookup/values.do?categoryKey=RESOURCE_TYPE";
	    
	    $http.get(optionsUrl).success(function (response) {
	    	$scope.options.typeOptions = response;
	    });
	    
	};
	
	$scope.optionsInit();
	
	//option values end
	
	//create action begin
	$scope.msg = "";
	$scope.hasMsg = false;
	
	$scope.createItem = {};
	
	$scope.createConfirm = function(){
		
		$.ajax({
			cache: true,
			type: 'POST',
			url: "${base}/target/create.do",
			data: $scope.createItem,
			async: false,
			error: function(req){
				$scope.createOk = false;
				$scope.createMsg = "Internal error. Please contact your administrator.";
			},
			success: function(data){
				if(data.status){
					delete $scope.createItem;
					$scope.createItem = {};
				}
				
				$scope.hasMsg = true;
				$scope.msg = data.msg;
			}
		});
	};
	//create action end
	
	//search action begin
	
	$scope.searchResource = function(){
		
		$scope.query_Resource.optionsInit();
	
		$("#searchResourceModal").modal("show");
	};
	
	$scope.searchMerchant = function(){
		
		$scope.query_Merchant.optionsInit();
	
		$("#searchMerchantModal").modal("show");
	};
	
	//search action end
	
	//adver query action begin
	$scope.query_Resource = {};
	
	//pageable table begin
	$scope.query_Resource.pageIndex = 0;
	$scope.query_Resource.pageSize = 10;
	
	$scope.query_Resource.getData = function(){
		var listUrl = "${base}/resource/list.do?size=" + $scope.pageSize + "&page=" + $scope.pageIndex;
	    
	    $.ajax({
			cache: true,
			type: 'POST',
			url: listUrl,
			data: $scope.query_Resource.queryItem,
			async: false,
			error: function(req){
			},
			success: function(data){
				$scope.query_Resource.page = data;
			}
		});
    };
    
    $scope.query_Resource.choose = function(selectedResource){
    	$scope.createItem.resource = selectedResource.originName;
    	$scope.createItem.resourceId = selectedResource.id;
    	
    	
		$("#searchResourceModal").modal("hide");
    };
    
	$scope.query_Resource.next = function(){
		$scope.query_Resource.pageIndex += 1;
		$scope.query_Resource.getData();
	};
	
	$scope.query_Resource.previous = function(){
		$scope.pageIndex -= 1;
		$scope.query_Resource.getData();
	};
	
	$scope.query_Resource.perPage = function(size){
		$scope.query_Resource.pageSize = size;
		$scope.query_Resource.pageIndex = 0;
		
		$scope.query_Resource.getData();
	};
	//pageable table end
	
	$scope.query_Resource.queryItem = {};
	
    $scope.query_Resource.query = function(){
    	$scope.query_Resource.getData();
    };
    
    $scope.query_Resource.resetQuery = function(){
    	$scope.query_Resource.queryItem = {};
    };
    
	//query action end
	
	//query option values begin
	$scope.query_Resource.options = {};
	
	$scope.query_Resource.optionsInit = function(){
		
	};
	
	$scope.query_Merchant = {};
	
	//pageable table begin
	$scope.query_Merchant.pageIndex = 0;
	$scope.query_Merchant.pageSize = 10;
	
	$scope.query_Merchant.getData = function(){
		var listUrl = "${base}/merchant/list.do?size=" + $scope.pageSize + "&page=" + $scope.pageIndex;
	    
	    $.ajax({
			cache: true,
			type: 'POST',
			url: listUrl,
			data: $scope.query_Merchant.queryItem,
			async: false,
			error: function(req){
			},
			success: function(data){
				$scope.query_Merchant.page = data;
			}
		});
    };
    
    $scope.query_Merchant.choose = function(selectedMerchant){
    	$scope.createItem.merchant = selectedMerchant.name;
    	$scope.createItem.merchantId = selectedMerchant.id;
    	
    	
		$("#searchMerchantModal").modal("hide");
    };
    
	$scope.query_Merchant.next = function(){
		$scope.query_Merchant.pageIndex += 1;
		$scope.query_Merchant.getData();
	};
	
	$scope.query_Merchant.previous = function(){
		$scope.query_Merchant.pageIndex -= 1;
		$scope.query_Merchant.getData();
	};
	
	$scope.query_Merchant.perPage = function(size){
		$scope.query_Merchant.pageSize = size;
		$scope.query_Merchant.pageIndex = 0;
		
		$scope.query_Merchant.getData();
	};
	//pageable table end
	
	$scope.query_Merchant.queryItem = {};
	
    $scope.query_Merchant.query = function(){
    	$scope.query_Merchant.getData();
    };
    
    $scope.query_Merchant.resetQuery = function(){
    	$scope.query_Merchant.queryItem = {};
    };
    
	//query action end
	
	//query option values begin
	$scope.query_Merchant.options = {};
	
	$scope.query_Merchant.optionsInit = function(){
		var optionsUrl = "${base}/lookup/values.do?categoryKey=MERCHANT_LEVEL";
	    
	    $http.get(optionsUrl).success(function (response) {
	    	$scope.query_Merchant.options.levelOptions = response;
	    });
	    
	    optionsUrl = "${base}/lookup/values.do?categoryKey=MERCHANT_CATEGORY";
	    
	    $http.get(optionsUrl).success(function (response) {
	    	$scope.query_Merchant.options.categoryOptions = response;
	    });
	    
	    $scope.query_Merchant.options.disableOptions = [{"value":0,"desc":"<@spring.message "prompt.enabled"/>"},{"value":1,"desc":"<@spring.message "prompt.disabled"/>"}];

	    
	};
	
	//query option values end
});