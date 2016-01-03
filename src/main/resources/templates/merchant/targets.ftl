<div class="modal fade" id="targetModal" tabindex="-1" role="dialog" aria-labelledby="targetModalLabel" aria-hidden="true">
   <div class="modal-dialog modal-lg">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title" id="targetModalLabel"><@spring.message "prompt.search"/></h4>
         </div>
         <div class="modal-body">           
			
			<div class="panel panel-default">
				<div class="panel-heading">
					
				</div>
						
				<div class="panel-body">
					<div class="table-responsive">
				  	<table class="table table-bordered">
							<thead> 
								<tr> 
									<th><@spring.message "target.sn.head"/></th> 
									
									<th><@spring.message "target.resource.head"/></th> 									
									
									<th><@spring.message "target.playSequence.head"/></th> 
									
									<th><@spring.message "target.beginTime.head"/></th> 									
									<th><@spring.message "target.endTime.head"/></th> 	
																
									<th><@spring.message "table.head.action"/></th>
								</tr> 
							</thead> 
							<tbody> 
								<tr ng-repeat="item in targets.data">
								    <td>{{ item.sn }}</td>
								    
								    <td>{{ item.resource }}</td>
								    
								    <td>{{ item.playSequence }}</td>
								    
								    <td>{{ item.beginTime }}</td>
								    <td>{{ item.endTime }}</td>
								    
								    <td>
								    	<a class="button glyphicon glyphicon-pencil" href="${base}/tofunc.do?key=F_EDIT_TARGET&targetId={{item.id}}"></a>
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