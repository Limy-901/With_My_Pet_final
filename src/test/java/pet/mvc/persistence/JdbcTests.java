package pet.mvc.persistence;

import java.sql.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class JdbcTests {
	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(ClassNotFoundException cnfe) {
			log.info("ClassNotFoundException"+cnfe);
		}
	}
	
	@Test
	public void testConnectionJdbc() {
		String url = "jdbc:oracle:thin:@106.240.16.165:15230:JAVA";
		try {
			Connection con = DriverManager.getConnection(url, "pet", "java");
			log.info("#con from Jdbc: " + con);
		}catch(SQLException se) {
			log.info("#testConnectionJdbc() exception: " + se);
		}
	}
	
}
