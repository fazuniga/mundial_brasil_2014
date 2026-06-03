<div class="panel panel-success">
	<div class="panel-heading">
		<h3 class="panel-title">
			<strong>Polla BRASIL 2014</strong>
			<p class="pull-right"><strong>CP & BP</strong></p>
		</h3>
	</div>
	<div class="panel-body">¡Completa el siguiente formulario, y participa!</div>
</div>
<fieldset>
	<form id="registerForm" class="form-horizontal" role="form" action="./" method="post">
		<div class="form-group">
			<label for="inputNombre" class="col-md-offset-2 col-sm-3 control-label">Nombre</label>
			<div class="col-xs-3">
				<input type="text" class="form-control form-polla" name="nombre" id="nombre" placeholder="Ingresa tu Nombre">
			</div>
		</div>
		<div class="form-group">
			<label for="inputApellido" class="col-md-offset-2 col-sm-3 control-label">Apellido</label>
			<div class="col-xs-3">
				<input type="text" class="form-control form-polla" name="apellido" id="apellido" placeholder="Ingresa tu Apellido">
			</div>
		</div>
		<div class="form-group">
			<label for="inputEmail" class="col-md-offset-2 col-sm-3 control-label">Email</label>
			<div class="col-xs-3">
				<input type='email' class='form-control form-polla' name='email' id='email' placeholder='Correo Electrónico'>
			</div>
		</div>
		<div class="form-group">
			<label for="inputUsername" class="col-md-offset-2 col-sm-3 control-label">Usuario</label>
			<div class="col-xs-3">
				<input type="text" class="form-control form-polla" name="username" id="username" placeholder="Nombre de Usuario">
			</div>
		</div>
		<div class="form-group">
			<label for="inputPassword" class="col-md-offset-2 col-sm-3 control-label">Password</label>
			<div class="col-xs-3">
				<input type="password" class="form-control form-polla" name="password" id="password" placeholder="Password">
			</div>
		</div>
		<div class="form-group">
			<label for="inputPais" class="col-md-offset-2 col-sm-3 control-label">País Favorito</label>
			<div id="divDropPais" class="btn-group col-xs-3"></div>
		</div>
		<div class="form-group">
			<label for="inputError" class="col-md-offset-2 col-sm-3 control-label sr-only">Error</label>
			<div>
				<p id="register_error">El usuario ya está registrado</p>
			</div>
		</div>
		<div class="form-group">
			<div class="col-md-offset-5 col-sm-5">
				<button id="register" name="submitButton" type="submit" class="btn btn-success">Registrarse</button>
			</div>
		</div>
	</form>
</fieldset>