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
			      <label class="col-sm-2 control-label" for="key"><@spring.message "menu.key.label"/></label>
			      <div class="col-sm-10">
			        <input type="text" class="form-control" id="key" ng-model="createItem.key" name="key" placeholder="<@spring.message "menu.key.placeholder"/>">
			   	  </div>
			   </div>
			   <div class="form-group">
			      <label class="col-sm-2 control-label"  for="prompt"><@spring.message "menu.prompt.label"/></label>
			      <div class="col-sm-10">
			        <input type="text" class="form-control" id="prompt" ng-model="createItem.prompt" name="prompt" placeholder="<@spring.message "menu.prompt.placeholder"/>">
			   	  </div>
			   </div>
			   <div class="form-group">
			      <label class="col-sm-2 control-label"  for="sequence"><@spring.message "menu.sequence.label"/></label>
			      <div class="col-sm-2">
			        <input type="text" class="form-control" id="sequence" ng-model="createItem.sequence" name="sequence" placeholder="<@spring.message "menu.sequence.placeholder"/>">
			      </div>
			      <label class="col-sm-2 control-label"  for="parentId"><@spring.message "menu.parentId.label"/></label>
			      <div class="col-sm-4">
			        <select class="form-control" id="parentId" name="parentId" ng-model="createItem.parentId" ng-options="o.id as o.prompt for o in options.parentOptions"></select>
			      </div>
			   </div>		
			   <div class="form-group">
			      <label class="col-sm-2 control-label"  for="funcId"><@spring.message "menu.funcId.label"/></label>
			      <div class="col-sm-4">
			        <select class="form-control" id="funcId" name="funcId" ng-model="createItem.funcId" ng-options="o.id as o.prompt for o in options.funcOptions"></select>
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