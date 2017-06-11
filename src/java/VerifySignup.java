/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import java.sql.*;

/**
 *
 * @author jwang
 */
@WebServlet(urlPatterns = {"/VerifySignup"})
public class VerifySignup extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse 
                         response) throws ServletException, IOException {
        
        
        String sqlResult = "";
        
        String errorMessage = "";
        boolean error = false;
        
        //create strings of passed parameters
        String user = request.getParameter("username");
        String pass = request.getParameter("pass");
        String repeatPass = request.getParameter("repeat-pass");
        String email = request.getParameter("email");
        
        
        
        request.setAttribute("username", user);
        request.setAttribute("pass", pass);
        request.setAttribute("repeat-pass", repeatPass);
        request.setAttribute("email", email);
        
        //FIX LATER PASSWORD CHECKER
//        if (pass != repeatPass) {
//         
//            errorMessage = "Please enter the same password";
//            error = true;
//        }
        
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
                      
            statement.execute("INSERT INTO user VALUES ('" + user + "', '" + email + "', '" + pass + "', 'false')");
           
            statement.close();
            connection.close();

            
        } catch (ClassNotFoundException e) {
            sqlResult = "<p>Error loading the database driver: <br>"
                    + e.getMessage() + "</p>";
        } catch (SQLException e) {
            sqlResult = "<p>Error executing the SQL statement: <br>"
                    + e.getMessage() + "</p>";
        }
        
        request.setAttribute("sqlResult", sqlResult);
        request.setAttribute("errorMessage", errorMessage);
        
        
        
        
        
        //check errors DOESNT WORK FOR NOW FIX LATER
//        if (error == true) {
//            getServletContext().getRequestDispatcher("/signup.jsp").forward(request, response);
//        } else {
//            getServletContext().getRequestDispatcher("/main.jsp").forward(request, response);
//        }
        
        System.out.println("s1");
        //try to include the file 
        getServletContext().getRequestDispatcher("/DisplayImages").forward(request, response);
//        getServletContext().getRequestDispatcher("/main.jsp").forward(request, response);
        

        
        
    

    
    }
}



