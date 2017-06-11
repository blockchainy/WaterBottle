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
public class GetId extends HttpServlet {

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse 
                         response) throws ServletException, IOException {
        
        
        String sqlResult = "";
        
        //get the query parameter
        String id = request.getParameter("id");
        
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
            
            //atm the sqlstatement doesnt even work
            
            ResultSet waters = statement.executeQuery("SELECT * FROM water WHERE waterid = '" + id + "'");  
                                                  //"WHERE waterid = '" + id + "'");
//                                                  "WHERE waterid = '89'");

            waters.first();
            
            
            
            String name = waters.getString("name");
            String image = waters.getString("image");
            String waterid = waters.getString("waterid");
            request.setAttribute("name", name);
            request.setAttribute("image", image);
            request.setAttribute("waterid", waterid);
            
//            if(waters.next()){
//                
//                waters.first();
//                String name = waters.getString("name");
//                String image = waters.getString("image");
//                
//                request.setAttribute("name", name);
//                request.setAttribute("image", image);
//            }
            

            
            statement.close();
            connection.close();
            
        } catch (ClassNotFoundException e) {
            sqlResult = "<p>Error loading the database driver: <br>"
                    + e.getMessage() + "</p>";
        } catch (SQLException e) {
            sqlResult = "<p>Error executing the SQL statement: <br>"
                    + e.getMessage() + "</p>";
        }
        
        getServletContext().getRequestDispatcher("/review.jsp").forward(request, response);
        
        
        
    }

}
