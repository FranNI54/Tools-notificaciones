<div class="sidebar">
	<div class="logo" style="margin:0;"></div>
	<div ><a class="pestana pestana-inactiva" href="<?php echo base_url(array('marquesina', 'admin')); ?>" >Marquesinas</a><p class='pestana pestana-activa' >Notificaciones</p><a class="pestana pestana-inactiva" href="<?php echo base_url(array('cliente', 'export')); ?>" >Reportes</a></div>
	<br>
	<ul>
	
	<li><a href="<?php echo base_url(array('notificacion', 'admin')); ?>">Registro de Notificaciones Enviadas</a></li>
	<hr>
	<?php if(false){ ?>
	<li><a href="<?php echo base_url(array('grupo', 'create')); ?>">Crear Grupos</a></li>
	<?php } ?>
	<li><a href="<?php echo base_url(array('grupo', 'admin')); ?>">Administrar Grupos</a></li>
	
	<hr>
	<?php if(false){ ?>
	<li><a href="<?php echo base_url(array('cliente', 'create')); ?>">Crear Cliente</a></li>
	
	<?php } ?>
	<?php if(false){ ?>
	<li><a href="<?php echo base_url(array('cliente', 'cargar')); ?>">Cargar Clientes</a></li>
	<?php } ?>
	<?php if(false){ ?>
	<li><a href="<?php echo base_url(array('cliente', 'admin')); ?>">Administrar Clientes</a></li>
	<?php } ?>
	
	<?php if(false){ ?><hr>
	<li><a href="<?php echo base_url(array('notificacion', 'sendAll')); ?>/1">Actualizar envíos</a></li>
	<?php } ?>
	
	
	<li><a href="<?php echo base_url('user/logout' ); ?>">Logout</a></li>
	</ul>
</div>