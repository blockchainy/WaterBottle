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
public class AddItem extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse 
                         response) throws ServletException, IOException {
        
        String sqlResult = "";
        String errorM = "";
        
        String name = (String) request.getParameter("name");
        String image = (String) request.getParameter("image");
        int waterid = 0;
        
        if(checkDigits(request.getParameter("waterid"))) {
            
            waterid = Integer.parseInt(request.getParameter("waterid"));
            System.out.println(waterid);
        } else {
            
            errorM = "Please enter a valid digit for the ID.";
            request.setAttribute("error", errorM);
        }
        
        if (image.equals(null) || image.equals("")){
            image = "generic";
        }
        
        
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
                 
            statement.execute("INSERT INTO water (waterid, name, image)" + 
                    "VALUES ('" + waterid + "', '" + name + "', '" + image + "')");
            
                 
            
            statement.close();
            connection.close();
            
        } catch (ClassNotFoundException e) {
            sqlResult = "<p>Error loading the database driver: <br>"
                    + e.getMessage() + "</p>";
        } catch (SQLException e) {
            sqlResult = "<p>Error executing the SQL statement: <br>"
                    + e.getMessage() + "</p>";
        }
        
         getServletContext().getRequestDispatcher("/admin.jsp").forward(request, response);
        
        
    }
    
    private boolean checkDigits(String s) {
         
         char[] array = s.toCharArray();
         
         for (int i = 0; i < s.length(); i++) {
                    if (!Character.isDigit(array[i])) {
                        //if not a digit return false
                        return false;
                    }   
        }
        return true;
    }

}
