<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Galerie Photo</title>
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

<link rel="stylesheet" href="css/galleriffic-2.css" type="text/css" />
<script type="text/javascript" src="js/jquery-1.3.2.js"></script>
<script type="text/javascript" src="js/jquery.galleriffic.js"></script>
<script type="text/javascript" src="js/jquery.opacityrollover.js"></script>
<!-- We only want the thunbnails to display when javascript is disabled -->
<script type="text/javascript">
	document.write('<style>.noscript { display: none; }</style>');
</script>
</head>
<body id="page3" onload="new ElementMaxHeight();">
	<div id="main">
			<jsp:include page="Header.jsp"></jsp:include>
			<div id="content">
			<div class="gallery">
			<ul>
				<li><img alt="" src="images/h38.jpg" /></li>
				<li><img alt="" src="images/h31.jpg" /></li>
				<li><img alt="" src="images/h32.jpg" /></li>
				<li><img alt="" src="images/h35.jpg" /></li>
				<li><img alt="" src="images/h36.jpg" /></li>
				<li><img alt="" src="images/h37.jpg" /></li>
			</ul>
		</div>
			<div class="container">
				<div class="aside maxheight">


					<div id="page">
						<div id="container">

							<!-- Start Advanced Gallery Html Containers -->
							<div id="gallery" class="content">
								<div id="controls" class="controls"></div>
								<div class="slideshow-container">
									<div id="loading" class="loader"></div>
									<div id="slideshow" class="slideshow"></div>
								</div>
								<div id="caption" class="caption-container"></div>
							</div>
							<div id="thumbs" class="navigation">
								<ul class="thumbs noscript">

									<li><a class="thumb" href="imagess/h28.jpg"
										title="Title #4"> <img src="imagess/h28.jpg"
											alt="Title #4" /> </a>
										<div class="caption">
											<div class="download"></div>
											<div class="image-title">Suite 80 m²</div>
											<div class="image-desc">2 Lits doubles avec mini bar</div>
										</div>
									</li>

									<li><a class="thumb" href="imagess/h10.jpg"
										title="Title #5"> <img src="imagess/chpt1.jpg"
											alt="Title #5" /> </a>
										<div class="caption">
											<div class="download"></div>
											<div class="image-title">Chambre double 45 m²</div>
											<div class="image-desc">1 Lit double avec vu sur la Tout Eiffel</div>
										</div>
									</li>

									<li><a class="thumb" href="imagess/h01.jpg"
										title="Title #6"> <img src="imagess/h01.jpg"
											alt="Title #6" /> </a>
										<div class="caption">
											<div class="download"></div>
											<div class="image-title">Chambre double 20 m²</div>
											<div class="image-desc">2 Lits simples, TV, Salle de bain</div>
										</div>
									</li>

									<li><a class="thumb" href="imagess/h12.jpg"
										title="Title #7"> <img src="imagess/h12.jpg"
											alt="Title #7" /> </a>
										<div class="caption">
											<div class="download"></div>
											<div class="image-title">Chambre double 36 m²</div>
											<div class="image-desc">2 Lits simples</div>
										</div>
									</li>

									<li><a class="thumb" href="imagess/h13.png"
										title="Title #8"> <img src="imagess/h13.png"
											alt="Title #8" /> </a>
										<div class="caption">
											<div class="download"></div>
											<div class="image-title">Suite Parentale 45 m²</div>
											<div class="image-desc">Lit double</div>
										</div>
									</li>

									<li><a class="thumb" href="imagess/h14.jpg"
										title="Title #9"> <img src="imagess/h14.jpg"
											alt="Title #9" /> </a>
										<div class="caption">
											<div class="download"></div>
											<div class="image-title">Chambre simple 35 m²</div>
											<div class="image-desc">Lit double, mini bar</div>
										</div>
									</li>

									<li><a class="thumb" href="imagess/h15.jpg"
										title="Title #10"> <img src="imagess/h15.jpg"
											alt="Title #10" /> </a>
										<div class="caption">
											<div class="download"></div>
											<div class="image-title">Suite Royale 69 m²</div>
											<div class="image-desc">Lit double mini bar et entrée centre de bien être</div>
										</div>
									</li>

									<li><a class="thumb" href="imagess/h16.jpg"
										title="Title #11"> <img src="imagess/h16.jpg"
											alt="Title #11" /> </a>
										<div class="caption">
											<div class="download"></div>
											<div class="image-title">Spa et centre de remise en forme</div>
											<div class="image-desc">Programme tout au long de la semaine afin d'augmenter considérablement le bien-être et détendre le corps</div>
										</div>
									</li>

									<li><a class="thumb" href="imagess/h17.jpg"
										title="Title #12"> <img src="imagess/h17.jpg"
											alt="Title #12" /> </a>
										<div class="caption">
											<div class="download"></div>
											<div class="image-title">Chambre triple 25 m²</div>
											<div class="image-desc">3 Lits simples TV</div>
										</div>
									</li>

									<li><a class="thumb" href="imagess/h18.jpg"
										title="Title #13"> <img src="imagess/h18.jpg"
											alt="Title #13" /> </a>
										<div class="caption">
											<div class="download"></div>
											<div class="image-title">Bar /Lounges</div>
											<div class="image-desc">Offre plusieurs boissons</div>
										</div>
									</li>




								</ul>
							</div>
							<div style="clear: both;"></div>
						</div>
					</div>


				</div>

				<div class="clear"></div>
			</div>
			
		</div>
		<!-- footer -->
		<jsp:include page="Footer.jsp"></jsp:include>
	</div>
	<script type="text/javascript">
		jQuery(document).ready(
				function($) {
					// We only want these styles applied when javascript is enabled
					$('div.navigation').css({
						'width' : '300px',
						'float' : 'left'
					});
					$('div.content').css('display', 'block');

					// Initially set opacity on thumbs and add
					// additional styling for hover effect on thumbs
					var onMouseOutOpacity = 0.67;
					$('#thumbs ul.thumbs li').opacityrollover({
						mouseOutOpacity : onMouseOutOpacity,
						mouseOverOpacity : 1.0,
						fadeSpeed : 'fast',
						exemptionSelector : '.selected'
					});

					// Initialize Advanced Galleriffic Gallery
					var gallery = $('#thumbs').galleriffic(
							{
								delay : 2500,
								numThumbs : 15,
								preloadAhead : 10,
								enableTopPager : true,
								enableBottomPager : true,
								maxPagesToShow : 7,
								imageContainerSel : '#slideshow',
								controlsContainerSel : '#controls',
								captionContainerSel : '#caption',
								loadingContainerSel : '#loading',
								renderSSControls : true,
								renderNavControls : true,
								playLinkText : 'Play Slideshow',
								pauseLinkText : 'Pause Slideshow',
								prevLinkText : '&lsaquo; Previous Photo',
								nextLinkText : 'Next Photo &rsaquo;',
								nextPageLinkText : 'Next &rsaquo;',
								prevPageLinkText : '&lsaquo; Prev',
								enableHistory : false,
								autoStart : false,
								syncTransitions : true,
								defaultTransitionDuration : 900,
								onSlideChange : function(prevIndex, nextIndex) {
									// 'this' refers to the gallery, which is an extension of $('#thumbs')
									this.find('ul.thumbs').children().eq(
											prevIndex).fadeTo('fast',
											onMouseOutOpacity).end().eq(
											nextIndex).fadeTo('fast', 1.0);
								},
								onPageTransitionOut : function(callback) {
									this.fadeTo('fast', 0.0, callback);
								},
								onPageTransitionIn : function() {
									this.fadeTo('fast', 1.0);
								}
							});
				});
	</script>
</body>
</html>