<footer>
	
    <div class="footer_outer">
        <div class="footer container-fluid">
            <div class="row">
                <div class="col-xs-12">
                    <img src="/assets/images/logo-footer.png" alt="Logo" title="Makro" />
                </div>

            </div>
            <div class="row">
                <div class="col-xs-3" style="width: 20%;">
                    <a href="/quienes-somos">LA EMPRESA</a>
                    <ul>
                        <li><a href="/quienes-somos">Quiénes somos</a></li>
                        <li><a href="/preguntas-frecuentes">Preguntas frecuentes</a></li>
                        <li><a href="/trabaja-con-nosotros">Trabajá con nosotros</a></li>
                        <li><a href="/pasaporte">Pasaporte Makro</a></li>
                    </ul>
                </div>
                <div class="col-xs-3" style="width: 20%;">
                    <span style="color:white;">CANALES DE VENTA</span>
                    <ul>
                        <li><a href="/telemakro">Telemakro</a></li>
                        <li><a href="/siga">Siga</a></li>
                    </ul>
                </div>
                <div class="col-xs-3" style="width: 18%;">
                    <a href="/servicios">SERVICIOS</a>
                    <ul>
                        <li><a href="/medios-de-pago">Medios de pago</a></li>
                        <li><a href="/restaurantes">Restaurantes</a></li>
                        <li><a href="/estaciones-de-servicio">Estaciones de servicio</a></li>
                    </ul>
                </div>
                <div class="col-xs-3" style="width: 24%;">
                    <a href="/catalogos">ESPACIO PROFESIONAL</a>
                    <ul>
                        <li><a href="/catalogos">Catálogos</a></li>
                    </ul>
                </div>
                <div class="col-xs-3" style="width: 18%;">
                    <a href="/rse">RSE</a>
                    <ul>
                        <li><a href="/rse">ONG's y acciones sustentables</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <div class="footer_breadcrumbs_outer">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xs-12">
                    <div>
                        <a class="aFooter" href="/condiciones-de-uso">Condiciones de uso</a>
                        <span style="font-size: 7px; color: #929292"><sup>&#9679;</sup></span>
                        <a class="aFooter" href="/mapa-del-sito">Mapa del sitio</a>
                        <span style="font-size: 7px; color: #929292"><sup>&#9679;</sup></span>
                        <a class="aFooter" href="/politica-de-privacidad">Política de privacidad</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="footer_border">
    </div>
</footer>

<script src="/assets/js/jquery.min.js"></script>
<script src="/assets/js/jquery.validate.min.js"></script>
<script src="/assets/js/jquery.numeric.js"></script>

<script src="/assets/js/bootstrap.min.js"></script>
<script src="/assets/js/bootstrap-datepicker.min.js"></script>
<script src="/assets/locales/bootstrap-datepicker.es.min.js"></script>

<script src="/assets/js/fileinput.min.js"></script>
<script src="/assets/js/fileinput_locale_es.js"></script>

<script src="/assets/js/summernote.min.js"></script>
<script src="/assets/locales/summernote-es-ES.js"></script>

<script src="/assets/js/global.js"></script>
<?php if(!empty($data)) {?>
<script src="/assets/js/<?php echo $data?>.js"></script>
<?php } ?>

<script>
    $(document).ready( function(){
       global.init();
       <?php if(!empty($data)) {?>
       particular.init();
       <?php } ?>
    });
</script>

<?php 

if (isset($_SESSION['admin'])) {
	if(isset($_SESSION['contentPreview'])&&isset($_SESSION['arrayAccess'])){
		$_SESSION['contentPreview']= null;
		$_SESSION['arrayAccess']=null;
	}
}

?>

</body>
</html>
