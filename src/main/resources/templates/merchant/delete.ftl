<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
   <div class="modal-dialog modal-sm">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title" id="deleteModalLabel"><@spring.message "merchant.delete.title"/></h4>
         </div>
         <div class="modal-body">  
         	<div class="alert alert-danger" role="alert" ng-hide="deleteOk">{{ deleteMsg }}</div>  
			<p><@spring.message "prompt.delete.confirm"/> "{{deleteItem.name}}" ?</p>
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal"><@spring.message "prompt.close"/></button>
            <button type="button" class="btn btn-primary" ng-click="deleteConfirm()"><@spring.message "prompt.confirm"/></button>
         </div>
      </div>
	</div>
</div>