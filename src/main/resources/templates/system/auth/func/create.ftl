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
			      <label class="col-sm-2 control-label" for="key"><@spring.message "func.key.label"/></label>
			      <div class="col-sm-10">
			        <input type="text" class="form-control" id="key" ng-model="createItem.key" name="key" placeholder="<@spring.message "func.key.placeholder"/>">
			   	  </div>
			   </div>
			   <div class="form-group">
			      <label class="col-sm-2 control-label"  for="prompt"><@spring.message "func.prompt.label"/></label>
			      <div class="col-sm-10">
			        <input type="text" class="form-control" id="prompt" ng-model="createItem.prompt" name="prompt" placeholder="<@spring.message "func.prompt.placeholder"/>">
			   	  </div>
			   </div>
			   <div class="form-group">
			      <label class="col-sm-2 control-label"  for="url"><@spring.message "func.url.label"/></label>
			      <div class="col-sm-10">
			        <input type="text" class="form-control" id="url" ng-model="createItem.url" name="url" placeholder="<@spring.message "func.url.placeholder"/>">
			   	  </div>
			   </div>
			   <div class="form-group">
			      <label class="col-sm-2 control-label"  for="desc"><@spring.message "func.desc.label"/></label>
			      <div class="col-sm-10">
			        <input type="text" class="form-control" id="desc" ng-model="createItem.desc" name="desc" placeholder="<@spring.message "func.desc.placeholder"/>">
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
