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
			        <select class="form-control" id="status" name="status" ng-model="editItem.status" ng-options="l.value as l.desc for l in options.statusOptions"></select>	   	 
			   	  </div>
			   </div>
			   <div class="form-group">
			      <label class="col-sm-2 control-label"  for="bindStatus"><@spring.message "device.bindStatus.label"/></label>
			      <div class="col-sm-10">
			        <select class="form-control" id="status" name="status" ng-model="editItem.status" ng-options="l.value as l.desc for l in options.bindStatusOptions" disabled></select>	   	 
			   	  </div>
			   </div>
			   
			   <div class="form-group">
			      <label class="col-sm-2 control-label" for="disableFlag"><@spring.message "disabled_enabled.label"/></label>
			      <div class="col-sm-10">
			   	  	<select class="form-control" id="disableFlag" name="disableFlag" ng-model="editItem.disableFlag" ng-options="l.value as l.desc for l in options.disableOptions"></select>	   	 
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