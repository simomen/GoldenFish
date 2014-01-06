package graphe;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.DefaultCategoryDataset;


import classes.InfoReservationDAO;

/**
 * Servlet implementation class graphe_NB_reserv_mois
 */
@WebServlet("/graphe_NB_reserv_mois")
public class graphe_NB_reserv_mois extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public graphe_NB_reserv_mois() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ResultSet rs = InfoReservationDAO.getInstance().graphe_NB_reserv_mois();
		 DefaultCategoryDataset dataset = new DefaultCategoryDataset();
		 String[] listmois={"Janvier","Fevrier","Mars","Avril","Mai","Juin","Juillet","août","septembre","octobre","novembre","Decembre"};
		 try {
			while(rs.next()){
	 
					dataset.addValue((double) rs.getInt(1) , listmois[rs.getInt(2)-1].toString(), String.valueOf(rs.getInt(2))  );
 	
			 }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		 JFreeChart barChart = ChartFactory
				 .createBarChart("Graphe Presente le Nombre des chambre réserver par mois de l'année courant", "", 
			     "NB Clients", dataset, PlotOrientation.VERTICAL, true, true, false); 
		 OutputStream out = response.getOutputStream(); 
		 response.setContentType("image/png"); 
		 ChartUtilities.writeChartAsPNG(out, barChart, 600, 450); 
		
		// ChartUtilities.saveChartAsJPEG(new File("D:/image/Graphe_1.jpg"),barChart,500,400);

		 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
