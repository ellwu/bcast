<div class="row">
	<div class="col-xs-6 col-md-6">
		<form role="form" id="queryForm" class="form-horizontal">
			<div class="form-group">
				  <label class="col-sm-3 control-label" for="sn"><@spring.message "count.resourceId.label"/></label>
				  <div class="col-sm-9">
				  
			      	<div class="input-group">
						<input type="text" class="form-control" id="resourceName" ng-model="queryItem.resourceName" name="resourceName" placeholder="<@spring.message "count.resourceId.placeholder"/>" readonly>
			        	<input type="hidden" class="form-control" id="resourceId" ng-model="queryItem.resourceId" name="resourceId">
			        	<span class="input-group-btn">
				        	<button type="button" class="btn btn-default" ng-click="searchResource()"><@spring.message "prompt.search"/></button>
				      	</span>
				    </div>
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
