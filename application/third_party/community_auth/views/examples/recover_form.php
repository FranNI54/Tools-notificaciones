<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Community Auth - Recover Form View
 *
 * Community Auth is an open source authentication application for CodeIgniter 3
 *
 * @package     Community Auth
 * @author      Robert B Gottier
 * @copyright   Copyright (c) 2011 - 2017, Robert B Gottier. (http://brianswebdesign.com/)
 * @license     BSD - http://www.opensource.org/licenses/BSD-3-Clause
 * @link        http://community-auth.com
 */
?>

<h1>Recuperar cuenta</h1>

<?php
if( isset( $disabled ) )
{
	echo '
		<div style="border:1px solid red;">
			<p>
				Recuperación de cuenta esa inhabilitado.
			</p>
			<p>
				Si excedió el máximo permitido intento de logins o
				de recuperación de cuenta, esta funcionalidad estará inhabilitada
				por un corto periodo de tiempo.
				Por favor espere ' . ( (int) config_item('seconds_on_hold') / 60 ) . ' 
				minutos o o contacte a la administración si tiene problemas para acceder.
			</p>
		</div>
	';
}
else if( isset( $banned ) )
{
	echo '
		<div style="border:1px solid red;">
			<p>
				Cuenta bloqueada.
			</p>
			<p>
				Ha intentado usar la recuperación de contraseña con un email
				al que le ha sido denegado el acceso. Si cree que es un error, contacte con la administración
				para más detalles del estado de esta cuenta.
			</p>
		</div>
	';
}
else if( isset( $confirmation ) )
{
	echo '
		<div style="border:1px solid green;">
			<p>
				Felicidades, ha creado un link de recuperación de cuenta.
			</p>
			<p>
				Ha sido enviado un mail con instrucciones de como seguir.
			</p>
			<p>
				This is the account recovery link:
			</p>
			<p>' . $special_link . '</p>
		</div>
	';
}
else if( isset( $no_match ) )
{
	echo '
		<div  style="border:1px solid red;">
			<p class="feedback_header">
				El mail solicitado no es un mail registrado.
			</p>
		</div>
	';

	$show_form = 1;
}
else
{
	echo '
		<p>
			Si se ha olvidado la contraseña o usuario, ingrese el emial que ha usado para su cuenta y le enviaremos un mail con instrucciones.
		</p>
	';

	$show_form = 1;
}
if( isset( $show_form ) )
{
	?>

		 <?php echo form_open(); ?>
			<div>
				<fieldset>
					<legend>Ingrese su email:</legend>
					<div>

						<?php
							// EMAIL ADDRESS *************************************************
							echo form_label('Email','email', ['class'=>'form_label'] );

							$input_data = [
								'name'		=> 'email',
								'id'		=> 'email',
								'class'		=> 'form_input',
								'maxlength' => 255
							];
							echo form_input($input_data);
						?>

					</div>
				</fieldset>
				<div>
					<div>

						<?php
							// SUBMIT BUTTON **************************************************************
							$input_data = [
								'name'  => 'submit',
								'id'    => 'submit_button',
								'value' => 'Send Email'
							];
							echo form_submit($input_data);
						?>

					</div>
				</div>
			</div>
		</form>

	<?php
}
/* End of file recover_form.php */
/* Location: /community_auth/views/examples/recover_form.php */