<%@ page import="java.io.*,java.sql.*" %>
<%@ page import="javax.servlet.*,javax.servlet.http.*" %>

<%
    String na = request.getParameter("name");
    String mail = request.getParameter("email");
    String un = request.getParameter("username");
    String pass = request.getParameter("password");
    String cgender = request.getParameter("gender");

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "manager");

        String qry = "insert into coffeesignup values(?,?,?,?,?)";
        PreparedStatement pstmt = con.prepareStatement(qry);

        pstmt.setString(1, na);
        pstmt.setString(2, mail);
        pstmt.setString(3, un);
        pstmt.setString(4, pass);
        pstmt.setString(5, cgender);

        pstmt.executeUpdate();

        // Forwarding to login.html
        request.getRequestDispatcher("login.html").forward(request, response);
    } catch (Exception e) {
        out.print(e);
    }
%>
