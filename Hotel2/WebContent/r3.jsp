<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<title>Restaurant</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta name="description"
	content="Check out the restaurant page of the Free Hotel Website Template from Template Monster." />
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
<body id="page4" onload="new ElementMaxHeight();">
	<div id="main">
		<jsp:include page="Header.jsp"></jsp:include>
		<!-- content -->
		<div id="content">
			<div class="gallery">
				<ul>
					<li><img alt="" src="images/2page-img1.jpg" />
					</li>
					<li><img alt="" src="images/2page-img2.jpg" />
					</li>
					<li><img alt="" src="images/2page-img3.jpg" />
					</li>
					<li><img alt="" src="images/2page-img4.jpg" />
					</li>
					<li><img alt="" src="images/2page-img5.jpg" />
					</li>
					<li><img alt="" src="images/2page-img6.jpg" />
					</li>
				</ul>
			</div>
			<div class="container">
				<div class="aside maxheight">
					<!-- box begin -->
					<div class="box maxheight">
						<div class="inner">
							<h3>Menu</h3>
							<ul class="list3">
								<li><a href="restaurant.jsp">Promotions</a>
								</li>
								<li><a href="r2.jsp">Dejeuner</a>
								</li>
								<li><a href="r3.jsp">Diner</a>
								</li>
								<li><a href="r4.jsp">Boisson</a>
								</li>


							</ul>
							<div class="button">
								<span><span></span>
								</span>
							</div>
						</div>
					</div>
					<!-- box end -->
				</div>
				<div class="content">
					<div class="indent3">
						<h2>Menu Du Jour</h2>
						<img class="img-indent png alt" alt="" src="images/r3.png" />
						<div class="extra-wrap">
							<h5>Suchi!</h5>
							<ul class="list2">
								<li>Nice and tasty!</li>
								<li>Made from china !</li>
								<li>Cooked by china chef!</li>
								<li>Awarded by Czech assosiation of chef!</li>
								<li>Proved to be good for your health!</li>
							</ul>
							<div class="aligncenter">
								<strong class="txt2">AS LOW AS $25!</strong>
							</div>
						</div>
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
		<!-- footer -->
		<jsp:include page="Footer.jsp"></jsp:include>
	</div>
</body>
</html>