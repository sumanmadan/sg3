import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

/**
 * MDS DB Connection singleton
 * @author S
 *
 */
public class DBConnection {
	private static  String tns = "";
	private static String src_url = "";
	private static String src_username = "";
	private static String src_password = "";
    
    private volatile static Connection connection;			
    
	Properties prop = new Properties();
	InputStream input = null;
    /**
     * Private Constructor
     */
    private DBConnection()	{ 	
    	try {

		input = new FileInputStream("conn.ini");

		// load a properties file
		prop.load(input);
		//jdbc:oracle:thin:@10.10.32.251:1521/YASST1.fc8racs1.gfoundries.com
		// get the property value and print it out
		System.out.println(prop.getProperty("hostname"));
		System.out.println(prop.getProperty("username"));
		System.out.println(prop.getProperty("password"));
		System.out.println(prop.getProperty("sid"));
		
		String hostname = prop.getProperty("hostname");
		src_username = prop.getProperty("username");
		src_password = prop.getProperty("password");
		String sid = prop.getProperty("sid");
		tns = hostname + ":1521/" + sid;
		src_url = "jdbc:oracle:thin:@" + tns;
		

	} catch (IOException ex) {
		ex.printStackTrace();
	} finally {
		if (input != null) {
			try {
				input.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
    }
	
    /**
     * Static method for MDS DB connection refernece
     * @return MDS DB Connection (Oracle)
     */
    public static Connection getDBConnection() {
    	
    	if (connection == null) {
    		synchronized (DBConnection.class) {
    			try {
    				Class.forName ("oracle.jdbc.OracleDriver");			
					connection = DriverManager.getConnection(src_url, src_username, src_password);
    			}
    			catch (SQLException e)	{ e.printStackTrace(); }
    			catch (Exception e)		{ e.printStackTrace(); }
    		}
    	}
    	return connection;
    }
 }

