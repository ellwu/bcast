<div class="modal fade" id="deviceModal" tabindex="-1" role="dialog" aria-labelledby="deviceModalLabel" aria-hidden="true">
   <div class="modal-dialog modal-lg">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title" id="deviceModalLabel"><@spring.message "prompt.search"/></h4>
         </div>
         <div class="modal-body">           
			
			<div class="panel panel-default">
				<div class="panel-heading">
					<@spring.message "merchant.devices.title"/>
				</div>
						
				<div class="panel-body">
					<div class="table-responsive">
				  	<table class="table table-bordered">
							<thead> 
								<tr> 
									<th><@spring.message "device.sn.head"/></th>
									<th><@spring.message "device.batch.head"/></th>
								</tr> 
							</thead> 
							<tbody> 
								<tr ng-repeat="item in devices.data">
								    <td>{{ item.sn }}</td>
								    <td>{{ item.batch }}</td>
								  </tr>
							</tbody> 
						</table>
					</div>
				</div>
						  
				<div class="panel-footer">
				
				</div>
			</div>

		</div>
         <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal"><@spring.message "prompt.close"/></button>
         </div>
      </div>
	</div>
</div>