<#import "/common/js.ftl" as js/>
<#import "/common/spring.ftl" as spring/>
<#assign base=request.contextPath/>

var app = angular.module('myApp', []);
app.controller('menusCtl', function($scope, $http) {
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
		var listUrl = "${base}/menu/list.do?size=" + $scope.pageSize + "&page=" + $scope.pageIndex;
	    
	    $http.get(listUrl).success(function (response) {
	    	$scope.page = response;
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
	$scope.options = [];
	
	$scope.optionsInit = function(){
		var optionsUrl = "${base}/menu/options.do";
	    
	    $http.get(optionsUrl).success(function (response) {
	    	$scope.options = response;
	    });
	};
	
	//select option values end
	
	//create action begin
	$scope.createMsg = "";
	$scope.createOk = true;
	
	$scope.create = function(item){
		$scope.createItem = item;
		
		$("#createModal").modal("show");
		
		$scope.optionsInit();
	};
	
	$scope.createConfirm = function(){
		$.ajax({
			cache: true,
			type: 'POST',
			url: "${base}/menu/create.do",
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
	
	//edit action begin
	$scope.editMsg = "";
	$scope.editOk = true;
	
	$scope.edit = function(item){
		$scope.editItem = item;
		
		$("#editModal").modal("show");
		
		$scope.optionsInit();
	};
	
	$scope.editConfirm = function(){
		
		$.ajax({
			cache: true,
			type: 'POST',
			url: "${base}/menu/edit.do",
			data: $scope.editItem,
			async: false,
			error: function(req){
				$scope.editOk = false;
				$scope.editMsg = "Internal error. Please contact your administrator.";
			},
			success: function(data){
				if(data.status){
					$("#editModal").modal('hide');
					
					delete $scope.editItem;
					
					$scope.editOk = true;
					$scope.getData();
					
					$scope.showTopMsg(data.msg);
				}else{
					$scope.editMsg = data.msg;
					$scope.editOk = false;
				}
			}
		});
	};
	
	//edit action end
	
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
			url: "${base}/menu/delete.do",
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
});