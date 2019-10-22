# ToDo
A simple To-Do list application

# Initial settings for server deployment.
The project was initially built in Eclipse IDE for JavaEE developers.

# Server configuration:
- TomCat 7
- JavaEE
- JDK1.8.0_181
# WEB-INF/lib:
- Jstl-1.2.jar
- mysql-connector.jar

# The server is configured to use MySQL Database. With the following Schema name, user and password. It can be changed in the class UserConnection.
jdbc:mysql://localhost:3306/todo","root","root"

# Table: user
	id int(11) PK NN
	fistName VARCHAR(45) NN
	lastName VARCHAR(45) NN
	userName VARCHAR(45) NN
	password VARCHAR(16) NN
	
# Table: task
	id INT(11) PK NN
	userId INT(11) NN
	description VARCHAR(255)
	lastUpDate DateTime NN default/Expression: CURRENT_TIMESTAMP
	text TEXT
	
# Also set the the userName and password charset/Collation to enforce security.	
latin1/lating_general_cs

