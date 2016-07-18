<%-- 
    Document   : record
    Created on : May 17, 2016, 1:20:26 AM
    Author     : Kaibin Wu
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Final Project: CST Airline Survey Record(JSP Page)</title>
    </head>
    <body>
        <%
            //connecting to the database named surveys
            String databaseName = "jdbc:mysql://localhost:3306/surveys";
            String userName = "root";
            String password = "";
            
            //pointer to the database
            Class.forName("com.mysql.jdbc.Driver");
            
            //creating a connection object to the database
            Connection mycon = DriverManager.getConnection(databaseName,userName,password);
            
            //creating a SQL select command
            //day,month,year,flightNum,friendliness,space,comfort,cleanliness,noise
            String SQLquery="select * from surveys_table";
            
            //creating a Statement object
            Statement mystat = mycon.createStatement();
            
            //running the SQLselect with the Statement object
            //it goes into a ResultSet object
            ResultSet resultset = mystat.executeQuery(SQLquery) ; 
        %>
        <h2>Final Project: CST Airline Survey Record(JSP Page)</h2>
        <h3>Surveys Record</h3>
        <table BORDER="1">
            <TR>
                <TH>Month</TH>
                <TH>Day</TH>
                <TH>Year</TH>
                <TH>Flight Number</TH>
                <TH>Friendliness</TH>
                <TH>Space</TH>
                <TH>Comfort</TH>
                <TH>Cleanliness</TH>
                <TH>Noise</TH>
            </TR>
            <% while(resultset.next()){ %>
            <TR>
                <TD> <%= resultset.getString(3) %></TD>
                <TD> <%= resultset.getString(2) %></TD>
                <TD> <%= resultset.getString(4) %></TD>
                <TD> <%= resultset.getString(5) %></TD>
                <TD> <%= resultset.getString(6) %></TD>
                <TD> <%= resultset.getString(7) %></TD>
                <TD> <%= resultset.getString(8) %></TD>
                <TD> <%= resultset.getString(9) %></TD>
                <TD> <%= resultset.getString(10) %></td>
            </TR>
            <% } %>
        </table>
    </body>
</html>
