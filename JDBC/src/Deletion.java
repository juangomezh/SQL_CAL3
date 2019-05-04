/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author jgome
 */
import java.io.PrintStream;
import java.sql.*;

public class Deletion {

    public static void main(String[] args) throws SQLException {
        Connection connection = null;
        Statement stmt = null;
        ResultSet re = null;

        String sq2="delete from musician where ID=\"78009666Ñ\"";
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
        try
        {
            stmt.executeUpdate(sq2);
            System.out.println("the Information was correclty deleted");
        }
        catch(Exception e)
        {
            System.out.println("the deletion couldn`t be performed");
        }
        

        // Close everything
        stmt.close();
        connection.close();
    }
}

