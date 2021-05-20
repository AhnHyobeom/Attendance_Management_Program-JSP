package user;

import java.sql.Timestamp;
import java.util.Date;

public class UserRE {
	
	// w_id, w_e_rfid, w_dm_id, w_e_name, w_e_position, w_day, w_workonTime, w_workoffTime, w_workoncf, w_workoffcf
	private Date w_day;
	private int w_dm_id;
	private String w_e_name;
	private String w_e_position;
	private Timestamp w_workonTime;
	private Timestamp w_workoffTime;
	private String w_workoncf;
	private String w_workoffcf;
	
	public UserRE()
	{
		
	}
	
	public int getW_dm_id() {
		return w_dm_id;
	}

	public void setW_dm_id(int w_dm_id) {
		this.w_dm_id = w_dm_id;
	}
	
	public Timestamp getW_workonTime() {
		return w_workonTime;
	}

	public void setW_workonTime(Timestamp w_workonTime) {
		this.w_workonTime = w_workonTime;
	}

	public String getW_workoncf() {
		return w_workoncf;
	}

	public void setW_workoncf(String w_workoncf) {
		this.w_workoncf = w_workoncf;
	}
	
	public Date getW_day() {
		return w_day;
	}

	public void setW_day(Date w_day) {
		this.w_day = w_day;
	}


	public String getW_e_name() {
		return w_e_name;
	}

	public void setW_e_name(String w_e_name) {
		this.w_e_name = w_e_name;
	}

	public String getW_e_position() {
		return w_e_position;
	}

	public void setW_e_position(String w_e_position) {
		this.w_e_position = w_e_position;
	}

	public Timestamp getW_workoffTime() {
		return w_workoffTime;
	}

	public void setW_workoffTime(Timestamp w_workoffTime) {
		this.w_workoffTime = w_workoffTime;
	}

	public String getW_workoffcf() {
		return w_workoffcf;
	}

	public void setW_workoffcf(String w_workoffcf) {
		this.w_workoffcf = w_workoffcf;
	}
	
}
