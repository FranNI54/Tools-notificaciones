<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Community Auth - Login Form View
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

<?php
if( ! isset( $optional_login ) )
{
	//echo '<h1>Login</h1>';
}

if( ! isset( $on_hold_message ) )
{
	

	echo form_open( $login_url, ['class' => 'std-form login-container'] ); 
?>
	<div class="login-form">
	
		<div class="login-message">
		<?php
		if( isset( $login_error_mesg ) )
		{
			echo '
				<div style="background-color:white;padding:10px;color:red;">
					<p>
						Error : Usuario, Email o Password invalido.
					</p>
					<p>
						Usuario, email y password son todos case sensitive.
					</p>
				</div>
			';
		}

		if( $this->input->get('logout') )
		{
			echo '
				<div style="background-color:green;padding:10px;color:white;">
					<p>
						Te has deslogueado con éxito.
					</p>
				</div>
			';
		}
		?>
		</div>
		<br>
		<label for="login_string" class="form_label">Usuario o Email</label>
		<input type="text" name="login_string" id="login_string" class="form_input" autocomplete="off" maxlength="255" /><br>

		<br />

		<label for="login_pass" class="form_label">Password</label>
		<input type="password" name="login_pass" id="login_pass" class="form_input password" <?php 
			if( config_item('max_chars_for_password') > 0 )
				echo 'maxlength="' . config_item('max_chars_for_password') . '"'; 
		?> autocomplete="off" readonly="readonly" onfocus="this.removeAttribute('readonly');" />


		<?php
			if( config_item('allow_remember_me') )
			{
		?>

			<br />

			<label for="remember_me" class="form_label">Recordarme</label>
			<input type="checkbox" id="remember_me" name="remember_me" value="yes" />

		<?php
			}
		?>

		<p>
			<?php
				$link_protocol = USE_SSL ? 'https' : NULL;
			?>
			<?php if(false){ ?>
			<a href="<?php echo site_url('examples/recover', $link_protocol); ?>">
				¿No puedes acceder a tu cuenta?
			</a>
			<?php } ?>
		</p>


		<input type="submit" name="submit" value="Login" id="submit_button"  />

	</div>
</form>

<?php

	}
	else
	{
		// EXCESSIVE LOGIN ATTEMPTS ERROR MESSAGE
		echo '
			<div style="border:1px solid red;">
				<p>
					Excesivos intentos de logueo.
				</p>
				<p>
					Has excedido el máximo numero de intentos de logueo<br />
					que este sitio permite.
				<p>
				<p>
					Tu acceso a logueo y recuperación de cuenta ha sido bloqueado por ' . ( (int) config_item('seconds_on_hold') / 60 ) . ' minutos.
				</p>
				<p>
					Favor de usar la <a href="/examples/recover">Recuperación de cuenta</a> después que ' . ( (int) config_item('seconds_on_hold') / 60 ) . ' minutos hayan pasado,<br />
					o contacte a la administración si tiene problemas para acceder.
				</p>
			</div>
		';
	}
?>
<style>body{background-color:#df001d;text-align:center;}</style>
<?php

/* End of file login_form.php */
/* Location: /community_auth/views/examples/login_form.php */ 