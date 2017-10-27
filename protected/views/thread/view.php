<?php
$kate=Kategori::model()->findByPk($model->kategori_id);


$this->breadcrumbs=array(
	$kate->kategori=>array('kategori/view','id'=>$kate->id),
	$model->judul,
);

$this->menu=array(
	array('label'=>'List Thread', 'url'=>array('index')),
	array('label'=>'Create Thread', 'url'=>array('create')),
	array('label'=>'Update Thread', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete Thread', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Thread', 'url'=>array('admin')),
);
?>
<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'thread-form',
	'enableAjaxValidation'=>false,
)); ?>
<?php 
	$this->widget('CStarRating',array(
        'name'=>'rating',
        'minRating'=>1, 
        'maxRating'=>5,
        'starCount'=>5, 
		'value'=>$rate,
        ));
	echo CHtml::submitButton(" Vote ");
?>
<?php $this->endWidget(); ?>

<table class="alert-message success">
  <tr>
    <th colspan="2">
		<h1><?php echo $model->judul; ?></h1>
	</th>
  </tr>
  <tr>
    <td width="15%">
		<div class="tengah">
			<?php 
				$TS=User::model()->findByPk($model->user_id);
				echo CHtml::link($TS->username,
				array('user/view','id'=>$model->user_id)); 
			?>
		</div>
		<br/>
		<div class="tengah">
			<?php
				$link='a/../avatar/'.$TS->avatar; 
				echo CHtml::link(CHtml::image($link, 'DORE', array("width"=>80)), '#');
			?>
		</div>
	</td>
    <td><?php echo $model->isi; ?></td>
  </tr>
</table>
<?php 
	echo Chtml::link('Tambahkan Komentar',
	array('comment/create','id'=>$model->id),array('class'=>'btn success'));
?>


<?php $form=$this->beginWidget('CActiveForm', array(
)); ?>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$allt->search(),
	'itemView'=>'_viv',
	'emptyText'=>'Belum ada komentar pada thread ini'
)); ?>
<?php $this->endWidget(); ?>