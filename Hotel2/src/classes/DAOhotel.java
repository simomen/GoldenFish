package classes;

import java.sql.ResultSet;
import java.sql.SQLException;

public class DAOhotel {
	
	public ResultSet listhotel(){
		ResultSet rs=null;
		try {
			rs = ConnectionFactory.getConnection().createStatement().executeQuery("select * from hotel");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
		
		
	}
	
}
