/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author jwang
 */
public class DisplayImages extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        
        String sqlResult = "";
        
        
        try {
            // load the driver
            Class.forName("com.mysql.jdbc.Driver");
            
            // get a connection
            String dbURL = "jdbc:mysql://localhost:3306/users";
            String username = "root";
            String password = "sesame";
            Connection connection = DriverManager.getConnection(
                    dbURL, username, password);
            
            
            // create a statement
            Statement statement = connection.createStatement();
            
            ResultSet images = statement.executeQuery("SELECT waterid, name, image FROM water");
            
            //set the current row to the last to get the last row number
            //then get # of rows and that is how many rows there there are
            //set the resultset back to the very first row before iterating the loop
            images.last();
            int numberOfRows = images.getRow();
            images.first();
            
            String[] image = new String[numberOfRows];
            String[] waterid = new String[numberOfRows];
            String[] name = new String[numberOfRows];
            
            for (int i = 0; i < numberOfRows; i++){
                
                image[i] = images.getString("image") + ".jpg";
                waterid[i] = images.getString("waterid");
                name[i] = images.getString("name");
                images.next();
                
            }
            
            request.setAttribute("image", image);
            request.setAttribute("waterid", waterid);
            request.setAttribute("name", name);
            
            //String image[] = request.getAttribute("image")
            //for (int i = 0; i<image.length; i++ ){
            
                 
                
            
            statement.close();
            connection.close();
            
        } catch (ClassNotFoundException e) {
            sqlResult = "<p>Error loading the database driver: <br>"
                    + e.getMessage() + "</p>";
        } catch (SQLException e) {
            sqlResult = "<p>Error executing the SQL statement: <br>"
                    + e.getMessage() + "</p>";
        }

        getServletContext().getRequestDispatcher("/displaytext.jsp").forward(request, response);

    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse 
                                       response) throws ServletException, IOException {
        doGet(request, response);
    }   
}
