<%@page import="classes.ConnectionFactory"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<title>Reservation</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta charset="utf-8" />
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
<script type="text/javascript">
	function verif() {
		if (document.formulaire.db.value == ""
				|| document.formulaire.df.value == "") {
			alert("Veuillez verifier les dates !");
			document.formulaire.db.focus();
			return false;
		}
		function getDate(strDate) {
			day = strDate.substring(0, 2);
			month = strDate.substring(3, 5);
			year = strDate.substring(6, 10);
			d = new Date();
			d.setDate(day);
			d.setMonth(month);
			d.setFullYear(year);
			return d;
		}

		//Retorune:
		//   0 si date_1=date_2
		//   1 si date_1>date_2
		//  -1 si date_1<date_2	  
		function compare(date_1, date_2) {
			diff = date_1.getTime() - date_2.getTime();
			return (diff == 0 ? diff : diff / Math.abs(diff));
		}
		if (compare(getDate(document.formulaire.db.value),
				getDate(document.formulaire.df.value)) == 1
				|| compare(getDate(document.formulaire.db.value),
						getDate(document.formulaire.df.value)) == 0) {
			document.formulaire.df.focus();
			alert("La date de fin doit être ultérieure à la date de debut Veuillez modifier vos dates et réessayer.");
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
			<div class="indent3" align="center">
				<h2>Recherche d'hôtels : France</h2>
				<form action="hotel.jsp" name="formulaire" method="get"
					onsubmit="return verif()">
					<table>
						<tr>
							<td>Destination / Ville &nbsp;&nbsp;</td>
							<td>&nbsp;&nbsp;<select name="ville">
									<%
										Statement s = ConnectionFactory.getConnection().createStatement();
										ResultSet rs = s.executeQuery("select DISTINCT ville from hotel ");
										while (rs.next()) {
									%>
									<option value="<%=rs.getString(1)%>"><%=rs.getString(1)%></option>
									<%
										}
									%>
							</select>
							</td>
						</tr>
						<tr>
							<td>Date Debut &nbsp;&nbsp;</td>
							<td>&nbsp;&nbsp;<input type="text"
								class="w8em format-d-m-y highlight-days-67 range-low-today"
								name="db" id="sd" value="" maxlength="10" /></td>
						</tr>
						<tr>
							<td>Date Fin &nbsp;&nbsp;</td>
							<td>&nbsp;&nbsp;<input type="text"
								class="w8em format-d-m-y highlight-days-67 range-low-today"
								name="df" id="ed" value="" maxlength="10" /></td>
						</tr>
						<tr>
							<td>Chambres &nbsp;&nbsp;</td>
							<td>&nbsp;&nbsp;<select name="nbch">
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
							</select>
							</td>
						</tr>

						<tr>
							<td><input type="submit" value="Rechercher" size="100">
							</td>

						</tr>
					</table>
				</form>

			</div>
		</div>
		<!-- footer -->
		<jsp:include page="Footer.jsp"></jsp:include>
	</div>
</body>
</html>