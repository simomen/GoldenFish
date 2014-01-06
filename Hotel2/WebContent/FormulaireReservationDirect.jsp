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

<script type="text/javascript">
	function verif() {
		if (document.form.nom.value == ""
				|| document.form.prenom.value == ""
				
					|| document.form.email.value == ""
						|| document.form.emailto.value == ""
							|| document.form.prenom.value == ""
								|| document.form.code.value == ""
									|| document.form.adresse.value == ""
										|| document.form.ville.value == ""
											|| document.form.codepostal.value == ""
												|| document.form.tel.value == "" || document.form.email.value != document.form.emailto.value ) {
			alert("Veuillez verifier les champs !");
			document.form.nom.focus();
			return false;
		}
		adresse = document.form.email.value;
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
					<li><img alt="" src="images/3page-img10.jpg" /></li>
					<li><img alt="" src="images/3page-img12.jpg" /></li>
					<li><img alt="" src="images/3page-img13.jpg" /></li>
					<li><img alt="" src="images/3page-img14.jpg" /></li>
					<li><img alt="" src="images/3page-img15.jpg" /></li>
					<li><img alt="" src="images/3page-img16.jpg" /></li>
				</ul>
			</div>
			<div class="indent3" align="Center">
				<h2>Votre Sejour</h2>
				<%
					int index = (Integer)request.getSession().getAttribute("index");
					Vector<InfoReservation> data = (Vector<InfoReservation>) request
							.getSession().getAttribute("chambre");

					InfoReservation rs = data.elementAt(index);
				%>
				<fieldset title="Information Sejour">
					<legend style="color: red;">Information Sejour</legend>
					<form action="" name="formulaire" method="post">
						<table>
							<tr>

								<td height="2" width="2"><img alt=""
									src="<%=rs.getImage()%>" />
								</td>

								<td valign="top">Informations :<br> hotel&nbsp;&nbsp;
									<%=rs.getHotel()%> &nbsp;&nbsp;chambre &nbsp;&nbsp;<%=rs.getChambre()%><br>
									a l'etage :&nbsp;&nbsp;<%=rs.getEtage()%><br>
									Caracteristique :<br> Libre entre le <%=rs.getDb()%>
									&nbsp;&nbsp;et &nbsp;&nbsp;<%=rs.getDf()%><br> prix de
									base :&nbsp;&nbsp;<%=rs.getPrixbase()%> &nbsp;&nbsp;nombre de
									chambre Chosi est :&nbsp;&nbsp;<%=rs.getNbch()%>&nbsp;&nbsp;avec
									&nbsp;&nbsp;<%=rs.getNblit()%>&nbsp;&nbsp;de Lit <br> Avec
									un prix exclusive :&nbsp;&nbsp;<font color="red"> <%=rs.getPrixtotal()%>DH</font>

								</td>

							</tr>

						</table>
					</form>
				</fieldset>
				<br> <br>

				<form action="ResEnLigne"
					method="post" name="form" onsubmit="return verif()">
					<fieldset>
						<legend style="color: red;">Vos Informations</legend>
						<table>
							<tr>
								<td>Nom :</td>
								<td><input type="hidden" nom="index" value="<%=index%>" />
									<input type="text" name="nom" /></td>
							</tr>
							<tr>
								<td>Prenom :</td>
								<td><input type="text" name="prenom" /></td>
							</tr>
							<tr>
								<td>Adresse e-mail :</td>
								<td><input type="text" name="email" /></td>
							</tr>
							<tr>
								<td>Confirmer l'adresse e-mail :</td>
								<td><input type="text" name="emailto" /></td>
							</tr>
							<tr>
								<td>Choisi un Code :</td>
								<td><input type="text" name="code" /></td>
							</tr>
							<tr>
								<td>Adresse :</td>
								<td><input type="text" name="adresse" /></td>
							</tr>
							<tr>
								<td>Paye :</td>
								<td><select>
										<option>Maroc</option>
										<option>France</option>
										<option>Italie</option>
										<option>Canada</option>
										<option>USA</option>
										<option>tunisie</option>
										<option>egypte</option>

								</select></td>
							</tr>
							<tr>
								<td>Ville :</td>
								<td><input type="text" name="ville" /></td>
							</tr>
							<tr>
								<td>CodePostal :</td>
								<td><input type="text" name="codepostal" /></td>
							</tr>
							<tr>
								<td>Telephone :</td>
								<td><input type="text" name="tel" /> pour que l'hôtel
									puisse vous joindre</td>
							</tr>
							<tr>
								
								<td colspan="2" align="center"><input type="submit" name="Reserver" /> </td>
							</tr>
						</table>
						<br> 
					</fieldset>
				</form>



			</div>
		</div>
		<!-- footer -->
		<jsp:include page="Footer.jsp"></jsp:include>
	</div>
</body>
</html>