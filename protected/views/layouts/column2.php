<?php $this->beginContent('//layouts/main'); ?>
<div class="container">
		<div id="content">
		<?php
			if(Yii::app()->user->getLevel()<=2)
			{
				$this->widget('ext.bootstrap.widgets.BootMenu', array(
					'type'=>'tabs',
					'items'=>$this->menu,
				));
			}
		?>
			<?php echo $content; ?>
		</div><!-- content -->
	<div class="span-5 last">
		
		<div id="sidebar">
		
		</div><!-- sidebar -->
	</div>
</div>
<?php $this->endContent(); ?>