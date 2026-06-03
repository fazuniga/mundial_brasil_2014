<?php 
if (isset($_SESSION['Nombre']) && $_SESSION['Nombre'] != '') { ?>
<div class='navbar navbar-default navbar-fixed-top' role='navigation'>
	<div class='container'>
        <div class=''>
			<ul class='nav navbar-nav'>  
				<li><a class='brand' href='../php/main.php'><strong>Polla CS&OR</strong></a></li>
			</ul>
			<ul class='nav navbar-nav navbar-right'>
				<li class='not-hover'>
					<button type='button' class='btn btn-default navbar-btn logout'>Salir</button>
				</li>
			</ul>
		</div>		
	</div>
</div>
<?php } else { ?>
<div class='navbar navbar-default navbar-fixed-top' role='navigation'>
	<div class='container'>
        <div>
			<ul class='nav navbar-nav'>  
				<li><a class='brand' href='../php/main.php'><strong>Polla CS&OR</strong></a></li>
			</ul>
			<ul class='nav navbar-nav navbar-right'>
				<li><a href='../php/bases-ol.php'>Bases de la Polla</a></li>
				<li class='not-hover'>
					<button type='button' class='btn btn-default navbar-btn login'>Entra a la Polla</button>
				</li>
			</ul>
		</div>
	</div>
</div>
<?php } ?>