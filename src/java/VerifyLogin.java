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
public class VerifyLogin extends HttpServlet {

 
   @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse 
                         response) throws ServletException, IOException {
        
        String sqlResult = "";
        
        String user = request.getParameter("username");
        String pass = request.getParameter("password");
        String admin = "";
        
        String errorMessage = "";
        
        //try passing this to view.jsp by setting the username
        request.setAttribute("username", user);
        
        boolean error = true;
        
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
                      
            ResultSet usernames = statement.executeQuery("SELECT * FROM user " +
                                                            "WHERE username = " + "\"" + user + "\"");
            
            //while there are usernames in this set, keep running method
            
            if (usernames.next()) {
                usernames.first();
                
                String pword = usernames.getString("password");
                
                if (pass.equals(pword)) {
                    //set admin (either true or false) and call it in the forward
                    admin = usernames.getString("admin");
                    error = false;
                } else {  
                    errorMessage = "Incorrect password."; 
                }
                
                
            } else {
                
                errorMessage = "Username submitted doesn't exist.";
                
            }
            request.setAttribute("errorM", errorMessage);
                
           
            statement.close();
            connection.close();

            
        } catch (ClassNotFoundException e) {
            sqlResult = "<p>Error loading the database driver: <br>"
                    + e.getMessage() + "</p>";
        } catch (SQLException e) {
            sqlResult = "<p>Error executing the SQL statement: <br>"
                    + e.getMessage() + "</p>";
        }
        
        if (error == false) {
            
            if (admin.equals("true")) {
                
                getServletContext().getRequestDispatcher("/admin.jsp").forward(request, response);
                
            } else {
            
                getServletContext().getRequestDispatcher("/DisplayImages").forward(request, response);
            }
            
        } else {
            
            getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
        }
        
        
    }
    
    

}
    

