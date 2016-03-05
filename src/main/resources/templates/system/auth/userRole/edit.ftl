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
			      <label class="col-sm-2 control-label"  for="userId"><@spring.message "userRole.user.label"/></label>
			      <div class="col-sm-4">
			        <select class="form-control" id="funcId" name="userId" ng-model="editItem.userId" ng-options="u.id as u.name for u in options.userOptions" disabled></select>
			      </div>
			   </div>	
			   <div class="form-group">
			      <label class="col-sm-2 control-label"  for="roleId"><@spring.message "userRole.role.label"/></label>
			      <div class="col-sm-4">
			        <select class="form-control" id="funcId" name="roleId" ng-model="editItem.roleId" ng-options="r.id as r.name for r in options.roleOptions"></select>
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