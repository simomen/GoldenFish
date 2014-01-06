<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Accueil</title>
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

<link href="./css/datepicker.css" rel="stylesheet" type="text/css" />
</head>
<body id="page1" onload="new ElementMaxHeight();">
	<div id="main">
		<jsp:include page="Header.jsp"></jsp:include>
		<!-- content -->
		<div id="content" align="center">

			<div class="indent" align="center">
				<h2>Bienvenue sur notre site</h2>
				<img class="img-indent png" alt="" src="images/h27.jpg" />
				<p class="alt-top" style="color: white">Fondé en 1898, par Monsieur X, le groupe Prat-Hôtel a su garder intacte tout le charme et le caractère de ces hôtels. 
				La décoration y est personnalisée et raffinée.
				Nous serons ravis de vous acceuillir pendant vos séjours partout en France.Hôtels équipés en internet sans fil (WIFI en accès illimité et gratuit). 
				
				</p>
				<div class="clear"></div>
				<div class="line-hor"></div>
				<div class="wrapper line-ver" align="center">
					<div class="col-1">
						<h3>Options</h3>
						<ul>
							<li>Déjeuner inclus</li>
							<li>Centre de bien être</li>
							<li>Centre de remise en forme</li>
							<li>Bars/Lounges</li>
							<li>Parking payant</li>
						</ul>

					</div>
					<div class="col-2">
						<h3>Chambres</h3>
							<ul>
							<li>Cahmbres non-fumeurs</li>
							<li>Baignoire</li>
							<li>Réfrigérateur et minibar(Optionnel)</li>
							<li>Télévision LCD de 32 pouces</li>
							<li>Service de chambres 24 heures sur 24</li>
						</ul>
						<dl class="contacts-list">
							<dt>Pour nous contacter</dt>
							<dd>06-52-22-25-58</dd>
							<dd>06-42-25-96-01</dd>
						</dl>
					</div>
					<a href="Connect.jsp">Connectez-vous pour gérer vos
						réservations</a>
				</div>
			</div>
		</div>
		<!-- footer -->
		<jsp:include page="Footer.jsp"></jsp:include>
	</div>
</body>
</html>