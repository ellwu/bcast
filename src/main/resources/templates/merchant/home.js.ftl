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
		var listUrl = "${base}/merchant/list.do?size=" + $scope.pageSize + "&page=" + $scope.pageIndex;
	    
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
		var optionsUrl = "${base}/lookup/values.do?categoryKey=MERCHANT_LEVEL";
	    
	    $http.get(optionsUrl).success(function (response) {
	    	$scope.options.levelOptions = response;
	    });
	    
	    optionsUrl = "${base}/lookup/values.do?categoryKey=MERCHANT_CATEGORY";
	    
	    $http.get(optionsUrl).success(function (response) {
	    	$scope.options.categoryOptions = response;
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
		$scope.optionsInit();
	};
	
	$scope.createConfirm = function(){
		$.ajax({
			cache: true,
			type: 'POST',
			url: "${base}/merchant/create.do",
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
			url: "${base}/merchant/edit.do",
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
			url: "${base}/merchant/delete.do",
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
	
	//target sequence action begin
	$scope.targets = {};
	$scope.targetsUrl = "${base}/merchant/targetSequence.do?merchantId=";
	$scope.targetsShowNow = true;
	
	$scope.targetsNow = function(){
		$scope.targetsUrl = "${base}/merchant/targetSequence.do?merchantId=";
		$scope.targetsShowNow = true;
		$scope.getTargets($scope.targetMerchantId);
	};
	
	$scope.targetsAll = function(){
		$scope.targetsUrl = "${base}/merchant/targetSequenceAll.do?merchantId=";
		$scope.targetsShowNow = false;
		$scope.getTargets($scope.targetMerchantId);
	};
	
	$scope.getTargets = function(merchantId){
		var listUrl = $scope.targetsUrl + merchantId;
	    
	    $.ajax({
			cache: true,
			type: 'POST',
			url: listUrl,
			async: false,
			error: function(req){
			},
			success: function(data){
				$scope.targets.data = data;
			}
		});
    };
	
	$scope.targetSequence = function(item){
		$scope.targets = {};
		
		$scope.getTargets(item.id);
		
		$scope.targetMerchantId = item.id;
		
		$("#targetModal").modal("show");
	};
	
	//target sequence action end
	
	//query action begin
	$scope.queryItem = {};
	
    $scope.query = function(){
    	$scope.getData();
    };
    
    $scope.resetQuery = function(){
    	$scope.queryItem = {};
    };
    
	//query action end
	
	//sequence action begin
	
	$scope.seqUp = function(index){
		if(index <= 0){
			return;
		}
	
		var currentItem = $scope.targets.data[index];
		var previousItem = $scope.targets.data[index - 1];
		
		$scope.switchSeq(currentItem, previousItem);
	};
	
	$scope.seqDown = function(index){
		if(index >= $scope.targets.data.length){
			return;
		}
		
		var currentItem = $scope.targets.data[index];
		var nextItem = $scope.targets.data[index + 1];
		
		$scope.switchSeq(currentItem, nextItem);
	};
	
	$scope.switchSeq = function(item, destItem){
		var listUrl = "${base}/merchant/switchTargetSeq.do?itemId=" + item.id + "&destItemId=" + destItem.id;
	    
	    $.ajax({
			cache: true,
			type: 'POST',
			url: listUrl,
			async: false,
			error: function(req){
			},
			success: function(data){
				$scope.getTargets(item.merchantId);
			}
		});
	};
	
	
	//sequence action end

	//devices action begin
	$scope.merchantDevices = function(item){
		$scope.devices = {};
		
		$scope.getDevices(item.id);
		
		$("#deviceModal").modal("show");
	};
	
	$scope.getDevices = function(merchantId){
		var listUrl = "${base}/device/merchant.do?merchantId=" + merchantId;
	    
	    $.ajax({
			cache: true,
			type: 'POST',
			url: listUrl,
			async: false,
			error: function(req){
			},
			success: function(data){
				$scope.devices.data = data;
			}
		});
    };
   //devices action end
   
   //init begin
   $scope.getData();
   //init end
   
   <#include "/common/address.ftl"/>
});