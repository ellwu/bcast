<div class="row">
	<div class="col-xs-6 col-md-6">
		<form role="form" id="queryForm" class="form-horizontal">
			<div class="form-group">
				  <label class="col-sm-3 control-label" for="sn"><@spring.message "target.sn.label"/></label>
				  <div class="col-sm-9">
					<input type="text" class="form-control" id="sn" name="sn" ng-model="queryItem.sn" placeholder="<@spring.message "target.sn.placeholder"/>">
				  </div>
			</div>
			
			<div class="form-group">
				  <label class="col-sm-3 control-label" for="resource"><@spring.message "target.resource.label"/></label>
				  <div class="col-sm-9">
					<input type="text" class="form-control" id="resource" name="resource" ng-model="queryItem.resource" placeholder="<@spring.message "target.resource.placeholder"/>">
				  </div>
			</div>
			
			<div class="form-group">
				  <label class="col-sm-3 control-label" for="merchant"><@spring.message "target.merchant.label"/></label>
				  <div class="col-sm-9">
					<input type="text" class="form-control" id="merchant" name="merchant" ng-model="queryItem.merchant" placeholder="<@spring.message "target.merchant.placeholder"/>">
				  </div>
			</div>
			
			<div class="form-group">
				  <label class="col-sm-3 control-label" for="name"></label>
				  <div class="col-sm-9">
					<button type="button" class="btn btn-primary" ng-click="query()"><@spring.message "prompt.query"/></button>
					<button type="button" class="btn btn-primary" ng-click="resetQuery()"><@spring.message "prompt.reset"/></button>
				  </div>
			</div>
		</form>
	</div>
</div>
