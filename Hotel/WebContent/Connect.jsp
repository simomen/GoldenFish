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
		if (document.formulaire.login.value == ""
				|| document.formulaire.pass.value == ""

		) {
			alert("Veuillez verifier les champs !");
			document.formulaire.login.focus();
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
					<li><img alt="" src="images/3page-img10.jpg" />
					</li>
					<li><img alt="" src="images/3page-img12.jpg" />
					</li>
					<li><img alt="" src="images/3page-img13.jpg" />
					</li>
					<li><img alt="" src="images/3page-img14.jpg" />
					</li>
					<li><img alt="" src="images/3page-img15.jpg" />
					</li>
					<li><img alt="" src="images/3page-img16.jpg" />
					</li>
				</ul>
			</div>
			<div class="indent" align="center">
				
				<form action="Connect" name="formulaire" method="post" onsubmit="return verif()">
					<table id="box-table-a" summary="Employee Pay Sheet">
						<thead>
								<th colspan="7" align="center">Connect</th>
							</thead>
						<tr>
							<td style="color: black;">Login &nbsp;&nbsp;</td>
							<td style="color: black;">&nbsp;&nbsp;<input type="text" name="login" /></td>
						</tr>
						<tr>
							<td style="color: black;">Password &nbsp;&nbsp;</td>
							<td style="color: black;">&nbsp;&nbsp;<input type="password" name="pass" />
							</td>
						</tr>

						<tr>
							<td style="color: black;">Profile &nbsp;&nbsp;</td>
							<td style="color: black;">&nbsp;&nbsp;<select name="profile">
									<option value="Client">Client</option>
									<option value="Receptionniste">Receptionniste</option>
									<option value="Admin">Admin</option>

							</select></td>
						</tr>

						<tr>
							<td colspan="2" align="center"><input type="submit" value="SeConnect" size="1">
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