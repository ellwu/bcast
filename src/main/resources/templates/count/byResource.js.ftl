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
		var listUrl = "${base}/count/listByResource.do?size=" + $scope.pageSize + "&page=" + $scope.pageIndex;
	    
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
	
	$scope.searchResource = function(){
	
		$("#searchResourceModal").modal("show");
	};
	
	//search action end
	
	//Resource query action begin
	$scope.query_Resource = {};
	
	//pageable table begin
	$scope.query_Resource.pageIndex = 0;
	$scope.query_Resource.pageSize = 10;
	
	$scope.query_Resource.getData = function(){
		var listUrl = "${base}/resource/list.do?size=" + $scope.query_Resource.pageSize + "&page=" + $scope.query_Resource.pageIndex;
	    
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
    	$scope.queryItem.resourceName = selectedResource.originName;
    	$scope.queryItem.resourceId = selectedResource.id;
    	
    	
		$("#searchResourceModal").modal("hide");
    };
    
	$scope.query_Resource.next = function(){
		$scope.query_Resource.pageIndex += 1;
		$scope.query_Resource.getData();
	};
	
	$scope.query_Resource.previous = function(){
		$scope.query_Resource.pageIndex -= 1;
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
	
});