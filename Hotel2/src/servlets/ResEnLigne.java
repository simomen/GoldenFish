package servlets;

import java.io.IOException;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import classes.Client;
import classes.ClientDAO;
import classes.ConnectionFactory;
import classes.InfoReservation;
import classes.Reservation;
import classes.ReservationDAO;

/**
 * Servlet implementation class ResEnLigne
 */
@WebServlet("/ResEnLigne")
public class ResEnLigne extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ResEnLigne() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		int code=0;
		String nom = request.getParameter("nom");
		String prenom = request.getParameter("prenom");
		String adresse = request.getParameter("adresse");
		String tel = request.getParameter("tel");
		String mail = request.getParameter("email");
		String pass = request.getParameter("code");
		ClientDAO.getInstance().ajouter(
				new Client(0, nom, prenom, adresse, tel, mail, pass));

		int index = (Integer) request.getSession().getAttribute("index");
		Vector<InfoReservation> data = (Vector<InfoReservation>) request
				.getSession().getAttribute("chambre");
		
		Statement s;
		try {
			s = ConnectionFactory.getConnection().createStatement();
			ResultSet rss=s.executeQuery("select max(code) from client");
			
			rss.next();
			code=rss.getInt(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		InfoReservation rs = data.elementAt(index);
		double avance=rs.getPrixtotal()/2;
		int nbrjour=ReservationDAO.nbjour(rs.getDb(), rs.getDf());
		ReservationDAO.getInstance().ajouter(new Reservation(0, "res en ligne", rs.getChambre(), rs.getDb(), rs.getDf(), nbrjour, avance,code));
        ReservationDAO.facturer(code, rs.getDb());
        response.sendRedirect("Reservation.jsp");
	}

}
