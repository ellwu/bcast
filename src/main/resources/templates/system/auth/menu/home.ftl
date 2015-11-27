<meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
<#import "/common/html.ftl" as html/>
<#import "/common/spring.ftl" as spring/>
<#assign base=request.contextPath/>

<!DOCTYPE html>
<html lang="en">
	<head>
		<@html.commonHead/>
		<title><@spring.message "menu.home.title"/></title>
		<script src="${base}/js/angular.js"></script>
	</head>
	<body>
		<div ng-app="myApp" ng-controller="menusCtl">
			<@html.topMenu/>
			
			<@html.content>
				<h2><@spring.message "menu.home.subtitle"/></h2>
				<div class="panel panel-default">
					<div class="panel-heading">
						<div class="btn-group" role="group" aria-label="...">
							<button type="button" class="btn btn-default" data-toggle="modal" data-target="#createMenuModal"><@spring.message "prompt.create"/></button>
							<button type="button" class="btn btn-default" data-toggle="modal" data-target="#modifyMenuModal"><@spring.message "prompt.modify"/></button>
							<button type="button" class="btn btn-default" data-toggle="modal" data-target="#deleteMenuModal"><@spring.message "prompt.delete"/></button>
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
									<th>Prompt</th> 
								</tr> 
							</thead> 
							<tbody> 
								<tr ng-repeat="m in page.content">
									<td><input type="checkbox" class="checkbox">
									</td>
								    <td>{{ m.key }}</td>
								    <td>{{ m.prompt }}</td>
								  </tr>
							</tbody> 
						</table>
					</div>
							  
					<div class="panel-footer">
							  
					</div>
				</div>
				
				<div class="modal fade" id="createMenuModal" tabindex="-1" role="dialog" aria-labelledby="createMenuModalLabel" aria-hidden="true">
				   <div class="modal-dialog">
				      <div class="modal-content">
				         <div class="modal-header">
				            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				            <h4 class="modal-title" id="myModalLabel"><@spring.message "menu.home.createMenu"/></h4>
				         </div>
				         <div class="modal-body">            
							<form role="form" id="createForm">
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
				            <button type="button" class="btn btn-primary" ng-click="create()"><@spring.message "prompt.create"/></button>
				         </div>
				      </div>
					</div>
				</div>
				
				<div class="modal fade" id="modifyMenuModal" tabindex="-1" role="dialog" aria-labelledby="modifyMenuModalLabel" aria-hidden="true">
				   <div class="modal-dialog">
				      <div class="modal-content">
				         <div class="modal-header">
				            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				            <h4 class="modal-title" id="myModalLabel"><@spring.message "menu.home.modifyMenu"/></h4>
				         </div>
				         <div class="modal-body">
				            在这里添加一些文本
				         </div>
				         <div class="modal-footer">
				            <button type="button" class="btn btn-default" data-dismiss="modal"><@spring.message "prompt.close"/></button>
				            <button type="button" class="btn btn-primary"><@spring.message "prompt.modify"/></button>
				         </div>
				      </div>
					</div>
				</div>
				
				<div class="modal fade" id="deleteMenuModal" tabindex="-1" role="dialog" aria-labelledby="deleteMenuModalLabel" aria-hidden="true">
				   <div class="modal-dialog">
				      <div class="modal-content">
				         <div class="modal-header">
				            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				            <h4 class="modal-title" id="myModalLabel"><@spring.message "menu.home.deleteMenu"/></h4>
				         </div>
				         <div class="modal-body">
				            在这里添加一些文本
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
				app.controller('menusCtl', function($scope, $http) {
					$scope.pageIndex = 0;
					$scope.pageSize = 10;
					
					$scope.getData = function(){
						var listUrl = "${base}/menu/list.do?size=" + $scope.pageSize + "&page=" + $scope.pageIndex;
					    
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
			    			url: "${base}/menu/create.do",
			    			data: $("#createForm").serialize(),
			    			async: false,
			    			error: function(req){
			    			
			    			},
			    			success: function(data){
			    				$("#createMenuModal").modal('hide');
			    				$("#createForm")[0].reset();
			    				$scope.getData();
			    			}
			    		});
			    	};
				});
			</script>
		</div>
	</body>
</html>