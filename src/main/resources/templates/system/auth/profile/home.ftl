<meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
<#import "/common/html.ftl" as html/>
<#import "/common/spring.ftl" as spring/>
<#assign base=request.contextPath/>

<!DOCTYPE html>
<html lang="en">
	<head>
		<@html.commonHead/>
		<title><@spring.message "profile.home.title"/></title>
		<script src="${base}/js/angular.js"></script>
	</head>
	<body>
		<div ng-app="myApp" ng-controller="appCtl">
			<@html.topMenu/>
			
			<@html.content>
				<h2><@spring.message "profile.home.subtitle"/></h2>
				<div class="panel panel-default">
					<div class="panel-heading">
						<div class="btn-group" role="group" aria-label="...">
							<button type="button" class="btn btn-default" data-toggle="modal" data-target="#createModal"><@spring.message "prompt.create"/></button>
							<button type="button" class="btn btn-default" data-toggle="modal" data-target="#modifyModal"><@spring.message "prompt.modify"/></button>
							<button type="button" class="btn btn-default" data-toggle="modal" data-target="#deleteModal"><@spring.message "prompt.delete"/></button>
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
					  	<table class="table table-bordered">
							<thead> 
								<tr> 
									<th>#</th>
									<th>Key</th> 
									<th>Value</th>
									<th>Prompt</th>
									<th>Desc</th> 
								</tr> 
							</thead> 
							<tbody> 
								<tr ng-repeat="p in page.content">
									<td><input type="checkbox" class="checkbox">
									</td>
								    <td>{{ p.key }}</td>
								    <td>{{ p.value }}</td>
								    <td>{{ p.prompt }}</td>
								    <td>{{ p.desc }}</td>
								  </tr>
							</tbody> 
						</table>
					</div>
							  
					<div class="panel-footer">
							  
					</div>
				</div>
				
				<div class="modal fade" id="createModal" tabindex="-1" role="dialog" aria-labelledby="createModalLabel" aria-hidden="true">
				   <div class="modal-dialog">
				      <div class="modal-content">
				         <div class="modal-header">
				            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				            <h4 class="modal-title" id="createModalLabel"><@spring.message "profile.home.createProfile"/></h4>
				         </div>
				         <div class="modal-body">            
							<form role="form" id="createForm">
							   <div class="form-group">
							      <label for="key">Key</label>
							      <input type="text" class="form-control" id="key" name="key" placeholder="请输入名称">
							   </div>
							   <div class="form-group">
							      <label for="value">Value</label>
							      <input type="text" class="form-control" id="value" name="value" placeholder="请输入名称">
							   </div>
							   <div class="form-group">
							      <label for="prompt">Prompt</label>
							      <input type="text" class="form-control" id="prompt" name="prompt" placeholder="请输入名称">
							   </div>	
							   <div class="form-group">
							      <label for="desc">Desc</label>
							      <input type="text" class="form-control" id="desc" name="desc" placeholder="请输入名称">
							   </div>							   
							</form>
				         </div>
				         <div class="modal-footer">
				            <button type="button" class="btn btn-default" data-dismiss="modal"><@spring.message "prompt.close"/></button>
				            <button type="button" class="btn btn-primary" ng-click="create()"><@spring.message "prompt.create"/></button>
				         </div>
				      </div>
					</div>
				</div>
				
				<div class="modal fade" id="modifyModal" tabindex="-1" role="dialog" aria-labelledby="modifyModalLabel" aria-hidden="true">
				   <div class="modal-dialog">
				      <div class="modal-content">
				         <div class="modal-header">
				            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				            <h4 class="modal-title" id="modifyModalLabel"><@spring.message "menu.home.modifyMenu"/></h4>
				         </div>
				         <div class="modal-body"> 
							<form role="form" id="modifyForm">
							   <div class="form-group">
							      <label for="key">Key</label>
							      <input type="text" class="form-control" id="key" name="key" placeholder="请输入名称">
							   </div>
							   <div class="form-group">
							      <label for="prompt">Prompt</label>
							      <input type="text" class="form-control" id="prompt" name="prompt" placeholder="请输入名称">
							   </div>
							   <div class="form-group">
							      <label for="sequence">Sequence</label>
							      <input type="text" class="form-control" id="sequence" name="sequence" placeholder="请输入名称">
							   </div>							   
							</form>
				         </div>
				         <div class="modal-footer">
				            <button type="button" class="btn btn-default" data-dismiss="modal"><@spring.message "prompt.close"/></button>
				            <button type="button" class="btn btn-primary"><@spring.message "prompt.modify"/></button>
				         </div>
				      </div>
					</div>
				</div>
				
				<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
				   <div class="modal-dialog">
				      <div class="modal-content">
				         <div class="modal-header">
				            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				            <h4 class="modal-title" id="deleteModalLabel"><@spring.message "menu.home.deleteMenu"/></h4>
				         </div>
				         <div class="modal-body">
							<form role="form" id="deleteForm">
							   <div class="form-group">
							      <label for="key">Key</label>
							      <input type="text" class="form-control" id="key" name="key" placeholder="请输入名称">
							   </div>					   
							</form>
				         </div>
				         <div class="modal-footer">
				            <button type="button" class="btn btn-default" data-dismiss="modal"><@spring.message "prompt.close"/></button>
				            <button type="button" class="btn btn-primary"><@spring.message "prompt.delete"/></button>
				         </div>
				      </div>
					</div>
				</div>
				
			</@html.content>
			
			<script>
				var app = angular.module('myApp', []);
				app.controller('appCtl', function($scope, $http) {
					$scope.pageIndex = 0;
					$scope.pageSize = 10;
					
					$scope.getData = function(){
						var listUrl = "${base}/profile/list.do?size=" + $scope.pageSize + "&page=" + $scope.pageIndex;
					    
					    $http.get(listUrl).success(function (response) {
					    	$scope.page = response;
					    });
				    };
				    
				    $scope.getData();
				    		
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
			    	
			    	$scope.create = function(){
			    		$.ajax({
			    			cache: true,
			    			type: 'POST',
			    			url: "${base}/profile/create.do",
			    			data: $("#createForm").serialize(),
			    			async: false,
			    			error: function(req){
			    			
			    			},
			    			success: function(data){
			    				$("#createModal").modal('hide');
			    				$("#createForm")[0].reset();
			    				$scope.getData();
			    			}
			    		});
			    	};
			    	
			    	$scope.update = function(){
			    		$.ajax({
			    			cache: true,
			    			type: 'POST',
			    			url: "${base}/profile/update.do",
			    			data: $("#modifyForm").serialize(),
			    			async: false,
			    			error: function(req){
			    			
			    			},
			    			success: function(data){
			    				$("#modifyModal").modal('hide');
			    				$("#modifyForm")[0].reset();
			    				$scope.getData();
			    			}
			    		});
			    	};
			    	
			    	$scope.delete = function(){
			    		$.ajax({
			    			cache: true,
			    			type: 'POST',
			    			url: "${base}/profile/create.do",
			    			data: $("#deleteForm").serialize(),
			    			async: false,
			    			error: function(req){
			    			
			    			},
			    			success: function(data){
			    				$("#deleteModal").modal('hide');
			    				$("#deleteForm")[0].reset();
			    				$scope.getData();
			    			}
			    		});
			    	};
				});
			</script>
		</div>
	</body>
</html>