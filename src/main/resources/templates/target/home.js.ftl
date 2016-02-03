<#import "/common/js.ftl" as js/>
<#import "/common/spring.ftl" as spring/>
<#assign base=request.contextPath/>

var app = angular.module('myApp', []);

app.filter("ldate", function(){
	return function(input){
		if(input){
			return input.substring(0, 10);
		}else{
			return '';
		}
	};
});

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
		var listUrl = "${base}/target/list.do?size=" + $scope.pageSize + "&page=" + $scope.pageIndex;
	    
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
	
	//delete action begin
	$scope.deleteItem = {};
	$scope.deleteMsg = "";
	$scope.deleteOk = true;
	
	$scope.delete = function(item){
		$scope.deleteItem = item;
		
		$("#deleteModal").modal("show");
	};
	
	$scope.deleteConfirm = function(){
		console.info($scope.deleteItem);
		
		$.ajax({
			cache: true,
			type: 'POST',
			url: "${base}/target/delete.do",
			data: $scope.deleteItem,
			async: false,
			error: function(req){
				$scope.deleteOk = false;
				$scope.deleteMsg = "Internal error. Please contact your administrator.";
			},
			success: function(data){
				if(data.status){
					$("#deleteModal").modal('hide');
					$scope.getData();
					
					$scope.showTopMsg(data.msg);
				}else{
					$scope.deleteMsg = data.msg;
					$scope.deleteOk = false;
				}
			}
		});
	};
	
	//delete action end
	
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
});