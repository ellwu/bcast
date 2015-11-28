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
				<div class="alert alert-success" role="alert" ng-hide="noTopMsg">{{ topMsg }}</div> 
				<div class="panel panel-default">
					<div class="panel-heading">
						<div class="btn-group" role="group" aria-label="...">
							<button type="button" class="btn btn-default" ng-click="create()"><@spring.message "prompt.create"/></button>
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
									<th>Key</th> 
									<th>Prompt</th> 
									<th>Sequence</th> 
									<th>Action</th>
								</tr> 
							</thead> 
							<tbody> 
								<tr ng-repeat="m in page.content">
								    <td>{{ m.key }}</td>
								    <td>{{ m.prompt }}</td>
								    <td>{{ m.sequence }}</td>
								    <td>
								    	<a class="button glyphicon glyphicon-pencil" ng-click="edit(m)"></a>
								    	<a class="button glyphicon glyphicon-remove" ng-click="delete(m)"></a>
								    </td>
								  </tr>
							</tbody> 
						</table>
					</div>
							  
					<div class="panel-footer">
					
					</div>
				</div>
				
				<div class="modal fade" id="createModal" tabindex="-1" role="dialog" aria-labelledby="createModalLabel" aria-hidden="true">
				   <div class="modal-dialog modal-lg">
				      <div class="modal-content">
				         <div class="modal-header">
				            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				            <h4 class="modal-title" id="createModalLabel"><@spring.message "prompt.create"/></h4>
				         </div>
				         <div class="modal-body">           
				         	<div class="alert alert-danger" role="alert" ng-hide="createOk">{{ createMsg }}</div> 
							<form role="form" id="createForm" class="form-horizontal">
							   <div class="form-group">
							      <label class="col-sm-2 control-label" for="key">Key</label>
							      <div class="col-sm-10">
							        <input type="text" class="form-control" id="key" ng-model="createItem.key" name="key" placeholder="<@spring.message "menu.key"/>">
							   	  </div>
							   </div>
							   <div class="form-group">
							      <label class="col-sm-2 control-label"  for="prompt">Prompt</label>
							      <div class="col-sm-10">
							        <input type="text" class="form-control" id="prompt" ng-model="createItem.prompt" name="prompt" placeholder="<@spring.message "menu.key"/>">
							   	  </div>
							   </div>
							   <div class="form-group">
							      <label class="col-sm-2 control-label"  for="sequence">Sequence</label>
							      <div class="col-sm-2">
							        <input type="text" class="form-control" id="sequence" ng-model="createItem.sequence" name="sequence" placeholder="<@spring.message "menu.key"/>">
							      </div>
							      <label class="col-sm-2 control-label"  for="parentId">Parent</label>
							      <div class="col-sm-4">
							        <select class="form-control" id="parentId" name="parentId" ng-model="createItem.parentId" ng-options="o.id as o.prompt for o in options"></select>
							      </div>
							   </div>							   
							</form>
				         </div>
				         <div class="modal-footer">
				            <button type="button" class="btn btn-default" data-dismiss="modal"><@spring.message "prompt.close"/></button>
				            <button type="button" class="btn btn-primary" ng-click="createConfirm()"><@spring.message "prompt.create"/></button>
				         </div>
				      </div>
					</div>
				</div>
				
				<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
				   <div class="modal-dialog modal-lg">
				      <div class="modal-content">
				         <div class="modal-header">
				            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				            <h4 class="modal-title" id="editModalLabel"><@spring.message "prompt.edit"/></h4>
				         </div>
				         <div class="modal-body">            
							<form role="form" id="editForm">
							   <div class="form-group">
							      <label for="key">Key</label>
							      <input type="text" class="form-control" ng-model="hello" id="key" name="key" placeholder="请输入名称"/>
							   </div>
							   <div class="form-group">
							      <label for="prompt">Prompt</label>
							      <input type="text" class="form-control" id="prompt" name="prompt" placeholder="请输入名称"/>
							   </div>
							   <div class="form-group">
							      <label for="sequence">Sequence</label>
							      <input type="text" class="form-control" id="sequence" name="sequence" placeholder="请输入名称"/>
							   </div>							   
							</form>
				         </div>
				         <div class="modal-footer">
				            <button type="button" class="btn btn-default" data-dismiss="modal"><@spring.message "prompt.close"/></button>
				            <button type="button" class="btn btn-primary" ng-click="editConfirm()"><@spring.message "prompt.edit"/></button>
				         </div>
				      </div>
					</div>
				</div>
				
				<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
				   <div class="modal-dialog modal-sm">
				      <div class="modal-content">
				         <div class="modal-header">
				            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				            <h4 class="modal-title" id="deleteModalLabel"><@spring.message "menu.home.editMenu"/></h4>
				         </div>
				         <div class="modal-body">  
				         	<div class="alert alert-danger" role="alert" ng-hide="deleteOk">{{ deleteMsg }}</div>  
							<p><@spring.message "prompt.delete.confirm"/> "{{deleteItem.prompt}}" ?</p>
				         </div>
				         <div class="modal-footer">
				            <button type="button" class="btn btn-default" data-dismiss="modal"><@spring.message "prompt.close"/></button>
				            <button type="button" class="btn btn-primary" ng-click="deleteConfirm()"><@spring.message "prompt.confirm"/></button>
				         </div>
				      </div>
					</div>
				</div>
				
			</@html.content>
			
			<script>
				var app = angular.module('myApp', []);
				app.controller('menusCtl', function($scope, $http) {
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
			    	//pageable table end
			    	
			    	//select option values begin
			    	$scope.options = [];
			    	
			    	$scope.optionsInit = function(){
			    		var optionsUrl = "${base}/menu/options.do";
					    
					    $http.get(optionsUrl).success(function (response) {
					    	$scope.options = response;
					    });
			    	};
			    	
			    	//select option values end
			    	
			    	//create action begin
			    	$scope.createItem = {};
			    	$scope.createMsg = "";
			    	$scope.createOk = true;
			    	
			    	$scope.create = function(item){
			    		$("#createModal").modal("show");
			    		
			    		$scope.optionsInit();
			    	};
			    	
			    	$scope.createConfirm = function(){
			    		$.ajax({
			    			cache: true,
			    			type: 'POST',
			    			url: "${base}/menu/create.do",
			    			data: $scope.createItem,
			    			async: false,
			    			error: function(req){
			    				$scope.createOk = false;
			    				$scope.createMsg = "Internal error. Please contact your administrator.";
			    			},
			    			success: function(data){
			    				if(data.status){
			    					$("#createModal").modal('hide');
			    					
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
			    	$scope.editItem = {};
			    	$scope.editMsg = "";
			    	$scope.editOk = true;
			    	
			    	$scope.edit = function(item){
			    		$scope.editItem = item;
			    		
			    		$("#editModal").modal("show");
			    	};
			    	
			    	$scope.editConfirm = function(){
			    		
			    		$.ajax({
			    			cache: true,
			    			type: 'POST',
			    			url: "${base}/menu/edit.do",
			    			data: $scope.editItem,
			    			async: false,
			    			error: function(req){
			    				$scope.editOk = false;
			    				$scope.editMsg = "Internal error. Please contact your administrator.";
			    			},
			    			success: function(data){
			    				if(data.status){
			    					$("#editModal").modal('hide');
			    					$scope.getData();
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
			    			url: "${base}/menu/delete.do",
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
				});
			</script>
		</div>
	</body>
</html>