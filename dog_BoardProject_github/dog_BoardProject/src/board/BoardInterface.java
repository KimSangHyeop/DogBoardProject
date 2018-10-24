package board;

import java.sql.SQLException;
import java.util.ArrayList;

public interface BoardInterface {
	public void save(Board b) throws SQLException;
	public Board search(int num) throws SQLException;
	public ArrayList<Board> search() throws SQLException;
	public void update(Board b) throws SQLException; 
	public void updateRate(int num) throws SQLException;
	public void delete(int num) throws SQLException;
}
