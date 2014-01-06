
<%@page import="classes.InfoReservationDAO"%>
<%@page import="classes.ReservationDAO"%>
<%@page import="classes.InfoReservation"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<title>ClientResevation</title>
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
			<div class="indent" align="left">
				<a href="Deconnect"> Deconnect</a>
				<%
					String user = (String) request.getSession().getAttribute("user");
				%>
				<h2>Bonjour</h2>
				<font style="size: 12px; color: orange;"> <%=user%></font><br>
				<font style="size: 12px; color: red;">NB : Un remboursement
					par cette chaine est possible a condition que l annulation de la
					reservation soit faite au moins une semaine avant la date prevue de
					sejour</font>
				<%%>

				<br>
				<%
					
					String mail = (String) request.getSession().getAttribute("login");
					String pass = (String) request.getSession().getAttribute("pass");
					Vector<InfoReservation> data = InfoReservationDAO.getInstance()
							.listInfo(mail, pass);
					if(data.size()!=0){
					int i=0;
					for (InfoReservation rs : data){
				%>
				
				
			
				<fieldset title="Information Sejour">
					<legend style="color: red;">Information Sejour</legend>
					<form>
						<table>
							<tr>

								<td height="2" width="2">    <img alt=""
									src="<%=rs.getImage()%>" /></td>

								<td valign="top">Informations :<br> hotel&nbsp;&nbsp;
									<%=rs.getHotel()%> &nbsp;&nbsp;chambre &nbsp;&nbsp;<%=rs.getChambre()%><br>
									a l'etage :&nbsp;&nbsp;<%=rs.getEtage()%><br>
									Caracteristique :<br> Libre entre le <%=rs.getDb()%>
									&nbsp;&nbsp;et &nbsp;&nbsp;<%=rs.getDf()%><br> prix de
									base :&nbsp;&nbsp;<%=rs.getPrixbase()%> &nbsp;&nbsp; <br> Avec
									un prix exclusive :&nbsp;&nbsp;<font color="red"> <%=rs.getPrixtotal()%>DH</font>

								</td>

							</tr>
							<tr>
							<td> <a href="AnnuleReservation?index=<%=i %>">AnnuleReservation</a> </td>
							</tr>

						</table>
					</form>
				</fieldset>
				
				<% i++;}
					}else{
						
					
					%>
					<font style="size: 12px; color: red;">Vous n'avez pas de reservation </font>
					<%
					} %>
			</div>
		</div>
		<!-- footer -->
		<jsp:include page="Footer.jsp"></jsp:include>
	</div>
</body>
</html>