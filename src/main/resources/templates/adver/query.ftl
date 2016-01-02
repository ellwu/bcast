<div class="row">
	<div class="col-xs-6 col-md-6">
		<form role="form" id="queryForm" class="form-horizontal">
			<div class="form-group">
				  <label class="col-sm-3 control-label" for="name"><@spring.message "adver.name.label"/></label>
				  <div class="col-sm-9">
					<input type="text" class="form-control" id="name" name="name" ng-model="queryItem.name" placeholder="<@spring.message "adver.name.placeholder"/>">
				  </div>
			</div>
			
			<div class="form-group">
				  <label class="col-sm-3 control-label" for="category"><@spring.message "adver.category.label"/></label>
				  <div class="col-sm-9">
					<select class="form-control" id="category" name="category" ng-model="queryItem.category" ng-options="l.value as l.desc for l in options.categoryOptions"></select>
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
