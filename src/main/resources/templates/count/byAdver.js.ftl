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
		var listUrl = "${base}/count/listByAdver.do?size=" + $scope.pageSize + "&page=" + $scope.pageIndex;
	    
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
    
    //search action begin
	
	$scope.searchAdver = function(){
		
		$scope.query_Adver.optionsInit();
	
		$("#searchAdverModal").modal("show");
	};
	
	//search action end
	
	//adver query action begin
	$scope.query_Adver = {};
	
	//pageable table begin
	$scope.query_Adver.pageIndex = 0;
	$scope.query_Adver.pageSize = 10;
	
	$scope.query_Adver.getData = function(){
		var listUrl = "${base}/adver/list.do?size=" + $scope.pageSize + "&page=" + $scope.pageIndex;
	    
	    $.ajax({
			cache: true,
			type: 'POST',
			url: listUrl,
			data: $scope.query_Adver.queryItem,
			async: false,
			error: function(req){
			},
			success: function(data){
				$scope.query_Adver.page = data;
			}
		});
    };
    
    $scope.query_Adver.choose = function(selectedAdver){
    	$scope.queryItem.adverName = selectedAdver.name;
    	$scope.queryItem.adverId = selectedAdver.id;
    	
    	
		$("#searchAdverModal").modal("hide");
    };
    
	$scope.query_Adver.next = function(){
		$scope.query_Adver.pageIndex += 1;
		$scope.query_Adver.getData();
	};
	
	$scope.query_Adver.previous = function(){
		$scope.query_Adver.pageIndex -= 1;
		$scope.query_Adver.getData();
	};
	
	$scope.query_Adver.perPage = function(size){
		$scope.query_Adver.pageSize = size;
		$scope.query_Adver.pageIndex = 0;
		
		$scope.query_Adver.getData();
	};
	//pageable table end
	
	$scope.query_Adver.queryItem = {};
	
    $scope.query_Adver.query = function(){
    	$scope.query_Adver.getData();
    };
    
    $scope.query_Adver.resetQuery = function(){
    	$scope.query_Adver.queryItem = {};
    };
    
	//query action end
	
	//query option values begin
	$scope.query_Adver.options = {};
	
	$scope.query_Adver.optionsInit = function(){
		var optionsUrl = "${base}/lookup/values.do?categoryKey=ADVER_CATEGORY";
	    
	    $http.get(optionsUrl).success(function (response) {
	    	$scope.query_Adver.options.categoryOptions = response;
	    });
	    
	};
	
	//query option values end
});