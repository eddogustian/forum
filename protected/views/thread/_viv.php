<div class="alert-message block-message info">
	<table>
		<tr>
			<td width="15%" class="tengah">
			<?php 
				$haha=User::model()->findByPk($data->user_id);
				echo Chtml::image('a/../avatar/'.$haha->avatar,'DORE', array("width"=>100)).'<br/>';
				echo $haha->username.'<br/>';
				echo $data->tanggalPost; 
			?>
			</td>
			<td>
				<?php echo $data->judul;?><hr/>
				<?php echo $data->isi; ?>
			</td>
		</tr>
	</table>
</div>