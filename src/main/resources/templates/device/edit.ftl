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
			      <label class="col-sm-2 control-label" for="sn"><@spring.message "device.sn.label"/></label>
			      <div class="col-sm-10">
			        <input type="text" class="form-control" id="sn" ng-model="editItem.sn" name="sn" placeholder="<@spring.message "device.sn.placeholder"/>">
			   	  </div>
			   </div>
			   <div class="form-group">
			      <label class="col-sm-2 control-label"  for="batch"><@spring.message "device.batch.label"/></label>
			      <div class="col-sm-10">
			        <input type="text" class="form-control" id="batch" ng-model="editItem.batch" name="batch" placeholder="<@spring.message "device.batch.placeholder"/>">
			   	  </div>
			   </div>
			   <div class="form-group">
			      <label class="col-sm-2 control-label"  for="status"><@spring.message "device.status.label"/></label>
			      <div class="col-sm-10">
			        <input type="text" class="form-control" id="status" ng-model="editItem.status" name="status" placeholder="<@spring.message "device.status.placeholder"/>">
			   	  </div>
			   </div>
			   <div class="form-group">
			      <label class="col-sm-2 control-label"  for="bindStatus"><@spring.message "device.bindStatus.label"/></label>
			      <div class="col-sm-10">
			        <input type="text" class="form-control" id="bindStatus" ng-model="editItem.bindStatus" name="bindStatus" placeholder="<@spring.message "device.bindStatus.placeholder"/>">
			   	  </div>
			   </div>
			   <div class="form-group">
			      <label class="col-sm-2 control-label"  for="disableFlag"><@spring.message "device.disableFlag.label"/></label>
			      <div class="col-sm-10">
			        <input type="text" class="form-control" id="disableFlag" ng-model="editItem.disableFlag" name="disableFlag" placeholder="<@spring.message "device.disableFlag.placeholder"/>">
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