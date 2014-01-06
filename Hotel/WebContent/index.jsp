<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Accueil</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta name="description"
	content="This is a wonderful homepage of the Free Hotel Website Template provided by TemplateMonster." />
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
				<h2>FiveStar est heureux de vous accueillir!</h2>
				<img class="img-indent png" alt="" src="images/1page-img1.png" />
				<p class="alt-top">Venez seul ou avec votre famille avec vous,
					restez ici pour une nuit ou pendant des semaines, rester ici
					pendant un voyage d'affaires ou à une sorte de conférence - de
					toute façon notre chaine d'hôtellerie est la meilleure variante
					possible </ p>. N'hésitez pas à nous contacter à tout moment au cas
					où vous avez des questions ou des préoccupations.
				<div class="clear"></div>
				<div class="line-hor"></div>
				<div class="wrapper line-ver" align="center">
					<div class="col-1">
						<h4 style="color: red;">Des offres spéciales pour la fin de
							la semaine</h4>
						<ul>
							<li>FREE wide-screen TV</li>
							<li>50% Discount for Restaraunt service</li>
							<li>30% Discount for 3 days+ orders</li>
							<li>FREE drinks and beverages in rooms</li>
							<li>Exclusive souvenirs</li>
						</ul>

					</div>
					<div class="col-2">
						<h3>Localisation</h3>
						<p>Nous sommes situés dans le centre de Casablanca entouré de
							centres commerciaux et boutiques..</p>
						<dl class="contacts-list">
							<dt>Maroc Casablanca et region</dt>
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