package servlets;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import classes.ConnectionFactory;
import classes.InfoReservation;
import classes.InfoReservationDAO;

/**
 * Servlet implementation class Reservation
 */
@WebServlet("/Reservation")
public class Reservation extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Reservation() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String hotel = request.getParameter("cd");
		String db = request.getParameter("db");
		String df = request.getParameter("df");
		int nbch = Integer.parseInt(request.getParameter("nbch"));
		Statement s;
		db = db.substring(6, 10) + "-" + db.substring(3, 5) + "-"
				+ db.substring(0, 2);
		df = df.substring(6, 10) + "-" + df.substring(3, 5) + "-"
				+ df.substring(0, 2);
		Vector<InfoReservation> data = new Vector<InfoReservation>();
		data = InfoReservationDAO.getInstance().listInfoReservation(hotel,
				 db, df, nbch);
		HttpSession chambre = request.getSession();
		chambre.setAttribute("chambre", data);
		response.sendRedirect("chambre.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

	}

}
