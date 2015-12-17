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
			      <label class="col-sm-2 control-label" for="sn"><@spring.message "device.sn.label"/></label>
			      <div class="col-sm-10">
			        <input type="text" class="form-control" id="sn" ng-model="createItem.sn" name="sn" placeholder="<@spring.message "device.sn.placeholder"/>">
			   	  </div>
			   </div>
			   <div class="form-group">
			      <label class="col-sm-2 control-label"  for="batch"><@spring.message "device.batch.label"/></label>
			      <div class="col-sm-10">
			        <input type="text" class="form-control" id="batch" ng-model="createItem.batch" name="batch" placeholder="<@spring.message "device.batch.placeholder"/>">
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
