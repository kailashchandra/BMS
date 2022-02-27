package com.tcs.ilp.util;

import java.sql.*;

public class ConnectionProvider {
	static Connection connection;
	public static Connection getConnection() throws Exception{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		connection = DriverManager.getConnection("jdbc:oracle:thin:@intvmoradb02:1521:ORAJAVADB", "PJ02DEV_TJA251", "tcstvm");
		return connection;
	}
}
