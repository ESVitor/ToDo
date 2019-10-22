package com.todo.dbconnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.todo.bean.User;
import com.todo.bean.Task;

/**
 * This class is used to do the connection of the MySQl DataBase.
 * The method in this class also Create, Read, Update and Delete values 
 * from the database. 
 *  
 *  @author Ennio
 *  @since October/2019
 *  @version 0.0.1
 */
public class UserConnection {
	
	/**
	* This method creates the connection with the MySQL database.	* 
	*/	
	public static Connection getConnection(){
		Connection con=null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/todo","root","root");
		}catch(Exception e){System.out.println(e);}
		return con;
	}
	
	/**
	* This method creates a new user in the database.
	* 
	* @param u the Object to be saved.
	*/	
	public static int save(User u){
		int status=0;
		try{
			Connection con=getConnection();
			PreparedStatement ps=con.prepareStatement("INSERT INTO user(firstName,lastName,userName,password) VALUES(?,?,?,?)");
			ps.setString(1,u.getFirstName());
			ps.setString(2,u.getLastName());
			ps.setString(3,u.getUserName());
			ps.setString(4,u.getPassword());
			status=ps.executeUpdate();
		}catch(Exception e){System.out.println(e);}
		return status;
	}
	
	/**
	* This method creates a new task in the database.
	* 
	* @param u the Object to be saved.
	*/	
	public static int saveTask(Task t){
		int status=0;
		try{
			Connection con=getConnection();
			PreparedStatement ps=con.prepareStatement("INSERT INTO task(userId,description,text) VALUES(?,?,?)");
			ps.setInt(1, t.getUserId());
			ps.setString(2,t.getDescription());
			ps.setString(3,t.getText());
			status=ps.executeUpdate();
		}catch(Exception e){System.out.println(e);}
		return status;
	}
	
	/**
	* Method to update a task in the database.
	* 
	*  @param t Object containing the values to update.
	*/	
	//public static int update(Task t){
	//	int status=0;
	//	try{
	//		Connection con=getConnection();
	//		PreparedStatement ps=con.prepareStatement("UPDATE task SET description=?,text=? WHERE id=?");
	//		ps.setString(1,t.getDescription());
	//		ps.setString(2,t.getText());
	//		ps.setInt(3, t.getId());
	//		status=ps.executeUpdate();
	//	}catch(Exception e){System.out.println(e);}
	//	return status;
	//}
	
	/**
	* Method to delete a task in the database.
	* 
	* @param t Object holding the Id to identify the row to be deleted.
	*/	
	public static int delete(Task t){
		int status=0;
		try{
			Connection con=getConnection();
			PreparedStatement ps=con.prepareStatement("delete from task where id=?");
			ps.setInt(1,t.getId());
			status=ps.executeUpdate();
		}catch(Exception e){System.out.println(e);}
		return status;
	}
			
	/**
	* Method that retrieves all the recorded tasks from the database.
	*  
	*/
	public static List<Task> getAllRecords(){
		List<Task> list=new ArrayList<Task>();
		
		try{
			Connection con=getConnection();
			PreparedStatement ps=con.prepareStatement("select * from task");
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				Task t=new Task();
				t.setId(rs.getInt("id"));
				t.setUserId(rs.getInt("userId"));
				t.setDescription(rs.getString("description"));
				t.setLastUpDated(rs.getDate("lastUpDated"));
				t.setText(rs.getString("text"));
				list.add(t);
			}		
		}catch(Exception e){System.out.println(e);}
		return list;
	}
	
	/**
	* Method to validate the user access into the system.
	* 
	* @param t Object holding the userName and password.
	*/	
	public static List<Task> connect(User u){
		List<Task> list=new ArrayList<Task>();
		try{
			Connection con=getConnection();
			PreparedStatement ps=con.prepareStatement("SELECT id,userName,password FROM user WHERE userName=? AND password=?");
			ps.setString(1,u.getUserName());
			ps.setString(2,u.getPassword());
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				if(u.getUserName().equals(rs.getString("userName")) && u.getPassword().equals(rs.getString("password"))){
					list = getRecordById(rs.getInt("id"));					
				}
			}
		}catch(Exception e){System.out.println(e);}
		return list;
	}
	
	/**
	* Method that retrieves tasks by Id from the database.
	* 
	* @param id The Id that will set the userId from the task table.
	*  
	*/
	public static List<Task> getRecordById(int user){
		List<Task> list=new ArrayList<Task>();
		try{
			Connection con=getConnection();
			PreparedStatement ps=con.prepareStatement("select * from task where userId=?");
			ps.setInt(1, user);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				Task t=new Task();
				t.setId(rs.getInt("id"));
				t.setUserId(rs.getInt("userId"));
				t.setDescription(rs.getString("description"));
				t.setLastUpDated(rs.getDate("lastUpDated"));
				t.setText(rs.getString("text"));
				list.add(t);
			}
		}catch(Exception e){System.out.println(e);}
		return list;
	}
}
