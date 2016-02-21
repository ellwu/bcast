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
			      <label class="col-sm-2 control-label" for="name"><@spring.message "adver.name.label"/></label>
			      <div class="col-sm-10">
			        <input type="text" class="form-control" id="name" ng-model="createItem.name" name="name" placeholder="<@spring.message "adver.name.placeholder"/>">
			   	  </div>
			   </div>
			   
			   <div class="form-group">
			      <label class="col-sm-2 control-label" for="category"><@spring.message "adver.category.label"/></label>
			      <div class="col-sm-2">
			        <select class="form-control" id="category" name="category" ng-model="createItem.category" ng-options="l.value as l.desc for l in options.categoryOptions"></select>
			   	  </div>
			   </div>
			   
			   <div class="form-group">
			      <label class="col-sm-2 control-label" for="addr"><@spring.message "adver.addr.label"/></label>
			      <div class="col-sm-10">
			        <input type="text" class="form-control" id="addr" ng-model="createItem.addr" name="addr" placeholder="<@spring.message "adver.addr.placeholder"/>">
			   	  </div>
			   </div>
			   
			     <div class="form-group">
			      <label class="col-sm-2 control-label" for="province"><@spring.message "merchant.province.label"/></label>
			      <div class="col-sm-2">
			        <select class="form-control" id="province" ng-model="createItem.province" name="province" placeholder="<@spring.message "merchant.province.placeholder"/>" ng-options="p.name as p.name for p in provinceList"></select>
			   	  </div>
			   	  
			      <label class="col-sm-2 control-label" for="city"><@spring.message "merchant.city.label"/></label>
			      <div class="col-sm-2">
			        <select class="form-control" id="city" ng-model="createItem.city" name="city" placeholder="<@spring.message "merchant.city.placeholder"/>" ng-options="c.name as c.name for c in cityList"></select>
			   	  </div>
			   	  
			      <label class="col-sm-2 control-label" for="district"><@spring.message "merchant.district.label"/></label>
			      <div class="col-sm-2">
			        <select class="form-control" id="district" ng-model="createItem.district" name="district" placeholder="<@spring.message "merchant.district.placeholder"/>" ng-options="a as a for a in areaList"></select>
			   	  </div>
			   </div>
			   
			   <div class="form-group">
			      <label class="col-sm-2 control-label" for="contactPerson"><@spring.message "adver.contactPerson.label"/></label>
			      <div class="col-sm-2">
			        <input type="text" class="form-control" id="contactPerson" ng-model="createItem.contactPerson" name="contactPerson" placeholder="<@spring.message "adver.contactPerson.placeholder"/>">
			   	  </div>
			   	  
			      <label class="col-sm-2 control-label" for="contactPhone"><@spring.message "adver.contactPhone.label"/></label>
			      <div class="col-sm-2">
			        <input type="text" class="form-control" id="contactPhone" ng-model="createItem.contactPhone" name="contactPhone" placeholder="<@spring.message "adver.contactPhone.placeholder"/>">
			   	  </div>
			   	  
			      <label class="col-sm-2 control-label" for="operationPerson"><@spring.message "adver.operationPerson.label"/></label>
			      <div class="col-sm-2">
			        <input type="text" class="form-control" id="operationPerson" ng-model="createItem.operationPerson" name="operationPerson" placeholder="<@spring.message "adver.operationPerson.placeholder"/>">
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
