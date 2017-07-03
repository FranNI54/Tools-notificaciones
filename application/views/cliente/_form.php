	<div class="form-group">
		<label for="CUST_NAME">Nombre</label>
		<input class="form-control" name="CUST_NAME" value="<?php if(isset($cliente['CUST_NAME'])){echo $cliente['CUST_NAME'];} ?>"/>
	</div>
	
	<div class="form-group">
		<label for="DEVICEID">Identificador dispostivo</label>
		<input class="form-control" name="DEVICEID" value="<?php if(isset($cliente['DEVICEID'])){echo $cliente['DEVICEID'];} ?>"/>
	</div>
	