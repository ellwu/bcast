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
		var listUrl = "${base}/device/list.do?size=" + $scope.pageSize + "&page=" + $scope.pageIndex;
	    
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
			url: "${base}/device/create.do",
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
	};
	
	$scope.editConfirm = function(){
		
		$.ajax({
			cache: true,
			type: 'POST',
			url: "${base}/device/edit.do",
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
	
	//release action begin
	$scope.release = function(item){
		$scope.editItem = item;
		
		
		$scope.editMsg = "";
		$scope.editOk = true;
		$("#releaseModal").modal("show");
	};
	
	$scope.releaseConfirm = function(){
		
		$.ajax({
			cache: true,
			type: 'POST',
			url: "${base}/binding/release.do",
			data: $scope.editItem,
			async: false,
			error: function(req){
				$scope.editOk = false;
				$scope.editMsg = "Internal error. Please contact your administrator.";
			},
			success: function(data){
				if(data.status){
					$("#releaseModal").modal('hide');
					
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
	//release action end
	
	//delete action begin
	$scope.deleteItem = {};
	$scope.deleteMsg = "";
	$scope.deleteOk = true;
	
	$scope.delete = function(item){
		$scope.deleteItem = item;
		
		$scope.deleteMsg = "";
		$scope.deleteOk = true;
		$("#deleteModal").modal("show");
	};
	
	$scope.deleteConfirm = function(){
		console.info($scope.deleteItem);
		
		$.ajax({
			cache: true,
			type: 'POST',
			url: "${base}/device/delete.do",
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