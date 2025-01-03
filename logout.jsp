<%@ page import="javax.servlet.http.*, java.io.*" %>
<%
    session.removeAttribute("user");

    // Forwarding to index.html
    request.getRequestDispatcher("index.html").forward(request, response);

    out.println("You are successfully logged out!");
    out.close();
%>
