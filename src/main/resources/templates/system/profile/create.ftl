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
			      <label class="col-sm-2 control-label" for="key"><@spring.message "profile.key.label"/></label>
			      <div class="col-sm-10">
			        <input type="text" class="form-control" id="key" ng-model="createItem.key" name="key" placeholder="<@spring.message "profile.key.placeholder"/>">
			   	  </div>
			   </div>
			   <div class="form-group">
			      <label class="col-sm-2 control-label"  for="prompt"><@spring.message "profile.prompt.label"/></label>
			      <div class="col-sm-10">
			        <input type="text" class="form-control" id="prompt" ng-model="createItem.prompt" name="prompt" placeholder="<@spring.message "profile.prompt.placeholder"/>">
			   	  </div>
			   </div>
			   <div class="form-group">
			      <label class="col-sm-2 control-label"  for="value"><@spring.message "profile.value.label"/></label>
			      <div class="col-sm-10">
			        <input type="text" class="form-control" id="prompt" ng-model="createItem.value" name="prompt" placeholder="<@spring.message "profile.value.placeholder"/>">
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
