<%@ page import="java.io.*,java.sql.*,javax.servlet.*,javax.servlet.http.*" %>
<%

    String uname = request.getParameter("user");
    String password = request.getParameter("pass");

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "System", "manager");

        String query = "SELECT * FROM coffeesignup WHERE username = ? AND password = ?";
        PreparedStatement pst = con.prepareStatement(query);
        pst.setString(1, uname);
        pst.setString(2, password);
        ResultSet rs = pst.executeQuery();

        if (rs.next()) {
            session.setAttribute("user",uname);

            // Forwarding to main.html
            request.getRequestDispatcher("main.html").forward(request, response);
        } else {
            // Forwarding back to login.html if login fails
            request.getRequestDispatcher("login.html").forward(request, response);
        }

    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
    }
%>
