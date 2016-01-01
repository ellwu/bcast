<div class="row">
	<div class="col-xs-6 col-md-3">
		<form role="form" id="queryForm" class="form-horizontal">
			<div class="form-group">
				  <label class="col-sm-3 control-label" for="adver"><@spring.message "resource.adver.label"/></label>
				  <div class="col-sm-9">
					<input type="text" class="form-control" id="adver" name="adver" ng-model="queryItem.adver" placeholder="<@spring.message "resource.adver.placeholder"/>">
				  </div>
			</div>
			
			<div class="form-group">
				  <label class="col-sm-3 control-label" for="originName"><@spring.message "resource.originName.label"/></label>
				  <div class="col-sm-9">
					<input type="text" class="form-control" id="originName" name="originName" ng-model="queryItem.originName" placeholder="<@spring.message "resource.originName.placeholder"/>">
				  </div>
			</div>
			
			<div class="form-group">
				  <label class="col-sm-3 control-label" for="category"><@spring.message "resource.category.label"/></label>
				  <div class="col-sm-9">
					<input type="text" class="form-control" id="category" name="category" ng-model="queryItem.category" placeholder="<@spring.message "resource.category.placeholder"/>">
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
