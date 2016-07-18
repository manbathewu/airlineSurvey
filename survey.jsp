<%-- 
    Document   : survey
    Created on : May 17, 2016, 12:34:53 AM
    Author     : Kaibin Wu
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Final Project: CST Airline Survey Insert Result(JSP Page)</title>
    </head>
    <body>
        <h2>Final Project: CST Airline Survey Insert Result(JSP Page)</h2>
        <%
            int inputDay = Integer.parseInt(request.getParameter("dayTxtBx"));
            int inputMonth = Integer.parseInt(request.getParameter("monthTxtBx"));
            int inputYear = Integer.parseInt(request.getParameter("yearTxtBx"));
            String inputFlightNum = request.getParameter("flightNumTxtBx");
            String friendlinessValue = request.getParameter("friendliness");
            String spaceValue = request.getParameter("space");
            String comfortValue = request.getParameter("comfort");
            String cleanlinessValue = request.getParameter("cleanliness");
            String noiseValue = request.getParameter("noise");
            
            //connecting to the database named surveys
            String databaseName = "jdbc:mysql://localhost:3306/surveys";
            String userName = "root";
            String password = "";
            
            //pointer to the database
            Class.forName("com.mysql.jdbc.Driver");
            
            //creating a connection object to the database
            Connection mycon = DriverManager.getConnection(databaseName,userName,password);
            
            //creating a SQL select command
            //column name
            //day,month,year,flightNum,friendliness,space,comfort,cleanliness,noise
            //since id is auto_incremented, so I will insert infomation only for 
            //all the other columns
            String SQLupdate="insert into surveys_table "
                    + "(day,month,year,flightNum,friendliness,space,comfort,cleanliness,noise)"
                    + " values(" + inputDay + ","
                    + inputMonth + "," + inputYear + ",'" + inputFlightNum + "','"
                    + friendlinessValue + "','" + spaceValue + "','" + comfortValue + "','"
                    + cleanlinessValue + "','" + noiseValue + "')";
            
            //creating a Statement object
            Statement mystat = mycon.createStatement();
            
            //running the SQLselect with the Statement object
            //it goes into a ResultSet object
            mystat.executeUpdate(SQLupdate);
            
            out.println("Your survey has been successfully submitted.");
        %>
    </body>
</html>
