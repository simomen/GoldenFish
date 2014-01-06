package graphe;

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
import org.jfree.chart.plot.PiePlot3D;
import org.jfree.data.general.DefaultPieDataset;
import org.jfree.util.Rotation;


import classes.InfoReservationDAO;

/**
 * Servlet implementation class graphe_CAT_DEMAND_annee
 */
@WebServlet("/graphe_CAT_DEMAND_annee")
public class graphe_CAT_DEMAND_annee extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public graphe_CAT_DEMAND_annee() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
			
			ResultSet rs1 = InfoReservationDAO.getInstance().graphe_CAT_DEMAND_année();
			
			DefaultPieDataset dataset = new DefaultPieDataset();
			//String[] listmois={"Moin de 15J","ENTRE 15 et 30","Plus d'un MOIS"};
			
			
				 try {
					 double somme = 0;
					 while(rs1.next()){
						 somme = somme + (double) rs1.getInt(2);
						
					 }
					 ResultSet rs = InfoReservationDAO.getInstance().graphe_CAT_DEMAND_année();
					while(rs.next()){
						 dataset.setValue(rs.getString(1) +"::"+Math.round((rs.getInt(2) * 100/somme))+"%", (double) rs.getInt(2));
						 //System.out.println(rs.getString(1)+"__"+ (double) rs.getInt(2));
					 }
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
			 	 
			 JFreeChart chart = ChartFactory.createPieChart3D(
			            "Les Categories ",  // chart title
			            dataset,                // data
			            true,                   // include legend
			            true,
			            false
			        );
			    
			    PiePlot3D plot = (PiePlot3D) chart.getPlot();
		        plot.setStartAngle(290);
		        plot.setDirection(Rotation.CLOCKWISE);
		        plot.setForegroundAlpha(0.5f);
		        plot.setNoDataMessage("No data to display");
		        
			
		
		     OutputStream out = response.getOutputStream(); 
		     response.setContentType("image/png"); 
			ChartUtilities.writeChartAsPNG(out, chart, 500, 400);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
