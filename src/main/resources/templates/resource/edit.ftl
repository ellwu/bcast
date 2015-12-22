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
			      <label class="col-sm-2 control-label" for="type"><@spring.message "resource.type.label"/></label>
			      <div class="col-sm-10">
			        <input type="text" class="form-control" id="type" ng-model="editItem.type" name="type" placeholder="<@spring.message "resource.type.placeholder"/>">
			   	  </div>
			   </div>
			   
			   <div class="form-group">
			      <label class="col-sm-2 control-label" for="originName"><@spring.message "resource.originName.label"/></label>
			      <div class="col-sm-10">
			        <input type="text" class="form-control" id="originName" ng-model="editItem.originName" name="originName" placeholder="<@spring.message "resource.originName.placeholder"/>">
			   	  </div>
			   </div>
			   
			   <div class="form-group">
			      <label class="col-sm-2 control-label" for="category"><@spring.message "resource.category.label"/></label>
			      <div class="col-sm-10">
			        <input type="text" class="form-control" id="category" ng-model="editItem.category" name="category" placeholder="<@spring.message "resource.category.placeholder"/>">
			   	  </div>
			   </div>
			   
			    <div class="form-group">
			      <label class="col-sm-2 control-label" for="rangeAge"><@spring.message "resource.rangeAge.label"/></label>
			      <div class="col-sm-10">
			        <input type="text" class="form-control" id="rangeAge" ng-model="editItem.rangeAge" name="rangeAge" placeholder="<@spring.message "resource.rangeAge.placeholder"/>">
			   	  </div>
			   </div>
			   
			   <div class="form-group">
			      <label class="col-sm-2 control-label" for="rangeGroup"><@spring.message "resource.rangeGroup.label"/></label>
			      <div class="col-sm-10">
			        <input type="text" class="form-control" id="rangeGroup" ng-model="editItem.rangeGroup" name="rangeGroup" placeholder="<@spring.message "resource.rangeGroup.placeholder"/>">
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