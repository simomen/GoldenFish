<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<title>Contact</title>
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

<script type="text/javascript">
	function verif() {
		if (document.formulaire.nom.value == ""
				|| document.formulaire.prenom.value == ""
				|| document.formulaire.email.value == ""
				|| document.formulaire.adresse.value == ""
				|| document.formulaire.msg.value == ""
				) {
			alert("Veuillez verifier les champs !");
			document.formulaire.nom.focus();
			return false;
		}
		adresse = document.formulaire.email.value;
		var place = adresse.indexOf("@",1);
		var point = adresse.indexOf(".",place+1);
		if ((place > -1)&&(adresse.length >2)&&(point > 1))
			{
			
			return(true);
			}
		else
			{
			alert('Entrez une adresse e-mail valide!!');
			return(false);
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
				<h2>Nous contacter</h2>
				<form action="Envoyer" name="formulaire" onsubmit="return verif()" method="post">
					<label for="nom">Nom </label><input type="text" name="nom" /><br />
					<label for="prenom">Prénom </label><input type="text" name="prenom" /><br />
					<label for="adresse">Adresse </label><input type="text" name="adresse"><br />
					<label for="email">Email </label><input type="text" name="email"><br />
					<label for="msg">Message</label><TEXTAREA name="msg" rows=11 cols=40
									title="Ecrivez votre message ici"></TEXTAREA><br />
					<label for="newsletter"></label><input style ="background-color : grey" type="submit" value="Envoyer" size="100">
			
				</form>

			</div>
			<%if(request.getSession().getAttribute("envoi")!=null){ %>
			<label style="color: green;">Votre message a bien ete envoye</label>
			<%} %>
		</div>
		<!-- footer -->
		<jsp:include page="Footer.jsp"></jsp:include>
	</div>
</body>
</html>