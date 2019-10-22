package com.todo.test;

import static org.junit.Assert.*;

import java.util.Date;

import org.junit.Test;

import com.todo.dbconnection.UserConnection;
import com.todo.bean.Task;
import com.todo.bean.User;
import com.todo.bean.User;

public class JunitTest {

	@Test
	public void testDataBaseConnection() {
		UserConnection uConnection = new UserConnection();		
		System.out.println(uConnection.getConnection());
	}
	
	@Test
	public void testUserObjectIfAllTheParametersAreWorking() {
		User user = new User();
		user.setId(1);
		user.setFirstName("Ennio");
		user.setLastName("Vitor");
		user.setUserName("evitor");
		user.setPassword("password");
		
		assertEquals(user.getId(),1);
		assertEquals(user.getFirstName(),"Ennio");
		assertEquals(user.getLastName(),"Vitor");
		assertEquals(user.getUserName(),"evitor");
		assertEquals(user.getPassword(),"password");		
	}
	
	@Test
	public void testTaskObjectIfAllTheParametersAreWorking() {
		Task task = new Task();
		task.setId(1);
		task.setUserId(2);
		task.setDescription("A test description");
		task.setLastUpDated(new Date());
		task.setText("A text test");
		
		assertEquals(task.getId(),1);
		assertEquals(task.getUserId(),2);
		assertEquals(task.getDescription(),"A test description");
		assertEquals(task.getLastUpDated(), new Date());
		assertEquals(task.getText(),"A text test");		
	}
	
	@Test
	public void testSaveAUserInTheDataBase() {
		User user = new User();
		user.setId(1);
		user.setFirstName("Unit");
		user.setLastName("Test");
		user.setUserName("uTest");
		user.setPassword("test");
		
		UserConnection uConnection = new UserConnection();
		assertEquals(uConnection.save(user),1);		
	}
	
	@Test
	public void testSaveTaskInTheDataBase() {
		Task task = new Task();
		task.setId(1);
		task.setUserId(2);
		task.setDescription("A test description");
		task.setLastUpDated(new Date());
		task.setText("A text test");
		
		UserConnection uConnection = new UserConnection();
		assertEquals(uConnection.saveTask(task),1);		
	}
	
//	The testDeleteTaskById() works but need to identify a task that should be deleted.
	
//	@Test
//	public void testDeleteTaskById() {
//		Task task = new Task();
//		task.setId(2);
//		
//		UserConnection uConnection = new UserConnection();
//		assertEquals(uConnection.delete(task),1);		
//	}
	
	@Test
	public void testSaveATaskToTheDataBaseAndRetreaveAllRecords() {
		Task task = new Task();
		task.setUserId(2);
		task.setDescription("A test description");
		task.setText("A text test");
		 
		UserConnection uConnection = new UserConnection();
		assertEquals(uConnection.saveTask(task),1);	
		
		assertNotNull(uConnection.getAllRecords());		
	}
	
	@Test
	public void testGetLstOfTaskForUserBasedOnUsersUserNameAndPassword() {
		User user = new User();
		user.setId(1);
		user.setFirstName("Unit");
		user.setLastName("Test");
		user.setUserName("uTest");
		user.setPassword("test");
		//If the Username and Password is found, than the tasks will be retreaved by the userId.
		UserConnection uConnection = new UserConnection();
		assertNotNull(uConnection.connect(user));		
	}
}
