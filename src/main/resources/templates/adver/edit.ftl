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
			      <label class="col-sm-2 control-label" for="name"><@spring.message "adver.name.label"/></label>
			      <div class="col-sm-10">
			        <input type="text" class="form-control" id="name" ng-model="editItem.name" name="name" placeholder="<@spring.message "adver.name.placeholder"/>">
			   	  </div>
			   </div>
			   
			   <div class="form-group">
			      <label class="col-sm-2 control-label" for="category"><@spring.message "adver.category.label"/></label>
			      <div class="col-sm-2">
			        <select class="form-control" id="category" name="category" ng-model="editItem.category" ng-options="l.value as l.desc for l in options.categoryOptions"></select>
			   	  </div>
			   </div>
			   
			   <div class="form-group">
			      <label class="col-sm-2 control-label" for="addr"><@spring.message "adver.addr.label"/></label>
			      <div class="col-sm-10">
			        <input type="text" class="form-control" id="addr" ng-model="editItem.addr" name="addr" placeholder="<@spring.message "adver.addr.placeholder"/>">
			   	  </div>
			   </div>
			   
			    <div class="form-group">
			      <label class="col-sm-2 control-label" for="province"><@spring.message "adver.province.label"/></label>
			      <div class="col-sm-2">
			        <input type="text" class="form-control" id="province" ng-model="editItem.province" name="province" placeholder="<@spring.message "adver.province.placeholder"/>">
			   	  </div>
			   	  
			      <label class="col-sm-2 control-label" for="city"><@spring.message "adver.city.label"/></label>
			      <div class="col-sm-2">
			        <input type="text" class="form-control" id="city" ng-model="editItem.city" name="city" placeholder="<@spring.message "adver.city.placeholder"/>">
			   	  </div>
			   	  
			      <label class="col-sm-2 control-label" for="district"><@spring.message "adver.district.label"/></label>
			      <div class="col-sm-2">
			        <input type="text" class="form-control" id="district" ng-model="editItem.district" name="district" placeholder="<@spring.message "adver.district.placeholder"/>">
			   	  </div>
			   </div>
			   
			   <div class="form-group">
			      <label class="col-sm-2 control-label" for="contactPerson"><@spring.message "adver.contactPerson.label"/></label>
			      <div class="col-sm-2">
			        <input type="text" class="form-control" id="contactPerson" ng-model="editItem.contactPerson" name="contactPerson" placeholder="<@spring.message "adver.contactPerson.placeholder"/>">
			   	  </div>

			      <label class="col-sm-2 control-label" for="contactPhone"><@spring.message "adver.contactPhone.label"/></label>
			      <div class="col-sm-2">
			        <input type="text" class="form-control" id="contactPhone" ng-model="editItem.contactPhone" name="contactPhone" placeholder="<@spring.message "adver.contactPhone.placeholder"/>">
			   	  </div>

			      <label class="col-sm-2 control-label" for="operationPerson"><@spring.message "adver.operationPerson.label"/></label>
			      <div class="col-sm-2">
			        <input type="text" class="form-control" id="operationPerson" ng-model="editItem.operationPerson" name="operationPerson" placeholder="<@spring.message "adver.operationPerson.placeholder"/>">
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