<div class="modal fade" id="searchAdverModal" tabindex="-1" role="dialog" aria-labelledby="searchAdverModalLabel" aria-hidden="true">
   <div class="modal-dialog modal-lg">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title" id="searchAdverModalLabel"><@spring.message "prompt.search"/></h4>
         </div>
         <div class="modal-body">           

			<div class="row">
				<div class="col-xs-6 col-md-6">
					<form role="form" id="queryForm" class="form-horizontal">
						<div class="form-group">
							  <label class="col-sm-3 control-label" for="name"><@spring.message "merchant.name.label"/></label>
							  <div class="col-sm-9">
								<input type="text" class="form-control" id="name" name="name" ng-model="queryItem.name" placeholder="<@spring.message "merchant.name.placeholder"/>">
							  </div>
						</div>
						
						<div class="form-group">
						      <label class="col-sm-3 control-label" for="level"><@spring.message "merchant.level.label"/></label>
						      <div class="col-sm-9">
						   	  	<select class="form-control" id="level" name="level" ng-model="queryItem.level" ng-options="l.value as l.desc for l in options.levelOptions"></select>
						   	  </div>
						   </div>
						   <div class="form-group">
						      <label class="col-sm-3 control-label" for="category"><@spring.message "merchant.category.label"/></label>
						      <div class="col-sm-9">
						        <select class="form-control" id="category" name="category" ng-model="queryItem.category" ng-options="l.value as l.desc for l in options.categoryOptions"></select>
						   	  </div>
						   </div>
						
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
								<th><@spring.message "adver.name.head"/></th> 
								<th><@spring.message "adver.category.head"/></th> 
								
								<th><@spring.message "adver.operationPerson.head"/></th> 
								
								<th><@spring.message "adver.contactPerson.head"/></th> 
								<th><@spring.message "adver.contactPhone.head"/></th> 
								
								<th><@spring.message "disabled_enabled.head"/></th> 
								<th><@spring.message "table.head.action"/></th>
							</tr> 
						</thead> 
						<tbody> 
							<tr ng-repeat="item in page.content">
							    <td>{{ item.name }}</td>
							    <td>{{ item.categoryDesc }}</td>
							    
							    <td>{{ item.operationPerson }}</td>
							    
							    <td>{{ item.contactPerson }}</td>
							    <td>{{ item.contactPhone }}</td>
							    
							    <td>{{ item.disableFlag == 1 ? '<@spring.message "prompt.disabled"/>': '<@spring.message "prompt.enabled"/>' }}</td>
							    <td>
							    	<a class="button glyphicon glyphicon-pencil" ng-click="edit(item)"></a>
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

		</div>
         <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal"><@spring.message "prompt.close"/></button>
         </div>
      </div>
	</div>
</div>