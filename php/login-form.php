<div class='panel panel-success'>
	<div class='panel-heading'>
		<h3 class='panel-title'>
			<strong>BRASIL 2014</strong>
			<p class="pull-right"><strong>CP & BP</strong></p>
		</h3>
	</div>
	<div class='panel-body'>Bienvenido a la Polla Mundialera de Brasil 2014</div>
</div>
<fieldset>			
	<form class='form-horizontal' role='form' action='./' method='post'>
		<div class='form-group'>
			<label for='inputUsername' class='col-md-offset-2 col-sm-3 control-label'>Usuario</label>
			<div class='col-xs-3'>
				<input type='text' class='form-control form-polla' name='name' id='username' placeholder='Nombre de Usuario'>
			</div>
		</div>
		<div class='form-group'>
			<label for='inputPassword' class='col-md-offset-2 col-sm-3 control-label'>Password</label>
			<div class='col-xs-3'>
				<input type='password' class='form-control form-polla' name='word' id='password' placeholder='Password'>
			</div>
		</div>
		<div class='form-group'>
			<label for='inputPassword' class='col-md-offset-2 col-sm-3 control-label sr-only'>Error</label>
			<div><p id='login_error'></p></div>
		</div>
		<div class='form-group'>
			<label for='inputEntrar' class='sr-only col-md-offset-2 col-sm-3 control-label'>Entrar</label>
			<div class='col-sm-7'>
				<button id='btnLogin' type='submit' class='btn btn-primary'>Entrar a la Polla</button>
				<button id='btnRegister' type='button' class='btn btn-link'>¿No estás registrado?</button>
			</div>
		</div>
	</form>
</fieldset>