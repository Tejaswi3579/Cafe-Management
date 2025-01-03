<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*, java.io.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>User Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #e6f7ff; /* Light blue background */
            margin: 0;
            padding: 0;
        }

        .profile-container {
            width: 80%;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .profile-heading {
            text-align: center;
            font-size: 24px;
            margin-bottom: 20px;
            color: #333;
        }

        .detail-item {
            background-color: #f9f9f9; /* Light gray box background */
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .detail-label {
            font-weight: bold;
            color: #333;
        }

        .detail-input {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
    </style>
</head>
<body>
<%
		String uname = (String)session.getAttribute("user");
		if(uname != null)
		{

			out.println("Welcome  "  + uname+"  This is your Profile");

			out.println("<div class=\"profile-container\">");
			out.println("<div class=\"profile-heading\">User Profile</div>");

			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "manager");
				String qry = "select * from coffee";
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery(qry);

				out.println("<div class=\"details-container\">");
				while (rs.next()) {
					out.println("<div class=\"detail-item\">");
					out.println("<span class=\"detail-label\">Name:</span> <input class=\"detail-input\" type=\"text\" value=\"" + rs.getString(1) + "\" disabled>");
					out.println("</div>");
					out.println("<div class=\"detail-item\">");
					out.println("<span class=\"detail-label\">Email:</span> <input class=\"detail-input\" type=\"text\" value=\"" + rs.getString(2) + "\" disabled>");
					out.println("</div>");
					out.println("<div class=\"detail-item\">");
					out.println("<span class=\"detail-label\">Phone:</span> <input class=\"detail-input\" type=\"text\" value=\"" + rs.getLong(3) + "\" disabled>");
					out.println("</div>");
					out.println("<div class=\"detail-item\">");
					out.println("<span class=\"detail-label\">Address:</span> <input class=\"detail-input\" type=\"text\" value=\"" + rs.getString(4) + "\" disabled>");
					out.println("</div>");
					out.println("<div class=\"detail-item\">");
					out.println("<span class=\"detail-label\">Gender:</span> <input class=\"detail-input\" type=\"text\" value=\"" + rs.getString(5) + "\" disabled>");
					out.println("</div>");
					out.println("<div class=\"detail-item\">");
					out.println("<span class=\"detail-label\">Age:</span> <input class=\"detail-input\" type=\"text\" value=\"" + rs.getInt(6) + "\" disabled>");
					out.println("</div>");
				}
				out.println("</div>");
				con.close();

			} catch (Exception e) {
				out.println("<div>An error occurred: " + e.getMessage() + "</div>");
			}
			out.println("</div>");
    } else {
        out.println("Please login first");
        RequestDispatcher rd1 = request.getRequestDispatcher("login.html");
        rd1.include(request, response);
    }
%>
</body>
</html>
