<%@page import="classes.ConnectionFactory"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<title>Connexion</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<link href="layout.css" rel="stylesheet" type="text/css" />
<script src="maxheight.js" type="text/javascript"></script>
<!--[if lt IE 7]>
	<link href="ie_style.css" rel="stylesheet" type="text/css" />
   <script type="text/javascript" src="ie_png.js"></script>
   <script type="text/javascript">
	   ie_png.fix('.png, #header .row-2, #header .nav li a, #content, .gallery li');
   </script>
<![endif]-->
<script type="text/javascript" src="./js/datepicker.js"></script>
<script type="text/javascript">
	function verif() {
		if (document.formulaire.login.value == ""
				|| document.formulaire.pass.value == ""

		) {
			alert("Veuillez verifier les champs !");
			document.formulaire.login.focus();
			return false;
		}

	}
</script>

</head>
<body id="page5" onload="new ElementMaxHeight();">
	<div id="main">
		<!-- header -->
		<jsp:include page="Header.jsp"></jsp:include>
		<!-- content -->
		<div id="content">
			<div class="gallery">
			<ul>
				<li><img alt="" src="images/h38.jpg" /></li>
				<li><img alt="" src="images/h31.jpg" /></li>
				<li><img alt="" src="images/h32.jpg" /></li>
				<li><img alt="" src="images/h35.jpg" /></li>
				<li><img alt="" src="images/h36.jpg" /></li>
				<li><img alt="" src="images/h37.jpg" /></li>
			</ul>
			</div>
			<div class="indent2" align="center">
				
						<h2>Connexion</h2>
					<form action="Connect" name="formulaire" onsubmit="return verif()" method="post">
					<label for="login">Login </label><input type="text" name="login" maxlength="25"/><br />
					<label for="password">Mot de passe </label><input type="text" name="password" maxlength="25"/><br />
					<label for="profile">Profile </label><select name="profile">
									<option value="Client">Client</option>
									<option value="Receptionniste">Réceptionniste</option>
									<option value="Admin">Administrateur</option>

							</select><br />
					
					<label for="connexion"></label><input style ="background-color : grey" type="submit" value="Connexion" size="100">
			
				</form>


			</div>
			
		</div>
		<!-- footer -->
		<jsp:include page="Footer.jsp"></jsp:include>
	</div>
</body>
</html>