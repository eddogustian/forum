<?php
$this->breadcrumbs=array(
	'Kategori'=>array('index'),
	$model->kategori,
);

$this->menu=array(
	array('label'=>'List Kategori', 'url'=>array('index')),
	array('label'=>'Create Kategori', 'url'=>array('create')),
	array('label'=>'Update Kategori', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete Kategori', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Kategori', 'url'=>array('admin')),
);
?>

<?php $form=$this->beginWidget('CActiveForm', array(
)); ?>

<?php echo Chtml::link('Buat Thread Baru',array('thread/create','id'=>$model->id),array('class'=>'btn success')) ?>

<?php $this->widget('zii.widgets.grid.CGridView', array(
	'id'=>'thread-grid',
	'dataProvider'=>$allt->search(),
	//'filter'=>$allt,
	'emptyText'=>'Belum ada thread pada kategori ini',
	'summaryText'=>'',
	'columns'=>array(
		array(
			'name'=>'Judul',
			'type'=>'raw',
			'value'=>'Chtml::link($data->judul,array(\'thread/view\',\'id\'=>$data->id))',
		),
		array(
			'name'=>'Rate',
			'type'=>'raw',
			'value'=>'Threadstar::model()->rate($data->id)."/5"',
		),
		array(
			'name'=>'By',
			'type'=>'raw',
       		'htmlOptions'=>array('style'=>'text-align: center'),
			'value'=>'Chtml::link(User::model()->findByPk($data->user_id)->username,array("user/view","id"=>$data->user_id))',
		),
		array(
			'name'=>'Total Komentar',
       		'htmlOptions'=>array('style'=>'text-align: center'),
			'value'=>'Comment::model()->countByAttributes(array(\'thread_id\'=>$data->id))',
		),
	),
)); ?>

<?php $this->endWidget(); ?>