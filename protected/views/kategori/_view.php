<div class="view">

	<b>
	<?php
		$total=Thread::model()->countByAttributes(array('kategori_id'=>$data->id)); 
		echo CHtml::link(CHtml::encode($data->kategori)."  (".$total.")", array('view', 'id'=>$data->id)); 
	?>
	</b>
</div>