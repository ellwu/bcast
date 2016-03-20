<meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
<#import "/common/html.ftl" as html/>
<#import "/common/spring.ftl" as spring/>
<#assign base=request.contextPath/>

<!DOCTYPE html>
<html lang="en">
	<head>
		<@html.commonHead/>
		<title><@spring.message "count.byAdver.home.title"/></title>
		<script src="${base}/js/angular.js"></script>
	</head>
	<body>
		<div ng-app="myApp" ng-controller="appCtl">
			<@html.topMenu/>
			
			<@html.content>
				<div class="alert alert-success" role="alert" ng-hide="noTopMsg">{{ topMsg }}</div> 
				
				<#include "/count/byAdverQuery.ftl"/>
				
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
									<th><@spring.message "count.adverName.head"/></th> 
									<th><@spring.message "count.resourceOriginName.head"/></th> 
									<th><@spring.message "count.countTime.head"/></th> 
									<th><@spring.message "count.time.head"/></th> 
									<th><@spring.message "count.count.head"/></th> 
									<th><@spring.message "count.devices.head"/></th> 
								</tr> 
							</thead> 
							<tbody> 
								<tr ng-repeat="item in page.content">
								    <td>{{ item.adverName }}</td>
								    <td>{{ item.resourceOriginName }}</td>
								    <td>{{ item.countTime }}</td>
								    <td>{{ item.time }}</td>
								    <td>{{ item.count }}</td>
								    <td>{{ item.devices }}</td>
								  </tr>
							</tbody> 
						</table>
						</div>
					</div>
							  
					<div class="panel-footer">
					
					</div>
				</div>
				
			</@html.content>
			
			<script src="${base}/res.do?path=/count/byAdver.js"></script>
		</div>
	</body>
</html>