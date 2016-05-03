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
		var formData = new FormData();
		
		formData.append('file', $('input[type=file]')[0].files[0]);
		if($scope.createItem.adverId){
			formData.append('adverId', $scope.createItem.adverId);
		}
		if($scope.createItem.type){
			formData.append('type', $scope.createItem.type);
		}
		if($scope.createItem.category){
			formData.append('category', $scope.createItem.category);
		}
		if($scope.createItem.duration){
			formData.append('duration', $scope.createItem.duration);
		}
		if($scope.createItem.rangeAge){
			formData.append('rangeAge', encodeURI($scope.createItem.rangeAge));
		}
		if($scope.createItem.rangeGroup){
			formData.append('rangeGroup', encodeURI($scope.createItem.rangeGroup));
		}
		if($("#photoCover").val()){
			formData.append('originName', encodeURI($("#photoCover").val()));
		}
		
		$.ajax({
			cache: true,
			type: 'POST',
			url: "${base}/resource/createResourceAndFile.do",
			data: formData,
			contentType: false,
    		processData: false,
			async: false,
			error: function(req){
				$scope.hasMsg = true;
				$scope.msg = "Internal error. Please contact your administrator.";
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
		var listUrl = "${base}/adver/list.do?size=" + $scope.query_Adver.pageSize + "&page=" + $scope.query_Adver.pageIndex;
	    
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
    	$scope.createItem.adver = selectedAdver.name;
    	$scope.createItem.adverId = selectedAdver.id;
    	
    	
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