<div class="row">
	<div class="col-xs-6 col-md-6">
		<form role="form" id="queryForm" class="form-horizontal">
			<div class="form-group">
				  <label class="col-sm-3 control-label" for="name"><@spring.message "merchant.name.label"/></label>
				  <div class="col-sm-9">
					<input type="text" class="form-control" id="name" name="name" ng-model="merchant.queryItem.name" placeholder="<@spring.message "merchant.name.placeholder"/>">
				  </div>
			</div>
			
			<div class="form-group">
			      <label class="col-sm-3 control-label" for="level"><@spring.message "merchant.level.label"/></label>
			      <div class="col-sm-9">
			   	  	<select class="form-control" id="level" name="level" ng-model="merchant.queryItem.level" ng-options="l.value as l.desc for l in merchant.options.levelOptions"></select>
			   	  </div>
			   </div>
			   <div class="form-group">
			      <label class="col-sm-3 control-label" for="category"><@spring.message "merchant.category.label"/></label>
			      <div class="col-sm-9">
			        <select class="form-control" id="category" name="category" ng-model="merchant.queryItem.category" ng-options="l.value as l.desc for l in merchant.options.categoryOptions"></select>
			   	  </div>
			   </div>
			
			<div class="form-group">
				  <label class="col-sm-3 control-label" for="name"></label>
				  <div class="col-sm-9">
					<button type="button" class="btn btn-primary" ng-click="merchant.query()"><@spring.message "prompt.query"/></button>
					<button type="button" class="btn btn-primary" ng-click="merchant.resetQuery()"><@spring.message "prompt.reset"/></button>
				  </div>
			</div>
		</form>
	</div>
</div>
