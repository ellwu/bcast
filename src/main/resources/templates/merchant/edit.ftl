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
			      <label class="col-sm-2 control-label" for="name"><@spring.message "merchant.name.label"/></label>
			      <div class="col-sm-10">
			        <input type="text" class="form-control" id="name" ng-model="editItem.name" name="name" placeholder="<@spring.message "merchant.name.placeholder"/>">
			   	  </div>
			   </div>
			   
			   <div class="form-group">
			      <label class="col-sm-2 control-label" for="level"><@spring.message "merchant.level.label"/></label>
			      <div class="col-sm-2">
			        <select class="form-control" id="level" name="level" ng-model="editItem.level" ng-options="l.value as l.desc for l in options.levelOptions"></select>
			   	  </div>
			   	  
			      <label class="col-sm-2 control-label" for="category"><@spring.message "merchant.category.label"/></label>
			      <div class="col-sm-2">
			        <select class="form-control" id="category" name="category" ng-model="editItem.category" ng-options="l.value as l.desc for l in options.categoryOptions"></select>
			   	  </div>
			   	  
			      <label class="col-sm-2 control-label" for="maxTargets"><@spring.message "merchant.maxTargets.label"/></label>
			      <div class="col-sm-2">
			        <input type="text" class="form-control" id="maxTargets" ng-model="editItem.maxTargets" name="maxTargets" placeholder="<@spring.message "merchant.maxTargets.placeholder"/>">
			   	  </div>
			   </div>
			   
			   <div class="form-group">
			      <label class="col-sm-2 control-label" for="addr"><@spring.message "merchant.addr.label"/></label>
			      <div class="col-sm-10">
			        <input type="text" class="form-control" id="addr" ng-model="editItem.addr" name="addr" placeholder="<@spring.message "merchant.addr.placeholder"/>">
			   	  </div>
			   </div>
			   
			    <div class="form-group">
			      <label class="col-sm-2 control-label" for="province"><@spring.message "merchant.province.label"/></label>
			      <div class="col-sm-2">
			        <select class="form-control" id="province" ng-model="editItem.province" name="province" placeholder="<@spring.message "merchant.province.placeholder"/>" ng-options="p.name as p.name for p in provinceList"></select>
			   	  </div>
			   	  
			      <label class="col-sm-2 control-label" for="city"><@spring.message "merchant.city.label"/></label>
			      <div class="col-sm-2">
			        <select class="form-control" id="city" ng-model="editItem.city" name="city" placeholder="<@spring.message "merchant.city.placeholder"/>" ng-options="c.name as c.name for c in cityList"></select>
			   	  </div>
			   	  
			      <label class="col-sm-2 control-label" for="district"><@spring.message "merchant.district.label"/></label>
			      <div class="col-sm-2">
			        <select class="form-control" id="district" ng-model="editItem.district" name="district" placeholder="<@spring.message "merchant.district.placeholder"/>" ng-options="a as a for a in areaList"></select>
			   	  </div>
			   </div>

			   <div class="form-group">
			      <label class="col-sm-2 control-label" for="contactPerson"><@spring.message "merchant.contactPerson.label"/></label>
			      <div class="col-sm-3">
			        <input type="text" class="form-control" id="contactPerson" ng-model="editItem.contactPerson" name="contactPerson" placeholder="<@spring.message "merchant.contactPerson.placeholder"/>">
			   	  </div>
			   	  
			      <label class="col-sm-2 control-label" for="contactPhone"><@spring.message "merchant.contactPhone.label"/></label>
			      <div class="col-sm-3">
			        <input type="text" class="form-control" id="contactPhone" ng-model="editItem.contactPhone" name="contactPhone" placeholder="<@spring.message "merchant.contactPhone.placeholder"/>">
			   	  </div>
			   </div>
			   
			   <div class="form-group">
			      <label class="col-sm-2 control-label" for="servicePerson"><@spring.message "merchant.servicePerson.label"/></label>
			      <div class="col-sm-3">
			        <input type="text" class="form-control" id="servicePerson" ng-model="editItem.servicePerson" name="servicePerson" placeholder="<@spring.message "merchant.servicePerson.placeholder"/>">
			   	  </div>
			   	  
			      <label class="col-sm-2 control-label" for="spreadPerson"><@spring.message "merchant.spreadPerson.label"/></label>
			      <div class="col-sm-3">
			        <input type="text" class="form-control" id="spreadPerson" ng-model="editItem.spreadPerson" name="spreadPerson" placeholder="<@spring.message "merchant.spreadPerson.placeholder"/>">
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