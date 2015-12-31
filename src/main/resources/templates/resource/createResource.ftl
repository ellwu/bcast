<meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
<#import "/common/html.ftl" as html/>
<#import "/common/spring.ftl" as spring/>
<#assign base=request.contextPath/>

<!DOCTYPE html>
<html lang="en">
	<head>
		<@html.commonHead/>
		<title><@spring.message "resource.home.title"/></title>
		<script src="${base}/js/angular.js"></script>
	</head>
	<body>
		<div ng-app="myApp" ng-controller="appCtl">
			<@html.topMenu/>
			
			<@html.content>
				
				<div class="alert alert-danger" role="alert" ng-hide="createOk">{{ createMsg }}</div> 
			<form role="form" id="createForm" class="form-horizontal">
			   
			   <div class="form-group">
			      <label class="col-sm-2 control-label" for="adver"><@spring.message "resource.adver.label"/></label>
			      <div class="col-sm-3">
			        <input type="text" class="form-control" id="adver" ng-model="createItem.adver" name="adver" placeholder="<@spring.message "resource.adver.placeholder"/>">
			   	  </div>
			   </div>
			   
			   <div class="form-group">
			      <label class="col-sm-2 control-label" for="type"><@spring.message "resource.type.label"/></label>
			      <div class="col-sm-3">
			   	  	<select class="form-control" id="type" name="type" ng-model="createItem.type" ng-options="l.value as l.desc for l in options.typeOptions"></select>
			   	  </div>
			   </div>
			   
			   <div class="form-group">
			      <label class="col-sm-2 control-label" for="category"><@spring.message "resource.category.label"/></label>
			      <div class="col-sm-3">
			        <select class="form-control" id="category" name="category" ng-model="createItem.category" ng-options="l.value as l.desc for l in options.categoryOptions"></select>
			   	  </div>
			   </div>
			   
			   <div class="form-group">
			      <label class="col-sm-2 control-label" for="duration"><@spring.message "resource.duration.label"/></label>
			      <div class="col-sm-2">
			        <input type="text" class="form-control" id="duration" ng-model="createItem.duration" name="duration" placeholder="<@spring.message "resource.duration.placeholder"/>">
			   	  </div>
			   	  <div class="col-sm-2">
			        <@spring.message "resource.duration.unit"/>
			   	  </div>
			   </div>
			   
			    <div class="form-group">
			      <label class="col-sm-2 control-label" for="rangeAge"><@spring.message "resource.rangeAge.label"/></label>
			      <div class="col-sm-10">
			        <input type="text" class="form-control" id="rangeAge" ng-model="createItem.rangeAge" name="rangeAge" placeholder="<@spring.message "resource.rangeAge.placeholder"/>">
			   	  </div>
			   </div>
			   
			   <div class="form-group">
			      <label class="col-sm-2 control-label" for="rangeGroup"><@spring.message "resource.rangeGroup.label"/></label>
			      <div class="col-sm-10">
			        <input type="text" class="form-control" id="rangeGroup" ng-model="createItem.rangeGroup" name="rangeGroup" placeholder="<@spring.message "resource.rangeGroup.placeholder"/>">
			   	  </div>
			   </div>
			   			   
			</form>
				
			</@html.content>
			
			<script src="${base}/res.do?path=/resource/home.js"></script>
		</div>
	</body>
</html>