<div class="row">
	<div class="col-xs-6 col-md-3">
		<form role="form" id="queryForm" class="form-horizontal">
			<div class="form-group">
				  <label class="col-sm-3 control-label" for="sn"><@spring.message "device.sn.label"/></label>
				  <div class="col-sm-9">
					<input type="text" class="form-control" id="sn" name="sn" ng-model="queryItem.sn" placeholder="<@spring.message "device.sn.placeholder"/>">
				  </div>
			</div>
			
			<div class="form-group">
				  <label class="col-sm-3 control-label" for="batch"><@spring.message "device.batch.label"/></label>
				  <div class="col-sm-9">
					<input type="text" class="form-control" id="batch" name="batch" ng-model="queryItem.batch" placeholder="<@spring.message "device.batch.placeholder"/>">
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
