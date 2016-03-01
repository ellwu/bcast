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
	</head>
	<body>
		<div ng-app="myApp" ng-controller="appCtl">
			<@html.topMenu/>
			
			<@html.content>
				<div class="alert alert-success" role="alert" ng-hide="noTopMsg">{{ topMsg }}</div> 
				
				<#include "/target/query.ftl"/>
				
				<div class="panel panel-default">
					<div class="panel-heading">
						<div class="btn-group" role="group" aria-label="...">
							<a class="btn btn-default" href="${base}/tofunc.do?key=F_CREATE_TARGET"><@spring.message "prompt.create"/></a>
							<a class="btn btn-default" ng-click="multiDelete()"><@spring.message "prompt.delete"/></a>
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
									<th><input type="checkbox" ng-model="master" ng-click="all(master, page.content)"</th> 	
									<th><@spring.message "target.resource.head"/></th> 									
									<th><@spring.message "target.merchant.head"/></th> 
									
									<th><@spring.message "target.beginTime.head"/></th> 									
									<th><@spring.message "target.endTime.head"/></th> 	
																
									<th><@spring.message "target.status.head"/></th>
									
									<th><@spring.message "table.head.action"/></th>
								</tr> 
							</thead> 
							<tbody> 
								<tr ng-repeat="item in page.content">
									<td>
										<input id="{{item.id}}" type="checkbox" ng-model="x" ng-checked="master" ng-click="chk(x, item)">
									</td>
								    <td>{{ item.resource }}</td>
								    <td>{{ item.merchant }}</td>
								    
								    <td>{{ item.beginTime | ldate }}</td>
								    <td>{{ item.endTime | ldate }}</td>
								    
								    <td>{{ item.endTime | targetStatus }}</td>
								    
								    <td>
								    	<a class="button glyphicon glyphicon-pencil" href="${base}/tofunc.do?key=F_EDIT_TARGET&targetId={{item.id}}"></a>
								    	<a class="button glyphicon glyphicon-remove" ng-click="delete(item)"></a>
								    </td>
								  </tr>
							</tbody> 
						</table>
						</div>
					</div>
							  
					<div class="panel-footer">
					
					</div>
				</div>
								
				<#include "/target/delete.ftl"/>
				<#include "/target/multiSelect.ftl"/>
				
			</@html.content>
			
			<script src="${base}/res.do?path=/target/home.js"></script>
		</div>
	</body>
</html>