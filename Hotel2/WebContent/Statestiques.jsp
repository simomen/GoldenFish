
<%@page import="classes.DAOhotel"%>
<%@page import="classes.ConnectionFactory"%>
<%@page import="java.sql.ResultSet"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<title>Visitors' Testimonials - Free Hotel Website Template
	designed by TemplateMonster</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta name="description"
	content="This is a testimonials page of the Free Hotel Website Template provided by Template Monster." />
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
<script src="jquery-1.7.1.min.js"></script>

<style>

			.tabs li {

				list-style:none;

				display:inline;

			}



			.tabs a {

				padding:5px 10px;

				display:inline-block;

				background:#666;

				color:#fff;

				text-decoration:none;

			}



			.tabs a.active {

				background:#fff;

				color:#000;

			}



		</style>

	<script>

			// Wait until the DOM has loaded before querying the document

			$(document).ready(function(){

				$('ul.tabs').each(function(){

					// For each set of tabs, we want to keep track of

					// which tab is active and it's associated content

					var $active, $content, $links = $(this).find('a');



					// Use the first link as the initial active tab

					$active = $links.first().addClass('active');

					$content = $($active.attr('href'));



					// Hide the remaining content

					$links.not(':first').each(function () {

						$($(this).attr('href')).hide();

					});



					// Bind the click event handler

					$(this).on('click', 'a', function(e){

						// Make the old tab inactive.

						$active.removeClass('active');

						$content.hide();



						// Update the variables with the new link and content

						$active = $(this);

						$content = $($(this).attr('href'));



						// Make the tab active.

						$active.addClass('active');

						$content.show();



						// Prevent the anchor's default click action

						e.preventDefault();

					});

				});

			});

		</script>

<script type="text/javascript">
	function verif() {
		if (document.formulaire.user.value == ""
				|| document.formulaire.pwd.value == ""
				
				) {
			alert("Veuillez verifier les champs !");
			document.formulaire.nom.focus();
			return false;
		}

	}
</script>
</head>
<body id="page5" onload="new ElementMaxHeight();">
	<div id="main">
		<!-- header -->
		
		
		<div id="header">
		<div class="row-1">
			<div class="wrapper">
				<div class="logo">
					<h1><a href="index.html">Five Star</a></h1>
					<em>Hotel Chain</em>
					<strong>SBDR Palais</strong>
				</div>
				<div class="phones">
					06-52-22-25-58<br />
					06-42-25-96-01
				</div>
			</div>
		</div>
		<div class="row-2">
	 		<div class="indent3">
<!-- header-box begin -->
				<div class="header-box">
					<div class="inner">
						<ul class="nav">
					 		<li><a href="Deconnect" class="current">Deconnect</a></li>
						</ul>
					</div>
				</div>
<!-- header-box end -->
			</div>
		</div>
	</div>
		<!-- content -->
		<div id="content">
		<%
		
		
		if((request.getSession().getAttribute("hotel")!= null)){
			 
			
		%>
			<div align="center">
									
									<ul class='tabs'>

											<li><a href='#tab1'>Graphe N 1</a></li>
								
											<li><a href='#tab2'>Graphe N 2</a></li>
								
											<li><a href='#tab3'>Graphe N 3</a></li>
											

										</ul>

										<div id='tab1'>
								
											<font style="color:silver;" size="5" >Graphe presente le nombre des chambres reserver par mois durant l'annee</font>
								<br>
								<br>
											<p><img src="graphe_NB_reserv_mois"></img></p>
										
										</div>

										<div id='tab2'>
								
											<font style="color:silver;" size="5" >Graphe presente le pourcentage de chaque categorie de chambre durant toute l'annee</font>
								<br>
								<br>
											<p><img src="graphe_CAT_DEMAND_annee"></img></p>
								
										</div>

										<div id='tab3'>
								
											<font style="color:silver;" size="5" >Graphe presente le niveau de la productivite de l'hotel durant toutes les annees</font>
								<br>
								<br>
											
												<img src="Graphe_productivite_all_years"  ></img>
										</div>
									
			</div>
			
			<% } else { %>
		
			<div class="indent" align="center">
				<h2>Partie Administrateur</h2>
				<form action="Afficher" name="formulaire" onsubmit="return verif()" method="post">
					<table>
						<tr>
						<td>Hotel : </td>
						<td>
						
						<select name="hotel">
						<%
						DAOhotel dao =new DAOhotel();
						
						ResultSet rs = dao.listhotel();
						
						while(rs.next()){
						
						%>
							  <option value="<%=rs.getString(1) %>" ><%= rs.getString(4)+":"+rs.getString(2) %></option>
						<%} %>
						</select>

						</td>
						</tr>
						 </br>
						 </br>
						 </br>
						 <tr><br></tr>
						<tr></tr><tr></tr>
						<tr>
							<td colspan="2" align="center"><input type="submit" value="Afficher" size="100"></td>

						</tr>
					</table>
				</form>

			</div>
			<%} %>
		</div>
		<!-- footer -->
		<jsp:include page="Footer.jsp"></jsp:include>
	</div>
</body>
</html>
