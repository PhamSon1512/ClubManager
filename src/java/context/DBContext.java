package context;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ResourceBundle;

/**
 *
 * @author sodok
 */
public class DBContext {

    ResourceBundle bundle = ResourceBundle.getBundle("resource.database");

    public Connection getConnection() {
        try {
            Class.forName(bundle.getString("drivername"));
            String url = bundle.getString("url");
            String username = bundle.getString("username");
            String password = bundle.getString("password");
            Connection connection = DriverManager.getConnection(url, username, password);
            return connection;
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }

    public static void main(String[] args) throws SQLException {
        DBContext db = new DBContext();
        System.out.println(db.getConnection());
        System.out.println(db.getConnection().getCatalog());
    }
}
