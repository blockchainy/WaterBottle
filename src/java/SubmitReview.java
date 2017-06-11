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
public class SubmitReview extends HttpServlet {
    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse 
                         response) throws ServletException, IOException {
        
        String sqlResult = "";
        
        String taste = (String) request.getParameter("taste");
        String grip = (String) request.getParameter("grip");
        String opening = (String) request.getParameter("opening");
        String review = (String) request.getParameter("review");
        System.out.println(review);
        
        //try to get the request parameter id
        String id = (String) request.getParameter("id");

        
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
       
            
            //MAKE SURE WATERID EXISTS, foreign key can only update if theres a primary key elsewhere
                 
            statement.execute("INSERT INTO review (waterid, taste, grip, opening, review)" + 
                    "VALUES ('" + id + "', '" + taste + "', '" + grip + "', '" + opening + "', '" + review + "')");
            
            statement.close();
            connection.close();
            
        } catch (ClassNotFoundException e) {
            sqlResult = "<p>Error loading the database driver: <br>"
                    + e.getMessage() + "</p>";
        } catch (SQLException e) {
            sqlResult = "<p>Error executing the SQL statement: <br>"
                    + e.getMessage() + "</p>";
        }
        
         getServletContext().getRequestDispatcher("/DisplayImages").forward(request, response);
        
    }

    
    
}


