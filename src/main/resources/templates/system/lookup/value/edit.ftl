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
			      <label class="col-sm-2 control-label"  for="categoryId"><@spring.message "lookup.categoryId.label"/></label>
			      <div class="col-sm-4">
			        <select class="form-control" id="categoryId" name="categoryId" ng-model="editItem.categoryId" ng-options="c.id as c.prompt for c in options.catOptions" disabled></select>
			      </div>
			   </div>	
			   <div class="form-group">
			      <label class="col-sm-2 control-label" for="key"><@spring.message "lookup.key.label"/></label>
			      <div class="col-sm-10">
			        <input type="text" class="form-control" id="key" ng-model="editItem.key" name="key" placeholder="<@spring.message "lookup.key.placeholder"/>">
			   	  </div>
			   </div>
			   <div class="form-group">
			      <label class="col-sm-2 control-label"  for="value"><@spring.message "lookup.value.label"/></label>
			      <div class="col-sm-10">
			        <input type="text" class="form-control" id="value" ng-model="editItem.value" name="value" placeholder="<@spring.message "lookup.value.placeholder"/>">
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