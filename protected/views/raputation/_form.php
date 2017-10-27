<div class="form">

<?php $form=$this->beginWidget('ext.bootstrap.widgets.BootActiveForm', array(
	'id'=>'raputation-form',
	'enableAjaxValidation'=>false,
)); ?>

	<?php echo $form->errorSummary($model); ?>
	<b>
	<?php echo "Berikan Reputasi Untuk :<h1>".User::model()->findByPk($id)->username."</h1>"; ?>
	</b>
	
	<div class="row">
		<?php echo $form->dropDownList($model,'jenis',
			array(-1=>'Bad',1=>'Good'),array()); ?>
		<?php echo $form->error($model,'jenis'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->