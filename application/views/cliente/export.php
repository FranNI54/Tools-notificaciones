<?php date_default_timezone_set('America/Argentina/Buenos_Aires'); ?>

<div id="filtros">
	<div class="form-group">
		<br>
		<label style="margin-bottom:10px;"for="fecha" >Clientes desde...</label>
		<div class="input-group date form_date col-md-6" data-date="<?php echo date('d/m/Y H:i', time()) ?>" data-date-format="dd/mm/yyyy hh:ii" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd hh:ii">
			<input class="form-control" placeholder="Elegí Fecha" size="16" type="text" value="<?php echo date('d/m/Y H:i',strtotime(" -1 months")); ?>" readonly >
			<span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
			<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
		</div>
		<input type="hidden" id="dtp_input2" value="<?php echo date('Y-m-d H:i',strtotime(" -1 months")); ?>"  name="fecha" />
		<script>
			jQuery('.form_date').datetimepicker({
			language:  'ar',
			weekStart: 0,
			todayBtn:  1,
			autoclose: 1,
			todayHighlight: 1,
			startView: 2,
			minView: 0,
			forceParse: 0
			});
		</script>
    </div>
	<hr>
	<div class="form-group listado-checks" id="sucursal">
		<h4>Sucursales</h4>
		<label><input type="checkbox" value="1" name="todas" checked /><strong> Todas</strong></label><br>
		<?php foreach($stores as $store){ ?>
		<label><input type="checkbox" value="1" name="<?php echo $store["STORE_NO"] ?>" checked /> <?php echo $store["NAME"] ?></label>
		<?php } ?>
	</div>
	<hr>
	<div class="form-group listado-checks" id="tipo">
		<h4>Tipo</h4>
		
			<label><input type="checkbox" value="1" name="todas" checked /><strong> Todas</label></strong><br>
					
			<label><input type="checkbox" value="1" name='Almacen' checked /> Almacén<br><br></label>
			<label><input type="checkbox" value="1" name='Autoservicios/Supermercados' checked /> Autoservicios / Supermercados</label>
			<label><input type="checkbox" value="1" name='Bares/Discotecas' checked /> Bares / Discotecas <br><br></label>
			<label><input type="checkbox" value="1" name='Carnicerias' checked /> Carnicerias <br><br></label>
			<label><input type="checkbox" value="1" name='Centros Medicos/Hospitales' checked /> Centros Medicos/Hospitales</label>
			<label><input type="checkbox" value="1" name='Consumidor Individual' checked /> Consumidor Individual <br><br></label>
			<label><input type="checkbox" value="1" name='Convenio Amigo' checked /> Convenio Amigo</label>
			<label><input type="checkbox" value="1" name='Convenio Amigo Final' checked  /> Convenio Amigo Final</label>
			<label><input type="checkbox" value="1" name='Convenios con Entidades' checked /> Convenios con Entidades</label>
			<label><input type="checkbox" value="1" name='Distr./Comer.May.Alim/No Aliem' checked /> Distr. / Comer.May.Alim/No Aliem</label>
			<label><input type="checkbox" value="1" name='Distri./Comer.May.No Alimentos' checked />	Distri. / Comer.May.No Alimentos</label>
			<label><input type="checkbox" value="1" name='Distri./Comer.Mayor.Alimentos' checked /> Distri. / Comer.Mayor.Alimentos</label>
			<label><input type="checkbox" value="1" name='Empleado Makro' checked /> Empleado Makro<br><br></label>
			<label><input type="checkbox" value="1" name='Empresas Privadas' checked /> Empresas Privadas<br><br></label>
			<label><input type="checkbox" value="1" name='Escuelas/Colegios/Universid.' checked /> Escuelas / Colegios / Universid.</label>
			<label><input type="checkbox" value="1" name='Export.de Alim./No Alimentos' checked /> Export.de Alim./No Alimentos</label>
			<label><input type="checkbox" value="1" name='Exportacion de Alimentos' checked /> Exportación de Alimentos<br><br></label>
			<label><input type="checkbox" value="1" name='Exportacion de No Alimentos' checked /> Exportación de No Alimentos</label>
			<label><input type="checkbox" value="1" name='Fast Food' checked /> Fast Food<br><br></label>
			<label><input type="checkbox" value="1" name='Hoteles' checked /> Hoteles<br><br></label>
			<label><input type="checkbox" value="1" name='Ind.de Alimentos/No Alimentos' checked /> Ind.de Alimentos/No Alimentos</label>
			<label><input type="checkbox" value="1" name='Industria de Alimentos' checked />	Industria de Alimentos<br><br></label>
			<label><input type="checkbox" value="1" name='Industria de No Alimentos' checked /> Industria de No Alimentos</label>
			<label><input type="checkbox" value="1" name='Industrias' checked /> Industrias<br><br></label>
			<label><input type="checkbox" value="1" name='Kioscos' checked /> Kioscos<br><br></label>
			<label><input type="checkbox" value="1" name='No Valido' checked /> No Valido<br><br></label>
			<label><input type="checkbox" value="1" name='Oficinas' checked /> Oficinas<br><br></label>
			<label><input type="checkbox" value="1" name='Panaderias' checked /> Panaderías<br><br></label>
			<label><input type="checkbox" value="1" name='Pizzerias' checked /> Pizzerias<br><br></label>
			<label><input type="checkbox" value="1" name='Restaurantes' checked /> Restaurantes<br><br></label>
			<label><input type="checkbox" value="1" name='Servicios de Automotor' checked /> Servicios de Automotor<br><br></label>
			<label><input type="checkbox" value="1" name='Servicios de Catering' checked /> Servicios de Catering<br><br></label>
			<label><input type="checkbox" value="1" name='Servicios en General' checked /> Servicios en General<br><br></label>
			<label><input type="checkbox" value="1" name='Tiendas de Departamento' checked /> Tiendas de Departamento<br><br></label>
			<label><input type="checkbox" value="1" name='Tiendas Especializadas' checked /> Tiendas Especializadas<br><br></label>
			<label><input type="checkbox" value="1" name='Tiendas Especializadas (N/A)' checked /> Tiendas Especializadas (N/A)</label>
			
			
	</div>
	<hr>
	<div class="listado-checks" id="columna">
	<h4>Columnas</h4>
	<label><input type="checkbox" value="1" name="CUST_NAME" checked /> Nombre</label>
	<label><input type="checkbox" value="1" name="PASSPORT_NO" checked /> Pasaporte</label>
	<label><input type="checkbox" value="1" name="EMAIL" /> Email</label>
	<label><input type="checkbox" value="1" name="PHONE" /> Telefono</label>
	<label><input type="checkbox" value="1" name="STORE_NO" /> Sucursal</label>
	<label><input type="checkbox" value="1" name="CUST_TYPE_DESCR" /> Tipo</label>
	<label><input type="checkbox" value="1" name="CAP_CUSTOMERS.TS" checked /> Fecha ultimo registro</label>
	

	</div>
	<br>
	<button id="filtrar-button"type="button">Filtrar</button>
</div>
<button id="volver-filtro"type="button" style="display:none;">Cambiar filtro</button>
<div id="table-container">

</div>


<form id="guardar" name="myform" action="<?php echo base_url(array("cliente","exportTable")); ?>" method="post" target="_blank" style="display:none;">

  <input type="hidden" name='<?php echo $this->security->get_csrf_token_name(); ?>'  value="<?php echo $this->security->get_csrf_hash(); ?>" />
  <input type="hidden" name='table' id="tablaErrores"  value='' />
  <input type="hidden" name='name'   value='reporte' />
  <input type="hidden" name='cabecera' id="cabecera"  value='' />
  
  <button style="color:white;" class="error-button">Descargar Reporte</button>
</form>


	<script>
	var currentData;
	$("document").ready(function(){
		$("body").on("click","#filtrar-button",function(){
			console.log("filtro");
			var auxObj={};
			$(".listado-checks").each(function(){
				auxObj[$(this).attr("id")]= new Array();
			});
			$(".listado-checks input").each(function(){
				//console.log($(this).attr("name"));
				//console.log($(this).parent().parent().attr("id"));
				if(this.checked){
				auxObj[$(this).parent().parent().attr("id")].push($(this).attr("name"));
				}
			});
			auxObj["fecha"]= $("#dtp_input2").val();
			console.log(auxObj);
			$("#filtros").hide();
			$("#volver-filtro").show();
			
			$("#table-container").html("<h3>Cargando...</h3>");
			$("#table-container").show();
			$.post('<?php echo base_url(); ?>cliente/filter',{json:JSON.stringify(auxObj),'<?php echo $this->security->get_csrf_token_name(); ?>' : '<?php echo $this->security->get_csrf_hash(); ?>'},function(response,data){
				if(response==""){
					$("#table-container").html("<h4>No se han encontrado resultados con esos parametros.</h4>");
					$("#guardar").hide();
					
					return;
				}
				$("#guardar").show();
				response=JSON.parse(response);
				currentData=response["data"];
				$("#tablaErrores").val(JSON.stringify(response["data"]));
				
				
		$("#table-container").html("<h3>Preview</h3>");
		$("#table-container").append(response["table"]);
		
		$(".row-STORE_NO").each(function(){
			$(this).text(sucursalesNombres[$(this).text()]);
		});
		var cabecera= new Array();
		$("#table-container table th").each(function(){
					cabecera.push($(this).text());
				});
				console.log(cabecera);
		$("#cabecera").val(JSON.stringify(cabecera));
		$("#table-container table").attr("id","table");
		table=$('#table-container table').DataTable({"columnDefs": [ {

		"targets": [0,1,2],
		"orderable": true
		} ]});
		
		
			});
		});
		
		$("body").on("click","#volver-filtro",function(){
			$("#filtros").show();
			$("#volver-filtro").hide();
			$("#guardar").hide();
			$("#table-container").hide();
		});
		
		$("body").on("click","[name=todas]",function(){
			//console.log(this.checked);
			$(this).parent().parent().find("input").prop('checked', this.checked);
		});
	});
	
var sucursalesNombres={};
<?php foreach($stores as $store){ ?>
sucursalesNombres[<?php echo $store["STORE_NO"]; ?>]= "<?php echo $store["NAME"]; ?>";
<?php } ?>
	</script>
	
<style>
.listado-checks label{width:200px;display:inline-block;margin:7px 10px;font-size:14px;line-height:20px;height:30px;}

.listado-checks{width:800px;}
#table .marquesina td{font-size:14px;background-color:transparent;color:#9f9f9f;}
.marquesina-activa{background-color:transparent;text-align:left;}
label{color:#8c8c8c !important;}

</style>