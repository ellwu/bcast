<div class="modal fade" id="searchResourceModal" tabindex="-1" role="dialog" aria-labelledby="searchResourceModalLabel" aria-hidden="true">
   <div class="modal-dialog modal-lg">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title" id="searchResourceModalLabel"><@spring.message "prompt.search"/></h4>
         </div>
         <div class="modal-body">           

			<div class="row">
				<div class="col-xs-6 col-md-6">
					<form role="form" id="queryForm" class="form-horizontal">
						<div class="form-group">
							  <label class="col-sm-3 control-label" for="adver"><@spring.message "resource.adver.label"/></label>
							  <div class="col-sm-9">
								<input type="text" class="form-control" id="adver" name="adver" ng-model="query_Resource.queryItem.adver" placeholder="<@spring.message "resource.adver.placeholder"/>">
							  </div>
						</div>
						
						<div class="form-group">
							  <label class="col-sm-3 control-label" for="originName"><@spring.message "resource.originName.label"/></label>
							  <div class="col-sm-9">
								<input type="text" class="form-control" id="originName" name="originName" ng-model="query_Resource.queryItem.originName" placeholder="<@spring.message "resource.originName.placeholder"/>">
							  </div>
						</div>
						
						<div class="form-group">
							  <label class="col-sm-3 control-label" for="name"></label>
							  <div class="col-sm-9">
								<button type="button" class="btn btn-primary" ng-click="query_Resource.query()"><@spring.message "prompt.query"/></button>
								<button type="button" class="btn btn-primary" ng-click="query_Resource.resetQuery()"><@spring.message "prompt.reset"/></button>
							  </div>
						</div>
					</form>
				</div>
			</div>
			
			<div class="panel panel-default">
				<div class="panel-heading">
					<div class="btn-group" role="group" aria-label="...">
						<button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" id="perPageBtn" aria-expanded="false">					
							<span data-type="selected-text">{{ query_Resource.pageSize }} <@spring.message "prompt.perPage"/></span>
							<span class="caret"></span>						
						</button>
			
						<ul class="dropdown-menu" role="menu" aria-labelledby="perPageBtn">		
							<li role="presentation">
								<a role="menuitem" tabindex="-1" ng-click="query_Resource.perPage(5)">5 <@spring.message "prompt.perPage"/></a>
							</li>			
							<li role="presentation">
								<a role="menuitem" tabindex="-1" ng-click="query_Resource.perPage(10)">10 <@spring.message "prompt.perPage"/></a>
							</li>			
							<li role="presentation">
								<a role="menuitem" tabindex="-1" ng-click="query_Resource.perPage(20)">20 <@spring.message "prompt.perPage"/></a>
							</li>		
							<li role="presentation">
								<a role="menuitem" tabindex="-1" ng-click="query_Resource.perPage(30)">30 <@spring.message "prompt.perPage"/></a>
							</li>											
							<li role="presentation">
								<a role="menuitem" tabindex="-1" ng-click="query_Resource.perPage(50)">50 <@spring.message "prompt.perPage"/></a>
							</li>
						</ul>
					</div>
					<div class="btn-group pull-right" role="group" aria-label="...">
						<button type="button" class="btn btn-default" ng-click="query_Resource.previous()" ng-disabled="query_Resource.page.first"><@spring.message "prompt.previous"/></button>
						<button type="button" class="btn btn-default"ng-click="query_Resource.next()" ng-disabled="query_Resource.page.last"><@spring.message "prompt.next"/></button>
					</div>
				</div>
						
				<div class="panel-body">
					<div class="table-responsive">
				  	<table class="table table-bordered">
						<thead> 
							<tr> 
								<th><@spring.message "resource.adverId.head"/></th> 
								
								<th><@spring.message "resource.originName.head"/></th> 									
								<th><@spring.message "resource.category.head"/></th> 
								
								<th><@spring.message "disabled_enabled.head"/></th>
								<th><@spring.message "table.head.action"/></th>
							</tr> 
						</thead> 
						<tbody> 
							<tr ng-repeat="item in query_Resource.page.content">
							    <td>{{ item.adver }}</td>
							    
							    <td>{{ item.originName }}</td>
							    <td>{{ item.categoryDesc }}</td>
							    
							    <td>{{ item.disableFlag == 1 ? '<@spring.message "prompt.disabled"/>': '<@spring.message "prompt.enabled"/>' }}</td>
							    <td>
							    	<a class="button glyphicon glyphicon-share-alt" ng-click="query_Resource.choose(item)"></a>
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