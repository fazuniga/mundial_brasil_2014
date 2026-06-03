$(document).ready(function(){
	LoginLogout();

	Login();
	
	$("#btnRegister").click(function(){	
		window.location = '../php/register.php';
	});
});