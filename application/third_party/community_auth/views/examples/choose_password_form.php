<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Community Auth - Choose Password Form View
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

<h1>Recuperar cuenta - Etapa 2</h1>

<?php

$showform = 1;

if( isset( $validation_errors ) )
{
	echo '
		<div style="border:1px solid red;">
			<p>
				El siguiente error ocurrió:
			</p>
			<ul>
				' . $validation_errors . '
			</ul>
			<p>
				PASSWORD NO FUE ACTUALIZADA
			</p>
		</div>
	';
}
else
{
	$display_instructions = 1;
}

if( isset( $validation_passed ) )
{
	echo '
		<div style="border:1px solid green;">
			<p>
				Ha cambiado su password con éxito.
			</p>
			<p>
				Puede ahora <a href="/' . LOGIN_PAGE . '">loguearse</a>
			</p>
		</div>
	';

	$showform = 0;
}
if( isset( $recovery_error ) )
{
	echo '
		<div style="border:1px solid red;">
			<p>
				No hay data usable para recuperar cuenta.
			</p>
			<p>
				Links de recuperación de contraseña expira tras 
				' . ( (int) config_item('recovery_code_expiration') / ( 60 * 60 ) ) . ' 
				horas.<br />Tiene que usar  el formulario de
				<a href="/examples/recover">Recuperación de contraseña</a> 
				para enviarse otro link.
			</p>
		</div>
	';

	$showform = 0;
}
if( isset( $disabled ) )
{
	echo '
		<div style="border:1px solid red;">
			<p>
				Recuperación de contraseña inhabilitada.
			</p>
			<p>
				Has excedido el máximo numero de intentos de logueo<br />
				que este sitio permite. 
				Por favor espere ' . ( (int) config_item('seconds_on_hold') / 60 ) . ' 
				minutos o contacte a la administración si tiene problemas para acceder.
			</p>
		</div>
	';

	$showform = 0;
}
if( $showform == 1 )
{
	if( isset( $recovery_code, $user_id ) )
	{
		if( isset( $display_instructions ) )
		{
			if( isset( $username ) )
			{
				echo '<p>
					Su nombre de usuario es <i>' . $username . '</i><br />
					Favor de anotarlo y cambie su contraseña a continuación:
				</p>';
			}
			else
			{
				echo '<p>Por favor cambie su contraseña:</p>';
			}
		}

		?>
			<div id="form">
				<?php echo form_open(); ?>
					<fieldset>
						<legend>Paso 2 - Escoja su nueva contraseña</legend>
						<div>

							<?php
								// PASSWORD LABEL AND INPUT ********************************
								echo form_label('Password','passwd', ['class'=>'form_label']);

								$input_data = [
									'name'       => 'passwd',
									'id'         => 'passwd',
									'class'      => 'form_input password',
									'max_length' => config_item('max_chars_for_password')
								];
								echo form_password($input_data);
							?>

						</div>
						<div>

							<?php
								// CONFIRM PASSWORD LABEL AND INPUT ******************************
								echo form_label('Confirme contraseña','passwd_confirm', ['class'=>'form_label']);

								$input_data = [
									'name'       => 'passwd_confirm',
									'id'         => 'passwd_confirm',
									'class'      => 'form_input password',
									'max_length' => config_item('max_chars_for_password')
								];
								echo form_password($input_data);
							?>

						</div>
					</fieldset>
					<div>
						<div>

							<?php
								// RECOVERY CODE *****************************************************************
								echo form_hidden('recovery_code',$recovery_code);

								// USER ID *****************************************************************
								echo form_hidden('user_identification',$user_id);

								// SUBMIT BUTTON **************************************************************
								$input_data = [
									'name'  => 'form_submit',
									'id'    => 'submit_button',
									'value' => 'Change Password'
								];
								echo form_submit($input_data);
							?>

						</div>
					</div>
				</form>
			</div>
		<?php
	}
}
/* End of file choose_password_form.php */
/* Location: /community_auth/views/examples/choose_password_form.php */