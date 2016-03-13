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

Date.prototype.Format = function(fmt)   
{ //author: meizz   
  var o = {   
    "M+" : this.getMonth()+1,                 //月份   
    "d+" : this.getDate(),                    //日   
    "h+" : this.getHours(),                   //小时   
    "m+" : this.getMinutes(),                 //分   
    "s+" : this.getSeconds(),                 //秒   
    "q+" : Math.floor((this.getMonth()+3)/3), //季度   
    "S"  : this.getMilliseconds()             //毫秒   
  };   
  if(/(y+)/.test(fmt))   
    fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));   
  for(var k in o)   
    if(new RegExp("("+ k +")").test(fmt))   
  fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));   
  return fmt;   
};

app.filter("targetStatus", function(){
	return function(input){
		input = input.replace(/\-/g,'').substring(0, 10);
		var now = parseInt(new Date().Format('yyyyMMdd'));
		return parseInt(input) >= now ? '<@spring.message "target.target.flag"/>' : '<@spring.message "target.untarget.flag"/>';
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
    
    //multi select begin
	$scope.choseArr=[];
	
	var aFlag = '';
	
	$scope.x=false;
	
	$scope.all= function (box, items) {
		if(box == true){
			$scope.x = true;
			
			for(var i = 0; i < items.length; i++){
    			$scope.choseArr.push(items[i]);
    		}
		}else{
			$scope.x = false;
			$scope.choseArr = [];
		}
    };
    
    $scope.chk= function (box, item) {
    	
    	for(var i = 0; i < $scope.choseArr.length; i++){
    		if($scope.choseArr[i].id == item.id){
    			$scope.choseArr.splice(i, 1);
    			break;
    		}
    	}
    	
    	if(box == true){
    		$scope.choseArr.push(item);
    	}
    };
    
    $scope.multiDelete = function(){
    	
    	$scope.mDeletePrompt = '';
    	
    	for(var i = 0; i < $scope.choseArr.length; i++){
    		$scope.mDeletePrompt += ' ' + $scope.choseArr[i].resource;
    	}
    	
    	$("#mDeleteModal").modal("show");
    };
    
    
	$scope.mDeleteConfirm = function(){
		
		for(var i = 0; i < $scope.choseArr.length; i++){
			$.ajax({
				cache: true,
				type: 'POST',
				url: "${base}/target/delete.do",
				data: $scope.choseArr[i],
				async: false,
				error: function(req){
				},
				success: function(data){
					if(data.status){
						$scope.getData();
					}
				}
			});
		}
		
		$("#mDeleteModal").modal('hide');
	};
        
    //multi select end
});