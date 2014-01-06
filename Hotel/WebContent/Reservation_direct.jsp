<%@page import="classes.InfoReservation"%>
<%@page import="java.util.Vector"%>
<%@page import="classes.InfoReservationDAO"%>
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
<script type="text/javascript">
	function verif() {
		if (document.formulaire.db.value == ""
				|| document.formulaire.df.value == "") {
			alert("Veuillez verifier les dates !");
			document.formulaire.db.focus();
			return false;
		}

	}
</script>
<style type="text/css">
<!--
@import url("css/tablestyle.css");
-->
</style>
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
			<div class="indent" align="center">
				<h2>Rechercher des hôtels : Maroc</h2>
				<form action="Reservation_direct.jsp" name="formulaire" 
					method="get" onsubmit="return verif()">
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
							</select>
							</td>
						</tr>
						<tr>
							<td>Adultes &nbsp;&nbsp;</td>
							<td>&nbsp;&nbsp;<select name="nbad">
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
							</select></td>
						</tr>
						<tr>
							<td>Enfants &nbsp;&nbsp;</td>
							<td>&nbsp;&nbsp;<select name="nben">
									<option value="0">0</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
							</select></td>
						</tr>
						<tr>
							<td><input type="submit" value="Rechercher" size="100">
							</td>

						</tr>
					</table>
				</form>
				<%if(request.getParameter("db")!=null){
					
					String hotel = request.getParameter("cd");
					String db = request.getParameter("db");
					String df = request.getParameter("df");
					int nbch = Integer.parseInt(request.getParameter("nbch"));
					int nbad = Integer.parseInt(request.getParameter("nbad"));
					int nben = Integer.parseInt(request.getParameter("nben"));
					int nblit = nbad + nben;
					 
					db = db.substring(6, 10) + "-" + db.substring(3, 5) + "-"
							+ db.substring(0, 2);
					df = df.substring(6, 10) + "-" + df.substring(3, 5) + "-"
							+ df.substring(0, 2);
				    Vector<InfoReservation> data =new Vector<InfoReservation>();
					data =InfoReservationDAO.getInstance().listInfoReservation(hotel, nblit, db, df, nbch, nben, nbad);
					
					
					
					%>
					Les critéres de recherche :<br>
					Date debut :  <%=db %><br>
					Date Fin :  <%=df %><br>
					Hotel :  <%=hotel %><br>
					<hr>
					
					<table id="box-table-a" summary="Employee Pay Sheet">
						<thead>
								<th colspan="7" align="center">Liste des chambres libre</th>
							</thead>
							<thead>
								<th colspan="7" align="center">Hotel</th>
								<th colspan="7" align="center">NBR chambre</th>
								<th colspan="7" align="center">Etage</th>
								<th colspan="7" align="center">Prix bas</th>
								<th colspan="7" align="center">Image</th>
								<th colspan="7" align="center">Reserver</th>
								
							</thead>
							<%for(InfoReservation item:data){ %>
						<tr>
							<td style="color: black;"><%=item.getHotel() %> </td>
							<td style="color: black;"><%=item.getChambre() %> </td>
							<td style="color: black;"><%=item.getEtage() %>  </td>
							<td style="color: black;"><%=item.getPrixbase() %>  </td>
							<td style="color: black;"><img src="<%=item.getImage() %>"></td>
							<td style="color: black;"><input type="submit" value="Reserver"></td>
						</tr>
						<%} %>
				</table>
				
				
				
				
				<%} %>
			</div>
		</div>
		<!-- footer -->
		<jsp:include page="Footer.jsp"></jsp:include>
	</div>
</body>
</html>