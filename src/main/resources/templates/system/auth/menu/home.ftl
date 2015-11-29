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
				         	<div class="alert alert-danger" role="alert" ng-hide="editOk">{{ editMsg }}</div>      
							<form role="form" id="editForm" class="form-horizontal">
							   <div class="form-group">
							      <label class="col-sm-2 control-label" for="key">Key</label>
							      <div class="col-sm-10">
							        <input type="text" class="form-control" id="key" ng-model="editItem.key" name="key" placeholder="<@spring.message "menu.key"/>">
							   	  </div>
							   </div>
							   <div class="form-group">
							      <label class="col-sm-2 control-label"  for="prompt">Prompt</label>
							      <div class="col-sm-10">
							        <input type="text" class="form-control" id="prompt" ng-model="editItem.prompt" name="prompt" placeholder="<@spring.message "menu.key"/>">
							   	  </div>
							   </div>
							   <div class="form-group">
							      <label class="col-sm-2 control-label"  for="sequence">Sequence</label>
							      <div class="col-sm-2">
							        <input type="text" class="form-control" id="sequence" ng-model="editItem.sequence" name="sequence" placeholder="<@spring.message "menu.key"/>">
							      </div>
							      <label class="col-sm-2 control-label"  for="parentId">Parent</label>
							      <div class="col-sm-4">
							        <select class="form-control" id="parentId" name="parentId" ng-model="editItem.parentId" ng-options="o.id as o.prompt for o in options"></select>
							      </div>
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
			
			<script src="${base}/res.do?path=/system/auth/menu/home.js"></script>
		</div>
	</body>
</html>