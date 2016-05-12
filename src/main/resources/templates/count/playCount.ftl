<meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
<#import "/common/html.ftl" as html/>
<#import "/common/spring.ftl" as spring/>
<#assign base=request.contextPath/>

<!DOCTYPE html>
<html lang="en">
	<head>
		<@html.commonHead/>
		<title><@spring.message "count.byResource.home.title"/></title>
		<script src="${base}/js/angular.js"></script>
    
		<link href="${base}/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
		<script src="${base}/js/bootstrap-datetimepicker.js"></script>
		<script src="${base}/js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
	</head>
	<body>
		<div ng-app="myApp" ng-controller="appCtl">
			<@html.topMenu/>
			
			<@html.content>
				<div class="alert alert-success" role="alert" ng-hide="noTopMsg">{{ topMsg }}</div> 
				
				<div class="row">
					<div class="col-xs-6 col-md-6">
						<form role="form" id="queryForm" class="form-horizontal">
							<div class="form-group">
								  <label class="col-sm-3 control-label" for="sn"><@spring.message "count.adverId.label"/></label>
								  <div class="col-sm-9">
									<div class="input-group">
							        	<input type="text" class="form-control" id="adverName" ng-model="queryItem.adverName" name="adverName" placeholder="<@spring.message "count.adverId.placeholder"/>" readonly>
							        	<input type="hidden" class="form-control" id="adverId" ng-model="queryItem.adverId" name="adverId">
							        	<span class="input-group-btn">
								        	<button type="button" class="btn btn-default" ng-click="searchAdver()"><@spring.message "prompt.search"/></button>
								      	</span>
							   		 </div>
							   		 
								  </div>
							</div>
							
							<div class="form-group">
								  <label class="col-sm-3 control-label" for="sn"><@spring.message "count.merchantId.label"/></label>
								  <div class="col-sm-9">
								  
							      	<div class="input-group">
										<input type="text" class="form-control" id="merchantName" ng-model="queryItem.merchantName" name="merchantName" placeholder="<@spring.message "count.merchantId.placeholder"/>" readonly>
							        	<input type="hidden" class="form-control" id="merchantId" ng-model="queryItem.merchantId" name="merchantId">
							        	<span class="input-group-btn">
								        	<button type="button" class="btn btn-default" ng-click="searchMerchant()"><@spring.message "prompt.search"/></button>
								      	</span>
								    </div>
								   </div>
							</div>
							
							<div class="form-group">
						      <label class="col-sm-3 control-label" for="beginTime"><@spring.message "count.countTime.head"/></label>
						      <div class="col-sm-3">
						        <input type="text" class="form-control" id="beginTime" ng-model="queryItem.beginTime" name="beginTime" placeholder="<@spring.message "target.beginTime.placeholder"/>">
						   	  </div>
						   	  <div class="col-sm-3">
						        <input type="text" class="form-control" id="endTime" ng-model="queryItem.endTime" name="endTime" placeholder="<@spring.message "target.endTime.placeholder"/>">
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
								  <label class="col-sm-3 control-label" for="name"></label>
								  <div class="col-sm-9">
									<button type="button" class="btn btn-primary" ng-click="query()"><@spring.message "prompt.query"/></button>
									<button type="button" class="btn btn-primary" ng-click="resetQuery()"><@spring.message "prompt.reset"/></button>
								  </div>
							</div>
						</form>
					</div>
				</div>
				
				
				  
				
				<div class="panel panel-default">
					<div class="panel-heading">
						<div class="btn-group" role="group" aria-label="...">
						</div>
						<div class="btn-group" role="group" aria-label="...">
							<button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" id="perPageBtn" aria-expanded="false">					
								<span data-type="selected-text">{{ pageSize }} <@spring.message "prompt.perPage"/></span>
								<span class="caret"></span>						
							</button>
	
							<ul class="dropdown-menu" role="menu" aria-labelledby="perPageBtn">		
								<li role="presentation">
									<a role="menuitem" tabindex="-1" ng-click="perPage(5)">5 <@spring.message "prompt.perPage"/></a>
								</li>			
								<li role="presentation">
									<a role="menuitem" tabindex="-1" ng-click="perPage(10)">10 <@spring.message "prompt.perPage"/></a>
								</li>			
								<li role="presentation">
									<a role="menuitem" tabindex="-1" ng-click="perPage(20)">20 <@spring.message "prompt.perPage"/></a>
								</li>		
								<li role="presentation">
									<a role="menuitem" tabindex="-1" ng-click="perPage(30)">30 <@spring.message "prompt.perPage"/></a>
								</li>											
								<li role="presentation">
									<a role="menuitem" tabindex="-1" ng-click="perPage(50)">50 <@spring.message "prompt.perPage"/></a>
								</li>
							</ul>
						</div>
						<div class="btn-group pull-right" role="group" aria-label="...">
							<button type="button" class="btn btn-default" ng-click="previous()" ng-disabled="page.first"><@spring.message "prompt.previous"/></button>
							<button type="button" class="btn btn-default"ng-click="next()" ng-disabled="page.last"><@spring.message "prompt.next"/></button>
						</div>
					</div>
							
					<div class="panel-body">
						<div class="table-responsive">
					  	<table class="table table-bordered">
							<thead> 
								<tr> 
									<th><@spring.message "count.resourceName.head"/></th> 
									<th><@spring.message "count.adverName.head"/></th> 
									<th><@spring.message "count.merchantName.head"/></th>  
									<th><@spring.message "count.time.head"/></th>  
									<th><@spring.message "count.playcount.head"/></th>  
									<th><@spring.message "count.devices.head"/></th>  
								</tr> 
							</thead> 
							<tbody> 
								<tr ng-repeat="item in page.content">
								    <td>{{ item[0] }}</td>
								    <td>{{ item[1] }}</td>
								    <td>{{ item[2] }}</td>
								    <td>{{ item[3] }}</td>
								    <td>{{ item[4] }}</td>
								    <td>{{ item[5] }}</td>
								  </tr>
							</tbody> 
						</table>
						</div>
					</div>
							  
					<div class="panel-footer">
					
					</div>
				</div>
				
				<#include "/count/playCountPopup.ftl"/>
				
			</@html.content>
			
			<script src="${base}/res.do?path=/count/playCount.js"></script>
		</div>
	</body>
</html>