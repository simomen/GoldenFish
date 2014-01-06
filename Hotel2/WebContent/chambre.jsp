<%@page import="classes.InfoReservation"%>
<%@page import="java.util.Vector"%>
<%@page import="classes.ConnectionFactory"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<title>Hotel</title>
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
<script type="text/javascript" src="./js/datepicker.js"></script>

<link href="./css/datepicker.css" rel="stylesheet" type="text/css" />

</head>
<body id="page5" onload="new ElementMaxHeight();">
	<div id="main">
		<!-- header -->
		<jsp:include page="Header.jsp"></jsp:include>
		<!-- content -->
		<div id="content">
			<div class="gallery">
				<ul>
					<li><img alt="" src="images/3page-img10.jpg" /></li>
					<li><img alt="" src="images/3page-img12.jpg" /></li>
					<li><img alt="" src="images/3page-img13.jpg" /></li>
					<li><img alt="" src="images/3page-img14.jpg" /></li>
					<li><img alt="" src="images/3page-img15.jpg" /></li>
					<li><img alt="" src="images/3page-img16.jpg" /></li>
				</ul>
			</div>

			<br>
			<%
				if (request.getSession().getAttribute("resep") != null) {
			%>


			<a href="Deconnect">Deconnect</a>
			<%
				}
			%>
			<br>

			<div class="indent3" align="left">
				<h2>Liste de chambre selon votre choix</h2>
				<%
					int i = 0;
					Vector<InfoReservation> data = (Vector<InfoReservation>) request
							.getSession().getAttribute("chambre");
					if (data.size() != 0) {
						for (InfoReservation rs : data) {
				%>
				<form action="TypReservation" name="formulaire" method="post">
					<table>
						<tr>
							<td height="2" width="2"><img alt=""
								src="<%=rs.getImage()%>" /></td>
							<hr>
							<td valign="top">Déscription : &nbsp;<%=rs.getDescripcham()%><br>
								Hotel : &nbsp; <%=rs.getHotel()%> <br>Type chambre :
								&nbsp;&nbsp;<%=rs.getTypechamb()%><br>Etage :&nbsp;&nbsp;<%=rs.getEtage()%><br>
								Durée de réservation : Du <%=rs.getDb()%> &nbsp;&nbsp;au
								&nbsp;&nbsp;<%=rs.getDf()%><br>Nombre de
								chambre :&nbsp;&nbsp;<%=rs.getNbch()%>&nbsp;&nbsp;avec
								&nbsp;&nbsp;<%=rs.getNblit()%>&nbsp;&nbsp;de Lit <br> Prix
								par chambre :&nbsp;&nbsp;<%=rs.getPrixbase()%><br>Prix
								total :&nbsp;&nbsp;<font color="red"> <%=rs.getPrixtotal()%>EUR
							</font>

							</td>
							<hr>
							<td><input type="hidden" name="index" value="<%=i%>">
								<input type="submit" value="Reserve"></td>
						</tr>
						<hr>
					</table>
				</form>
				<%
					i++;
						}
					} else {
						out.println("Trouvez plus d'hôtels en élargissant vos critères de recherche");
						out.println("<a href='Reservation.jsp'>elarge votre critère de recherche</a>");
					}
				%>
			</div>
		</div>
		<!-- footer -->
		<jsp:include page="Footer.jsp"></jsp:include>
	</div>
</body>
</html>