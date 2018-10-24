package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BoardDao implements BoardInterface {
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
	@Override
	public void save(Board b) throws SQLException {
		Connection conn = getConnection();
		String sql = "insert into Board values(board_seq.nextval,sysdate,?,?,?,0)";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, b.getWrite());
		ps.setString(2, b.getTitle());
		ps.setString(3, b.getCont());
		ps.executeUpdate();
		
		ps.close();
		conn.close();
	}

	@Override
	public Board search(int num) throws SQLException {
		Connection conn = getConnection();
		String sql = "Select * from Board where num=?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, num);
		ResultSet rs = ps.executeQuery();
		Board b = new Board();
		if(rs.next()) {
			b = new Board(rs.getInt("num"),
						rs.getString("wdate"),
						rs.getString("write"),
						rs.getString("title"),
						rs.getString("cont"),
						rs.getInt("rate"));
		}
		rs.close();
		ps.close();
		conn.close();
		return b;
	}

	@Override
	public ArrayList<Board> search() throws SQLException {
		Connection conn = getConnection();
		String sql = "Select * from Board ORDER BY num desc";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		ArrayList<Board> bArr = new ArrayList<Board>();
		Board b = new Board();
		while(rs.next()) {
			b = new Board(rs.getInt("num"),
						rs.getString("wdate"),
						rs.getString("write"),
						rs.getString("title"),
						rs.getString("cont"),
						rs.getInt("rate"));
			bArr.add(b);
		}
		rs.close();
		ps.close();
		conn.close();
		return bArr;
	}
	
	@Override
	public void update(Board b) throws SQLException { 
		Connection conn = getConnection();
		String sql = "update Board set title=?, cont=? where num=?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, b.getTitle());
		ps.setString(2, b.getCont());
		ps.setInt(3, b.getNum());
		ps.executeUpdate();
		
		ps.close();
		conn.close();
	}

	@Override
	public void updateRate(int num) throws SQLException {
		Connection conn = getConnection();
		String sql = "update Board set rate=rate+1 where num=?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, num);
		ps.executeUpdate();
		
		ps.close();
		conn.close();
	}

	@Override
	public void delete(int num) throws SQLException {
		Connection conn = getConnection();
		String sql = "delete from Board where num=?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, num);
		ps.executeUpdate();
		
		ps.close();
		conn.close();
	}
	
}
