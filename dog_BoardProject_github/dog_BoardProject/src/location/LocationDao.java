package location;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class LocationDao {

	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} // 1
	}

	public Connection getConnection() throws SQLException {
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
		Connection conn = DriverManager.getConnection(url, "pet", "pet");
		return conn;
	}
	public void save(Location l) throws SQLException
	{
		Connection con = getConnection();
		String sql = "Insert into Location Values(?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, l.getId());
		ps.setDouble(2, l.getLat());
		ps.setDouble(3, l.getLng());
		
		ps.executeUpdate();
		ps.close();
		con.close();
	}
	
	public ArrayList<Location> search() throws SQLException{
		ArrayList<Location> result=new ArrayList<>();
		Connection con=getConnection();
		String sql="Select * from Location";
		PreparedStatement ps=con.prepareStatement(sql);
		ResultSet rs=ps.executeQuery();
		
		while(rs.next()) {
			String id = rs.getString("id");
			double lat = rs.getDouble("lat");
			double lng = rs.getDouble("lng");
			Location l = new Location(id, lat, lng);
			
			result.add(l);
		}
		rs.close();
		ps.close();
		con.close();
		
		return result;
	}
	
	public void delete(String id) throws SQLException {
		Connection con=getConnection();//2
		String sql="Delete from Location where id=?";
		PreparedStatement ps=con.prepareStatement(sql);//3
		ps.setString(1, id);
		
		ps.executeUpdate();
		ps.close();
		con.close();
	}
	
}
