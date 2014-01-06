package servlets;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import classes.InfoReservation;
import classes.InfoReservationDAO;
import classes.ReservationDAO;

/**
 * Servlet implementation class AnnuleReservation
 */
@WebServlet("/AnnuleReservation")
public class AnnuleReservation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnnuleReservation() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int index =Integer.parseInt(request.getParameter("index"));
		String mail = (String) request.getSession().getAttribute("login");
		String pass = (String) request.getSession().getAttribute("pass");
		Vector<InfoReservation> data = InfoReservationDAO.getInstance()
				.listInfo(mail, pass);
		InfoReservation rs=data.get(index);
		ReservationDAO.getInstance().Supprimer(rs.getChambre(), rs.getDb(), rs.getDf());
		response.sendRedirect("ClientReservation.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
