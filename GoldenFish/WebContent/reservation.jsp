<%@page import="classes.Chambre"%>
<%@page import="classes.ConnectionFactory"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%!Chambre ch = new Chambre();%>
<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="css/jquery-ui.css">
<script src="js/jquery-1.9.1.js"></script>
<script src="js/jquery-ui.js"></script>
<script>
	$(function() {
		$("#datepicker").datepicker();
		$("#datepicker2").datepicker();
	});
</script>
<!-- content -->
<div id="content">
	<div class="container">
		<div class="aside maxheight">
			<!-- box begin -->
			<div class="box maxheight">
				<div class="inner">
					<h3>Reservation:</h3>
					<form action="ReservationServlet" id="reservation-form"
						method="post" name="verifDispo">
						<fieldset>
							<div class="field">
								<label>Date début réservation :</label> <input type="text"
									class="dateDeb" id="datepicker" name="dateDeb">
							</div>
							<div class="field">
								<label>Date fin réservation :</label> <input type="text"
									class="dateFin" id="datepicker2" name="dateFin">
							</div>
							<div class="field">
								Nb personne: &nbsp;<input type="text" value="1" />&nbsp; &nbsp;
								&nbsp; &nbsp;</br> Nb chambre :&nbsp; <input type="text" value="1"
									name="nbChambre" />
							</div>
							<div class="field">
								Type Chambre <select class="typeChambre" name="typeChambre">
									<%
										Statement s = ConnectionFactory.getConnection().createStatement();
										ResultSet rs = s
												.executeQuery("SELECT idcat, typech FROM categoriechambre");
										while (rs.next()) {
									%>
									<option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>
									<%
										}
									%>
								</select>

								<div class="divhotel">
									Ville <select class="hotel" name="ville">
										<%
											rs = s.executeQuery("SELECT DISTINCT ville FROM hotel");
											while (rs.next()) {
										%>
										<option value="<%=rs.getString(1)%>"><%=rs.getString(1)%></option>
										<%
											}
										%>
									</select>
								</div>
							</div>

							<div class="button">
								<input type="submit" id="submit" value="verif" name="action"
									hidden="true"><a id="verif" href="#"
									onclick="document.getElementById('submit').click();">Vérifier
									disponibilité</a></span></span>

							</div>
						</fieldset>
					</form>
				</div>
			</div>
			<!-- box end -->
		</div>
		<div class="content">
			<div class="indent">
				<h2>Résultats de la recherche :</h2>
				<%
					if (request.getSession().getAttribute("dispo") == "ok") {
						System.out.println("silmo");
				%>
				<form action="">
					<fieldset>
						<ul>
							<li><img alt="" src="<%%>" /></li>
						</ul>

					</fieldset>
				</form>
				<h1>chambre disponible</h1>
				<%
					}
				%>

				<div class="indent"></div>
			</div>


		</div>
		<div class="clear"></div>
	</div>
</div>
<!-- footer -->
<jsp:include page="footer.jsp"></jsp:include>