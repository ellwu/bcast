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
			      <label class="col-sm-2 control-label" for="code"><@spring.message "version.code.label"/></label>
			      <div class="col-sm-10">
			        <input type="text" class="form-control" id="code" ng-model="editItem.code" name="code" placeholder="<@spring.message "version.code.placeholder"/>">
			   	  </div>
			   </div>
			   <div class="form-group">
			      <label class="col-sm-2 control-label"  for="name"><@spring.message "version.name.label"/></label>
			      <div class="col-sm-10">
			        <input type="text" class="form-control" id="name" ng-model="editItem.name" name="name" placeholder="<@spring.message "version.name.placeholder"/>">
			   	  </div>
			   </div>
			   <div class="form-group">
			      <label class="col-sm-2 control-label" for="applyFlag"><@spring.message "version.applyFlag.label"/></label>
			      <div class="col-sm-10">
			        <input type="text" class="form-control" id="applyFlag" ng-model="editItem.applyFlag" name="applyFlag" placeholder="<@spring.message "version.applyFlag.placeholder"/>">
			   	  </div>
			   </div>
			   <div class="form-group">
			      <label class="col-sm-2 control-label" for="url"><@spring.message "version.url.label"/></label>
			      <div class="col-sm-10">
			        <input type="text" class="form-control" id="url" ng-model="editItem.url" name="url" placeholder="<@spring.message "version.url.placeholder"/>">
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