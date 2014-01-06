package classes;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

public class InfoReservationDAO {

	private static InfoReservationDAO instance = null;

	private InfoReservationDAO() {

	}

	public static InfoReservationDAO getInstance() {
		if (instance == null) {
			instance = new InfoReservationDAO();
		}
		return instance;
	}

	public Vector<InfoReservation> listInfoReservation(String hotel, int nblit,
			String db, String df, int nbch, int nben, int nbad) {
		Statement s = null;
		ResultSet rs = null;
		Vector<InfoReservation> data = new Vector<InfoReservation>();

		try {
			s = ConnectionFactory.getConnection().createStatement();
			rs = s.executeQuery("select hotel.codehotel,chambre.idch,etage,prixbase,chambre.image from hotel,chambre,categoriechambre where  hotel.codehotel='"
					+ hotel
					+ "' and chambre.idcat=categoriechambre.idcat and hotel.codehotel=chambre.codehotel  and nblit ="
					+ nblit
					+ " and chambre.idch not in(select idch from reservation where'"+db +"'between datedebut and datefin  or '"+df+"' between datedebut and datefin or '"+db+"' <datedebut and '"+df+"' > datefin)");

			while (rs.next()) {
				InfoReservation bc = new InfoReservation();
				bc.setNben(nben);
				bc.setNbch(nbch);
				bc.setNbad(nbad);
				bc.setDb(db);
				bc.setDf(df);
				bc.setHotel(rs.getString(1));
				bc.setChambre(rs.getString(2));
				bc.setEtage(rs.getInt(3));
				bc.setImage(rs.getString(5));
				bc.setPrixbase(rs.getDouble(4));
				bc.setPrixtotal(bc.getPrixbase() * nbch);
				bc.setNblit(nblit);
				data.add(bc);
			}

		} catch (SQLException ex) {
			ex.printStackTrace();
		}

		return data;

	}

	public Vector<InfoReservation> listInfo(String mail, String pass) {
		Statement s = null;
		ResultSet rs = null;
		Vector<InfoReservation> data = new Vector<InfoReservation>();

		try {
			s = ConnectionFactory.getConnection().createStatement();
			rs = s.executeQuery("select hotel.codehotel,chambre.idch,etage,prixbase,chambre.image,datedebut,datefin,avance from hotel,chambre,categoriechambre,reservation,client where  mail='"
					+ mail
					+ "'and pass ='"
					+ pass
					+ "' and chambre.idcat=categoriechambre.idcat and hotel.codehotel=chambre.codehotel  and client.code=reservation.code and reservation.idch=chambre.idch "
					+ " and datedebut > CURDATE() ");

			while (rs.next()) {
				InfoReservation bc = new InfoReservation();
				bc.setDb(rs.getString(6));
				bc.setDf(rs.getString(7));
				bc.setHotel(rs.getString(1));
				bc.setChambre(rs.getString(2));
				bc.setEtage(rs.getInt(3));
				bc.setImage(rs.getString(5));
				bc.setPrixbase(rs.getDouble(4));
				bc.setPrixtotal(rs.getDouble(8));
				data.add(bc);
			}

		} catch (SQLException ex) {
			ex.printStackTrace();
		}

		return data;

	}
	
///////////////partie graphe calcule statisqiue

public ResultSet graphe_NB_reserv_mois() {
			ResultSet rs=null;
			 
			
				try {
					rs = ConnectionFactory
							.getConnection()
							.createStatement()
							.executeQuery("select  count(*),MONTH(datedebut) from reservation where YEAR(curdate()) = YEAR(datedebut) group by MONTH(datedebut)");
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
			 
			return rs;
}
public ResultSet graphe_CAT_DEMAND_année() {
	ResultSet rs=null;
	 
	
		try {
			rs = ConnectionFactory
					.getConnection()
					.createStatement()
					.executeQuery("select categoriechambre.typech,count(*) from  reservation ,categoriechambre ,chambre  where reservation.idch = chambre.idch and chambre.idcat = categoriechambre.idcat group by categoriechambre.typech");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	 
	return rs;
}



public ResultSet graphe_productivite_all_years() {
	ResultSet rs=null;
		try {
			rs = ConnectionFactory
					.getConnection()
					.createStatement()
					.executeQuery("select  count(*),MONTH(datedebut),YEAR(datedebut) from reservation    group by MONTH(datedebut)");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	 
	return rs;
}

}
