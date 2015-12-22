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
			      <label class="col-sm-2 control-label" for="merchantId"><@spring.message "resource.merchantId.label"/></label>
			      <div class="col-sm-10">
			        <input type="text" class="form-control" id="merchantId" ng-model="createItem.merchantId" name="merchantId" placeholder="<@spring.message "resource.merchantId.placeholder"/>">
			   	  </div>
			   </div>
			   
			   <div class="form-group">
			      <label class="col-sm-2 control-label" for="type"><@spring.message "resource.type.label"/></label>
			      <div class="col-sm-10">
			        <input type="text" class="form-control" id="type" ng-model="createItem.type" name="type" placeholder="<@spring.message "resource.type.placeholder"/>">
			   	  </div>
			   </div>
			   
			   <div class="form-group">
			      <label class="col-sm-2 control-label" for="originName"><@spring.message "resource.originName.label"/></label>
			      <div class="col-sm-10">
			        <input type="text" class="form-control" id="originName" ng-model="createItem.originName" name="originName" placeholder="<@spring.message "resource.originName.placeholder"/>">
			   	  </div>
			   </div>
			   
			   <div class="form-group">
			      <label class="col-sm-2 control-label" for="category"><@spring.message "resource.category.label"/></label>
			      <div class="col-sm-10">
			        <input type="text" class="form-control" id="category" ng-model="createItem.category" name="category" placeholder="<@spring.message "resource.category.placeholder"/>">
			   	  </div>
			   </div>
			   
			    <div class="form-group">
			      <label class="col-sm-2 control-label" for="rangeAge"><@spring.message "resource.rangeAge.label"/></label>
			      <div class="col-sm-10">
			        <input type="text" class="form-control" id="rangeAge" ng-model="createItem.rangeAge" name="rangeAge" placeholder="<@spring.message "resource.rangeAge.placeholder"/>">
			   	  </div>
			   </div>
			   
			   <div class="form-group">
			      <label class="col-sm-2 control-label" for="rangeGroup"><@spring.message "resource.rangeGroup.label"/></label>
			      <div class="col-sm-10">
			        <input type="text" class="form-control" id="rangeGroup" ng-model="createItem.rangeGroup" name="rangeGroup" placeholder="<@spring.message "resource.rangeGroup.placeholder"/>">
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
