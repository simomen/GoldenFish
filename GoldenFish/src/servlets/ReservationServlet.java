package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import classes.Chambre;
import classes.ReservationDAO;

/**
 * Servlet implementation class ReservationServlet
 */
@WebServlet("/ReservationServlet")
public class ReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ReservationServlet() {
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
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		String action = request.getParameter("action");
		String dateDeb = request.getParameter("dateDeb");
		String dateFin = request.getParameter("dateFin");
		String typeChambre = request.getParameter("typeChambre");
		String nbChambre = request.getParameter("nbChambre");
		String ville = request.getParameter("ville");
		System.out.println("dateDeb= " + dateDeb + " dateFin= " + dateFin
				+ " typeChambre= " + typeChambre + " ville= " + ville
				+ " nbChambre = " + nbChambre);

		System.out.println("action = " + action);
		if (action.equals("verif")) {
			ReservationDAO resDAO = ReservationDAO.getInstance();
			Chambre ch = resDAO.verifDispo(dateDeb, dateFin, typeChambre,
					Integer.parseInt(nbChambre), ville);
			System.out.println("chambre = " + ch);
			if (ch != null) {
				session.setAttribute("dispo", "ok");
			} else {
				session.setAttribute("dispo", "ko");
			}
		}
		response.sendRedirect("reservation.jsp");
	}

}
