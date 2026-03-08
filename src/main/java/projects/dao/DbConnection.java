package projects.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import projects.exception.DbException;

public class DbConnection {
	private static final String HOST = "localhost";
	private static final int PORT = 3306;
	private static final String SCHEMA = "projects";
	private static final String USER = "root";
	private static final String PASSWORD = "0400290DcM$$$";

	private static String getUrl() {
    return String.format("jdbc:mysql://%s:%d/%s?user=%s&password=%s&useSSL=false&allowPublicKeyRetrieval=true",
        HOST, PORT, SCHEMA, USER, PASSWORD
    );
}
	public static Connection getConnection() throws SQLException {
		String url = getUrl();
		try {
			Connection conn = DriverManager.getConnection(url);
			System.out.println("Successfully obtained connection!");
			return conn;
		} catch (SQLException e) {
			System.out.println("Error getting connection.");
			throw e;
		}
	}

	public static Connection getConnectionSafe() {
		String url = getUrl();
		try {
			Connection conn = DriverManager.getConnection(url);
			System.out.println("Successfully obtained connection!");
			return conn;
		} catch (SQLException e) {
			System.out.println("Error getting connection.");
			throw new DbException(e);
		}
	}
}
