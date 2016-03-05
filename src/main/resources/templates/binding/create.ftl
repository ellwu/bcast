<div class="modal fade" id="createModal" tabindex="-1" role="dialog" aria-labelledby="createModalLabel" aria-hidden="true">
   <div class="modal-dialog modal-lg">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title" id="createModalLabel"><@spring.message "prompt.create"/></h4>
         </div>
         <div class="modal-body">           
         	<div class="alert alert-danger" role="alert" ng-hide="merchant.createOk">{{ merchant.createMsg }}</div>
         	 
			<#include "/binding/queryMerchant.ftl"/>
				
			<div class="panel panel-default">
				<div class="panel-heading">
					<div class="btn-group" role="group" aria-label="...">
					</div>
					<div class="btn-group" role="group" aria-label="...">
						<button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" id="perPageBtn" aria-expanded="false">					
							<span data-type="selected-text">{{ merchant.pageSize }} <@spring.message "prompt.perPage"/></span>
							<span class="caret"></span>						
						</button>

						<ul class="dropdown-menu" role="menu" aria-labelledby="perPageBtn">		
							<li role="presentation">
								<a role="menuitem" tabindex="-1" ng-click="merchant.perPage(5)">5 <@spring.message "prompt.perPage"/></a>
							</li>			
							<li role="presentation">
								<a role="menuitem" tabindex="-1" ng-click="merchant.perPage(10)">10 <@spring.message "prompt.perPage"/></a>
							</li>			
							<li role="presentation">
								<a role="menuitem" tabindex="-1" ng-click="merchant.perPage(20)">20 <@spring.message "prompt.perPage"/></a>
							</li>		
							<li role="presentation">
								<a role="menuitem" tabindex="-1" ng-click="merchant.perPage(30)">30 <@spring.message "prompt.perPage"/></a>
							</li>											
							<li role="presentation">
								<a role="menuitem" tabindex="-1" ng-click="merchant.perPage(50)">50 <@spring.message "prompt.perPage"/></a>
							</li>
						</ul>
					</div>
					<div class="btn-group pull-right" role="group" aria-label="...">
						<button type="button" class="btn btn-default" ng-click="merchant.previous()" ng-disabled="merchant.page.first"><@spring.message "prompt.previous"/></button>
						<button type="button" class="btn btn-default" ng-click="merchant.next()" ng-disabled="merchant.page.last"><@spring.message "prompt.next"/></button>
					</div>
				</div>
				
				<div class="panel-body">
					<div class="table-responsive">
				  	<table class="table table-bordered">
						<thead> 
							<tr> 
								<th><@spring.message "merchant.name.head"/></th> 
								<th><@spring.message "merchant.level.head"/></th> 
								<th><@spring.message "merchant.category.head"/></th> 
								
								<th><@spring.message "merchant.servicePerson.head"/></th> 
								<th><@spring.message "merchant.spreadPerson.head"/></th> 
								
								<th><@spring.message "merchant.contactPerson.head"/></th> 
								<th><@spring.message "merchant.contactPhone.head"/></th> 
								
								<th><@spring.message "table.head.action"/></th>
							</tr> 
						</thead> 
						<tbody> 
							<tr ng-repeat="item in merchant.page.content">
							    <td>{{ item.name }}</td>
							    <td>{{ item.levelDesc }}</td>
							    <td>{{ item.categoryDesc }}</td>
							    
							    <td>{{ item.servicePerson }}</td>
							    <td>{{ item.spreadPerson }}</td>
							    
							    <td>{{ item.contactPerson }}</td>
							    <td>{{ item.contactPhone }}</td>
							    
							    <td>
							    	<a class="button glyphicon glyphicon-link" ng-click="merchant.bind(item.id)"></a>
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
