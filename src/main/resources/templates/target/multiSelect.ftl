<div class="modal fade" id="mDeleteModal" tabindex="-1" role="dialog" aria-labelledby="mDeleteModalLabel" aria-hidden="true">
   <div class="modal-dialog modal-sm">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title" id="mDeleteModalLabel"><@spring.message "resource.delete.title"/></h4>
         </div>
         <div class="modal-body">  
         	<div class="alert alert-danger" role="alert" ng-hide="deleteOk">{{ deleteMsg }}</div>  
			<p><@spring.message "prompt.delete.confirm"/>{{mDeletePrompt}}?</p>
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal"><@spring.message "prompt.close"/></button>
            <button type="button" class="btn btn-primary" ng-click="mDeleteConfirm()"><@spring.message "prompt.confirm"/></button>
         </div>
      </div>
	</div>
</div>