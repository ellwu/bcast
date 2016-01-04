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

			<div class="alert alert-info" role="alert" ng-hide="!hasMsg">{{ msg }}</div> 
			<form role="form" id="editForm" class="form-horizontal" action="${base}/resource/editResourceAndFile.do" method="POST" enctype="multipart/form-data">
			   <input type="hidden" ng-model="editItem.adverId" name="adverId"/>
			   
			   <div class="form-group">
			      <label class="col-sm-2 control-label" for="adver"><@spring.message "resource.adver.label"/></label>
			      <div class="col-sm-3">
			      	<div class="input-group">
			        	<input type="text" class="form-control" id="adver" ng-model="editItem.adver" name="adver" placeholder="<@spring.message "resource.adver.placeholder"/>" readonly>
			        	<span class="input-group-btn">
				        	<button type="button" class="btn btn-default" ng-click="searchAdver()"><@spring.message "prompt.search"/></button>
				      	</span>
			        </div>
			   	  </div>
			   </div>
			   
			   <div class="form-group">
			      <label class="col-sm-2 control-label" for="type"><@spring.message "resource.type.label"/></label>
			      <div class="col-sm-3">
			   	  	<select class="form-control" id="type" name="type" ng-model="editItem.type" ng-options="l.value as l.desc for l in options.typeOptions"></select>
			   	  </div>
			   </div>
			   
			   <div class="form-group">
			      <label class="col-sm-2 control-label" for="file"><@spring.message "resource.file.label"/></label>
			      <div class="col-sm-3">
			   	  	<div class="input-group">
				      <input id="photoCover" ng-model="editItem.originName" name="originName" class="form-control" type="text" readonly>
				      <span class="input-group-btn">
				        <button class="btn btn-default" type="button" onclick="$('input[id=lefile]').click();"><@spring.message "prompt.choose"/></button>
				      </span>
				    </div>
			   	  	<input id="lefile" name="file" type="file" style="display:none">
				    <script type="text/javascript">
						$('input[id=lefile]').change(function() {
							$('#photoCover').val($(this).val());
						});
					</script>
			   	  </div>
			   </div>
			   
			   <div class="form-group">
			      <label class="col-sm-2 control-label" for="category"><@spring.message "resource.category.label"/></label>
			      <div class="col-sm-3">
			        <select class="form-control" id="category" name="category" ng-model="editItem.category" ng-options="l.value as l.desc for l in options.categoryOptions"></select>
			   	  </div>
			   </div>
			   
			   <div class="form-group">
			      <label class="col-sm-2 control-label" for="duration"><@spring.message "resource.duration.label"/></label>
			      <div class="col-sm-2">
			        <input type="text" class="form-control" id="duration" ng-model="editItem.duration" name="duration" placeholder="<@spring.message "resource.duration.placeholder"/>">
			   	  </div>
			   </div>
			   
			   <div class="form-group">
			      <label class="col-sm-2 control-label" for="rangeAge"><@spring.message "resource.rangeAge.label"/></label>
			      <div class="col-sm-4">
			        <input type="text" class="form-control" id="rangeAge" ng-model="editItem.rangeAge" name="rangeAge" placeholder="<@spring.message "resource.rangeAge.placeholder"/>">
			   	  </div>
			   </div>
			   
			   <div class="form-group">
			      <label class="col-sm-2 control-label" for="rangeGroup"><@spring.message "resource.rangeGroup.label"/></label>
			      <div class="col-sm-4">
			        <input type="text" class="form-control" id="rangeGroup" ng-model="editItem.rangeGroup" name="rangeGroup" placeholder="<@spring.message "resource.rangeGroup.placeholder"/>">
			   	  </div>
			   </div>
			   
			   <div class="form-group">
			      <label class="col-sm-2 control-label"></label>
			      <div class="col-sm-6">
			        <button type="button" class="btn btn-primary" ng-click="editConfirm()"><@spring.message "prompt.edit"/></button>
			        <a class="btn btn-default" href="${base}/tofunc.do?key=F_RESOURCE_HOME"><@spring.message "prompt.return"/></a>
			   	  </div>
			   </div>
			   			   
			</form>
			
			<#include "/resource/queryAdvers.ftl"/>
				
			</@html.content>
			
			<script src="${base}/res.do?path=/resource/editResource.js&resourceId=${RequestParameters["resourceId"]}"></script>
			
		</div>
	</body>
</html>