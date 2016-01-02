<div class="row">
	<div class="col-xs-6 col-md-6">
		<form role="form" id="queryForm" class="form-horizontal">
			<div class="form-group">
			      <label class="col-sm-2 control-label" for="sn"><@spring.message "device.sn.label"/></label>
			      <div class="col-sm-10">
			        <input type="text" class="form-control" id="sn" ng-model="deviceItem.sn" name="sn" placeholder="<@spring.message "device.sn.placeholder"/>" readonly>
			   	  </div>
			   </div>
			   <div class="form-group">
			      <label class="col-sm-2 control-label"  for="batch"><@spring.message "device.batch.label"/></label>
			      <div class="col-sm-10">
			        <input type="text" class="form-control" id="batch" ng-model="deviceItem.batch" name="batch" placeholder="<@spring.message "device.batch.placeholder"/>" readonly>
			   	  </div>
			   </div>				
			
			<div class="form-group">
				  <label class="col-sm-2 control-label" for="name"></label>
				  <div class="col-sm-10">
					<a class="btn btn-primary" href="${base}/tofunc.do?key=F_DEVICE_HOME"><@spring.message "prompt.return"/></a>
				  </div>
			</div>
		</form>
	</div>
</div>
