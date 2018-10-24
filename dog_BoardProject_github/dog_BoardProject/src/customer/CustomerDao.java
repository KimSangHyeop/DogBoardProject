package customer;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CustomerDao {
	
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
	
	public void save(Customer c) throws SQLException
	{
		Connection con = getConnection();
		String sql = "Insert into Customer Values(?,?,?,?,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, c.getName());
		ps.setString(2, c.getAge());
		ps.setString(3, c.getUserid());
		ps.setString(4, c.getPassword());
		ps.setString(5, c.getTelNum());
		ps.setString(6, c.getGender());
		ps.setString(7, c.getAddr());
		ps.setString(8, c.getDetailAddr());
		ps.setString(9, c.getContent());
		
		ps.executeUpdate();
		ps.close();
		con.close();
	}
	
	public ArrayList<Customer> search() throws SQLException{
		ArrayList<Customer> result=new ArrayList<>();
		Connection con=getConnection();
		String sql="Select * from Customer";
		PreparedStatement ps=con.prepareStatement(sql);
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			String userid = rs.getString("userid");
			String name = rs.getString("name");
			String age = rs.getString("age");
			String password = rs.getString("password");
			String telNum = rs.getString("telNum");
			String gender = rs.getString("gender");
			String addr = rs.getString("addr");
			String detailAddr = rs.getString("detailAddr");
			String content = rs.getString("content");
			Customer c = new Customer
					(name, age, userid, password, telNum, gender, addr, detailAddr, content);
			result.add(c);
		}
		rs.close();
		ps.close();
		con.close();
		
		return result;
	}
	public Customer search(String userid, String password) throws SQLException {
		Customer c=null;
		Connection con=getConnection();
		String sql="Select * from Customer where userid=? and password=?";
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setString(1, userid);
		ps.setString(2, password);
		ResultSet rs=ps.executeQuery();
		if(rs.next()) {
			String userid2 = rs.getString("userid");
			String name = rs.getString("name");
			String age = rs.getString("age");
			String password2 = rs.getString("password");
			String telNum = rs.getString("telNum");
			String gender = rs.getString("gender");
			String addr = rs.getString("addr");
			String detailAddr = rs.getString("detailAddr");
			String content = rs.getString("content");
			c = new Customer
					(name, age, userid2, password2, telNum, gender, addr, detailAddr, content);
		}	
		rs.close();
		ps.close();
		con.close();
		return c;
	}
	public void delete(String userid) throws SQLException {
		Connection con=getConnection();//2
		String sql="Delete from Customer where userid=?";
		PreparedStatement ps=con.prepareStatement(sql);//3
		ps.setString(1, userid);
		
		ps.executeUpdate();
		ps.close();
		con.close();
	}
	public void update(Customer c) throws SQLException {
		Connection con = getConnection();
		String sql = "Update Customer Set password=?, telNum=?, addr=?, detailaddr=?, content=? "
				+  "where userid=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, c.getPassword());
		ps.setString(2, c.getTelNum());
		ps.setString(3, c.getAddr());
		ps.setString(4, c.getDetailAddr());
		ps.setString(5, c.getContent());
		ps.setString(6, c.getUserid());
		
		ps.executeUpdate();
		ps.close();
		con.close();
	}
	public String search(String userid) throws SQLException {
		String pass="";
		Connection con=getConnection();
		String sql="Select password from Customer where userid=?";
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setString(1, userid);
		ResultSet rs=ps.executeQuery();
		
		if(rs.next()) {
			//int num2=rs.getInt(1);
			pass=rs.getString("password");
		}	
		rs.close();
		ps.close();
		con.close();
		return pass;
	}

	public String searchId(Customer c) throws SQLException {
		
		String userid=null;
		Connection con=getConnection();
		String sql="Select userid from Customer where name=? and age=? and telnum=?";
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setString(1, c.getName());
		ps.setString(2, c.getAge());
		ps.setString(3, c.getTelNum());
		ResultSet rs=ps.executeQuery();
		if(rs.next()) {
			userid = rs.getString("userid");
		}	
		rs.close();
		ps.close();
		con.close();
		return userid;
	}

	public String searchPass(Customer c) throws SQLException {
		String password=null;
		Connection con=getConnection();
		String sql="Select password from Customer where name=? and userid=? and telnum=?";
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setString(1, c.getName());
		ps.setString(2, c.getUserid());
		ps.setString(3, c.getTelNum());
		ResultSet rs=ps.executeQuery();
		if(rs.next()) {
			password = rs.getString("password");
		}	
		rs.close();
		ps.close();
		con.close();
		return password;
	}
}
