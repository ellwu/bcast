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
			      <label class="col-sm-2 control-label"  for="roleId"><@spring.message "roleMenu.roleId.label"/></label>
			      <div class="col-sm-4">
			        <select class="form-control" id="funcId" name="roleId" ng-model="createItem.roleId" ng-options="u.id as u.name for u in options.roleOptions"></select>
			      </div>
			   </div>	
			   <div class="form-group">
			      <label class="col-sm-2 control-label"  for="menuId"><@spring.message "roleMenu.menuId.label"/></label>
			      <div class="col-sm-4">
			        <select class="form-control" id="funcId" name="menuId" ng-model="createItem.menuId" ng-options="r.id as r.prompt for r in options.menuOptions"></select>
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
