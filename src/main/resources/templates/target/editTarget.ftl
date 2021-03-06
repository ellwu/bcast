<meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
<#import "/common/html.ftl" as html/>
<#import "/common/spring.ftl" as spring/>
<#assign base=request.contextPath/>

<!DOCTYPE html>
<html lang="en">
	<head>
		<@html.commonHead/>
		<title><@spring.message "target.home.title"/></title>
		<script src="${base}/js/angular.js"></script>
		
		<link href="${base}/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
		<script src="${base}/js/bootstrap-datetimepicker.js"></script>
		<script src="${base}/js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
	</head>
	<body>
		<div ng-app="myApp" ng-controller="appCtl">
			<@html.topMenu/>
			
			<@html.content>
				
			<div class="alert alert-info" role="alert" ng-hide="!hasMsg">{{ msg }}</div> 
			<form role="form" id="createForm" class="form-horizontal">
			   <input type="hidden" ng-model="editItem.merchantId" name="merchantId"/>
			   <input type="hidden" ng-model="editItem.resourceId" name="resourceId"/>
			   
			   <div class="form-group">
			      <label class="col-sm-2 control-label" for="resource"><@spring.message "target.resource.label"/></label>
			      <div class="col-sm-3">
			      	<div class="input-group">
			        	<input type="text" class="form-control" id="resource" ng-model="editItem.resource" name="resource" placeholder="<@spring.message "target.resource.placeholder"/>" readonly>
			        	<span class="input-group-btn">
				        	<button type="button" class="btn btn-default" ng-click="searchResource()"><@spring.message "prompt.search"/></button>
				      	</span>
			        </div>
			   	  </div>
			   </div>
			   
			   <div class="form-group">
			      <label class="col-sm-2 control-label" for="merchant"><@spring.message "target.merchant.label"/></label>
			      <div class="col-sm-3">
			      	<div class="input-group">
			        	<input type="text" class="form-control" id="merchant" ng-model="editItem.merchant" name="merchant" placeholder="<@spring.message "target.merchant.placeholder"/>" readonly>
			        	<span class="input-group-btn">
				        	<button type="button" class="btn btn-default" ng-click="searchMerchant()"><@spring.message "prompt.search"/></button>
				      	</span>
			        </div>
			   	  </div>
			   </div>
			   
			   <div class="form-group">
			      <label class="col-sm-2 control-label" for="beginTime"><@spring.message "target.beginTime.label"/></label>
			      <div class="col-sm-3">
			        <input type="text" class="form-control" id="beginTime" ng-model="editItem.beginTime" name="beginTime" placeholder="<@spring.message "target.beginTime.placeholder"/>">
			   	  </div>
			   </div>
			   <script type="text/javascript">
				    $("#beginTime").datetimepicker({
				    	language: "zh-CN",
				    	format: 'yyyy-mm-dd',
				    	maxView: 'year',
				    	minView: 'month',
				    	autoclose: true,
				    	todayHighlight: true,
				    	pickerPosition: 'bottom-left'
				    });
				    
				</script>  
			   
			   <div class="form-group">
			      <label class="col-sm-2 control-label" for="endTime"><@spring.message "target.endTime.label"/></label>
			      <div class="col-sm-3">
			        <input type="text" class="form-control" id="endTime" ng-model="editItem.endTime" name="endTime" placeholder="<@spring.message "target.endTime.placeholder"/>">
			   	  </div>
			   </div>
			   <script type="text/javascript">
				    $("#endTime").datetimepicker({
				    	language: "zh-CN",
				    	format: 'yyyy-mm-dd',
				    	maxView: 'year',
				    	minView: 'month',
				    	autoclose: true,
				    	todayHighlight: true,
				    	pickerPosition: 'bottom-left'
				    });
				</script>     
			   
			   <div class="form-group">
			      <label class="col-sm-2 control-label"></label>
			      <div class="col-sm-6">
			        <button type="button" class="btn btn-primary" ng-click="editConfirm()"><@spring.message "prompt.edit"/></button>
			        <a class="btn btn-default" href="${base}/tofunc.do?key=F_TARGET_HOME"><@spring.message "prompt.return"/></a>
			   	  </div>
			   </div>
			   			   
			</form>
			
			<#include "/target/queryResource.ftl"/>
			<#include "/target/editQueryMerchant.ftl"/>
				
			</@html.content>
			
			<script src="${base}/res.do?path=/target/editTarget.js&targetId=${RequestParameters["targetId"]}"></script>
		</div>
	</body>
</html>