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
public class DisplayReviews extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        
        String sqlResult = "";
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
            
          ResultSet reviews = statement.executeQuery("SELECT water.waterid, water.name, water.image, review.taste, review.grip, review.opening, review.review " +
                                                       "FROM water " +
                                                       "LEFT JOIN review " +
                                                       "ON water.waterid = review.waterid " +
                                                       "WHERE water.waterid = '" + id + "'");

//            ResultSet reviews = statement.executeQuery("SELECT water.waterid, water.name, water.image, review.taste, review.grip, review.opening, review.review " +
//                                                       "FROM water"); 

            
            
            reviews.last();
            int rows = reviews.getRow();
            reviews.first();
            
            String name = reviews.getString("name");
            String image = reviews.getString("image") + ".jpg"; 
            
            request.setAttribute("name", name);
            request.setAttribute("image", image);
           
            
            String[] review = new String[rows];
            String[] taste = new String[rows];
            String[] grip = new String[rows];
            String[] opening = new String[rows];
            
            for (int i = 0; i < rows; i++){
                
                review[i] = reviews.getString("review");
                taste[i] = reviews.getString("taste");
                grip[i] = reviews.getString("grip");
                opening[i] = reviews.getString("opening");
                reviews.next();
                
            }
            
            request.setAttribute("reviews", review);
            request.setAttribute("tastes", taste);
            request.setAttribute("grips", grip);
            request.setAttribute("openings", opening);
            
            statement.close();
            connection.close();
            
        } catch (ClassNotFoundException e) {
            sqlResult = "<p>Error loading the database driver: <br>"
                    + e.getMessage() + "</p>";
        } catch (SQLException e) {
            sqlResult = "<p>Error executing the SQL statement: <br>"
                    + e.getMessage() + "</p>";
        }

        getServletContext().getRequestDispatcher("/display.jsp").forward(request, response);

    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse 
                                       response) throws ServletException, IOException {
        doGet(request, response);
    }   

   
}
