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
public class SearchWater extends HttpServlet {

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse 
                         response) throws ServletException, IOException {
        
        
        String sqlResult = "";
        
        String searchResults = (String) request.getParameter("search").toLowerCase();
        
        String error = "";
        
        
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
            
            ResultSet waterbottles = statement.executeQuery("SELECT waterid, name, image " +
                                                            "FROM water " +
                                                            "WHERE name = " + "\"" + searchResults + "\"");
            
            if (waterbottles.next()) {
                
                waterbottles.first();
                
                String waterid = waterbottles.getString(1);
                String name = waterbottles.getString(2);
                String image = waterbottles.getString(3) + ".jpg";
                
                request.setAttribute("singleBottleName", name);
                request.setAttribute("singleBottleId", waterid);
                request.setAttribute("singleBottleImage", image);
        

            } else {
                error = "No results found.";
                request.setAttribute("error", error);
            }
                 
                
            
            statement.close();
            connection.close();
            
        } catch (ClassNotFoundException e) {
            sqlResult = "<p>Error loading the database driver: <br>"
                    + e.getMessage() + "</p>";
        } catch (SQLException e) {
            sqlResult = "<p>Error executing the SQL statement: <br>"
                    + e.getMessage() + "</p>";
        }
        
        getServletContext().getRequestDispatcher("/searchresults.jsp").forward(request, response);
        
        
        
    }


}
