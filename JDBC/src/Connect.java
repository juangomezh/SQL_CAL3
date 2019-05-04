
import java.io.PrintStream;
import java.sql.*;

public class Connect {

    public static void main(String[] args) throws SQLException {
        Connection connection = null;
        Statement stmt = null;
        ResultSet re = null;
        String sql = "select musicgroup.genre, musicgroup.groupID \n" +
                      "from musicgroup where musicgroup.genre like \"Jazz\"";
  
        try {
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Success loading Driver!");
        } catch (Exception e) {
            System.out.println("Fail loading Driver!");
            e.printStackTrace();
        }
        
        String url = "jdbc:mysql://localhost:3306/assigment";
        connection = DriverManager.getConnection(url, "root", "");

        stmt = connection.createStatement();
        re = stmt.executeQuery(sql);
        while (re.next()) {
            String genre = re.getString(1);
            String ID = re.getString(2);
            System.out.print("genre: " + genre + "\n");
            System.out.print("groupID:" + ID + "\n");
        }
        // Get Metadata
        ResultSetMetaData rsmd = re.getMetaData();
        for (int i = 1; i <= rsmd.getColumnCount(); i++) {
            System.out.print(rsmd.getColumnName(i) + ": ");
            System.out.println(rsmd.getColumnType(i));
        }

        // Close everything
        re.close();
        stmt.close();
        connection.close();
    }
}
