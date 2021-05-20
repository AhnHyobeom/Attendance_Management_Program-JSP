package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class UserRecord {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private ArrayList<UserRE> li = new ArrayList();
	
	public UserRecord() {
		try {
			// String dbURL = "jdbc:mysql://localhost:3306/dksgyqja123";
			// String dbID = "dksgyqja123";
			// String dbPassword = "rhkrgn19!";
			String dbURL = "jdbc:mysql://localhost:3306/amp_db?serverTimezone=UTC";
			String dbID = "root";
			String dbPassword = "1234";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<UserRE> getUserRecord(String userRFID) {
		String SQL = "SELECT * FROM workRecord WHERE w_e_rfid = ? AND w_day >= ? AND w_day <= ? ORDER BY w_day DESC";
		SimpleDateFormat from_sdf = new SimpleDateFormat ( "yyyy-MM");
		SimpleDateFormat to_sdf = new SimpleDateFormat ( "yyyy-MM-dd");
		Date today = new Date();
		String from_sql = from_sdf.format(today);
		from_sql = from_sql + "-01";
		String to_sql = to_sdf.format(today);
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,  userRFID);
			pstmt.setString(2,  from_sql);
			pstmt.setString(3,  to_sql);
			rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				UserRE ure = new UserRE();
				ure.setW_day(rs.getDate("w_day"));
				ure.setW_dm_id(rs.getInt("w_dm_id"));
				ure.setW_e_name(rs.getString("w_e_name"));
				ure.setW_e_position(rs.getString("w_e_position"));
				ure.setW_workonTime(rs.getTimestamp("w_workonTime"));
				ure.setW_workoffTime(rs.getTimestamp("w_workoffTime"));
				if("".equals(rs.getString("w_workoncf")))
				{
					ure.setW_workoncf("*");
				}
				else
				{
					ure.setW_workoncf(rs.getString("w_workoncf"));
				}
				if("".equals(rs.getString("w_workoffcf")))
				{
					ure.setW_workoffcf("*");
				}
				else
				{
					ure.setW_workoffcf(rs.getString("w_workoffcf"));
				}
				li.add(ure);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return li; 
	}
	
	public void listClear()
	{
		li.clear();
	}
	
	public String getRFID(String userID)
	{
		String RFID = "";
		String SQL = "SELECT userRFID FROM USER WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,  userID);
			rs = pstmt.executeQuery();
			
			rs.next();
			RFID = rs.getString("userRFID");
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return RFID;
	}
}
