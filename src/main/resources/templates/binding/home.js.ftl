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
	
	$scope.getDeviceInfo = function(){
		var deviceUrl = "${base}/device/findOne.do?deviceId=${RequestParameters["deviceId"]}";
	    
	    $.ajax({
			cache: true,
			type: 'POST',
			url: deviceUrl,
			async: false,
			error: function(req){
			},
			success: function(data){
				$scope.deviceItem = data;
			}
		});
	};
	
	$scope.getDeviceInfo();
	
	$scope.getData = function(){
	
		var historyUrl = "${base}/binding/history.do?deviceId=${RequestParameters["deviceId"]}&size=" + $scope.pageSize + "&page=" + $scope.pageIndex;
	    
	    $.ajax({
			cache: true,
			type: 'POST',
			url: historyUrl,
			async: false,
			error: function(req){
			},
			success: function(data){
				$scope.page = data;
			}
		});
    };
    
    $scope.getData();
    		
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
	
	//select option values begin
	$scope.options = {};
	
	$scope.optionsInit = function(){
		var optionsUrl = "${base}/lookup/values.do?categoryKey=DEVICE_STATUS";
	    
	    $http.get(optionsUrl).success(function (response) {
	    	$scope.options.statusOptions = response;
	    });
	    
	    optionsUrl = "${base}/lookup/values.do?categoryKey=DEVICE_BIND_STATUS";
	    
	    $http.get(optionsUrl).success(function (response) {
	    	$scope.options.bindStatusOptions = response;
	    });
	    
	    $scope.options.disableOptions = [{"value":0,"desc":"<@spring.message "prompt.enabled"/>"},{"value":1,"desc":"<@spring.message "prompt.disabled"/>"}];
	};
	
	$scope.optionsInit();
	
	//create action begin
	$scope.createMsg = "";
	$scope.createOk = true;
	
	$scope.create = function(item){
		$scope.createItem = item;
		
		$("#createModal").modal("show");
	};
	
	$scope.createConfirm = function(){
		$.ajax({
			cache: true,
			type: 'POST',
			url: "${base}/binding/create.do",
			data: $scope.createItem,
			async: false,
			error: function(req){
				$scope.createOk = false;
				$scope.createMsg = "Internal error. Please contact your administrator.";
			},
			success: function(data){
				if(data.status){
					$("#createModal").modal('hide');
					
					delete $scope.createItem;
					
					$scope.createOk = true;
					$scope.getData();
					
					$scope.showTopMsg(data.msg);
				}else{
					$scope.createMsg = data.msg;
					$scope.createOk = false;
				}
			}
		});
	};
	//create action end
	
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
	
	$scope.merchant.createMsg = "";
	$scope.merchant.createOk = true;
	
	$scope.merchant.bind = function(merchantId){
		var deviceUrl = "${base}/binding/bind.do?deviceId=${RequestParameters["deviceId"]}&merchantId="+merchantId;
	    
	    $.ajax({
			cache: true,
			type: 'POST',
			url: deviceUrl,
			async: false,
			error: function(req){
				$scope.merchant.createOk = false;
				$scope.merchant.createMsg = "Internal error. Please contact your administrator.";
			},
			success: function(data){
				if(data.status){
					$("#createModal").modal('hide');
					
					$scope.merchant.createOk = true;
					$scope.getData();
					
				}else{
					$scope.merchant.createMsg = data.msg;
					$scope.merchant.createOk = false;
				}
			}
		});
	};
	
});