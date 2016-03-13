<div class="modal fade" id="targetModal" tabindex="-1" role="dialog" aria-labelledby="targetModalLabel" aria-hidden="true">
   <div class="modal-dialog modal-lg">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title" id="targetModalLabel"><@spring.message "merchant.targets.title"/></h4>
         </div>
         <div class="modal-body">           
			
			<div class="panel panel-default">
				<div class="panel-heading">
					<a class="btn btn-default" ng-click="targetsNow()"><@spring.message "merchant.targets.now"/></a>
					<a class="btn btn-default" ng-click="targetsAll()"><@spring.message "merchant.targets.all"/></a>
				</div>
						
				<div class="panel-body">
					<div class="table-responsive">
				  	<table class="table table-bordered">
							<thead> 
								<tr> 
									<th><@spring.message "target.resource.head"/></th> 									
									
									<th><@spring.message "target.playSequence.head"/></th> 
									
									<th><@spring.message "target.beginTime.head"/></th> 									
									<th><@spring.message "target.endTime.head"/></th> 	
																
									<th><@spring.message "target.status.head"/></th>
									
									<th><@spring.message "table.head.action"/></th>
								</tr> 
							</thead> 
							<tbody> 
								<tr ng-repeat="item in targets.data">
								    <td>{{ item.resource }}</td>
								    
								    <td>{{ item.playSequence }}</td>
								    
								    <td>{{ item.beginTime | ldate }}</td>
								    <td>{{ item.endTime | ldate }}</td>
								    
								    <td>{{ item.endTime | targetStatus }}</td>
								    
								    <td>
								    	<a class="button glyphicon glyphicon-chevron-up" ng-click="seqUp($index)"></a>
								    	<a class="button glyphicon glyphicon-chevron-down" ng-click="seqDown($index)"></a>
								    </td>
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