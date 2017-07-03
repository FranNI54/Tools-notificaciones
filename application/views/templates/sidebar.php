<div class="sidebar">
	<div class="logo" style="margin:0;"></div>
	<div ><p class="pestana pestana-activa">Marquesinas</p><a class='pestana pestana-inactiva' href="<?php echo base_url(array('notificacion', 'admin')); ?>">Notificaciones</a><a class="pestana pestana-inactiva" style="border-left:1px solid rgba(0,0,0,0.4);" href="<?php echo base_url(array('cliente', 'export')); ?>" >Reportes</a></div>
	<br>
	<ul>
	<li><a href="<?php echo base_url(array('marquesina', 'create')); ?>">Crear Marquesina</a></li>
	<li><a href="<?php echo base_url(array('marquesina', 'admin')); ?>">Administrar Marquesinas</a></li>
	<?php if($this->auth_level==9){ ?>
	<hr>
	<li><a href="<?php echo base_url(array('categoria', 'create')); ?>">Crear Categoría</a></li>
	<li><a href="<?php echo base_url(array('categoria', 'admin')); ?>">Administrar Categoría</a></li>
	<?php } ?>
	<hr>
	<li><a href="<?php echo base_url(array('categoria', 'setVigente')); ?>/1?trace=1">Actualizar JSON</a></li>
	<li><a href="<?php echo base_url("marquesinas.json"); ?>" target="_blank">Ver JSON</a></li>
	<li><a href="<?php echo base_url(array('miscelaneo', 'json')); ?>" >Setear URL Base</a></li>
	<?php if($this->auth_level==9){ ?>
	<hr>
	<li><a href="<?php echo base_url(array('user', 'create')); ?>">Crear Usuario</a></li>
	<li><a href="<?php echo base_url(array('user', 'admin')); ?>">Administrar Usuario</a></li>
	<?php } ?>
	<hr>
	
	
	
	<li><a href="<?php echo base_url('user/logout' ); ?>">Logout</a></li>
	</ul>
</div>

