import java.io.*;
import javax.servlet.*;
import java.sql.*;
public class Registerex extends GenericServlet
{
	public void service(ServletRequest req,ServletResponse res)throws IOException,ServletException
    {
		res.setContentType("text/HTML");
		PrintWriter out=res.getWriter();
		
		
		
		String cname=req.getParameter("name");
		String cemail=req.getParameter("email");
		Long cphno=Long.parseLong(req.getParameter("ph"));
		String caddr=req.getParameter("addr");
		int cage=Integer.parseInt(req.getParameter("age"));
		String cgender=req.getParameter("gender");
		
		
		try
		{
 			Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","manager");
			String qry="insert into coffee values(?,?,?,?,?,?)";
			PreparedStatement pstmt=con.prepareStatement(qry);
			pstmt.setString(1,cname);
			pstmt.setString(2,cemail);
			pstmt.setLong(3,cphno);
			pstmt.setString(4,caddr);
			pstmt.setString(5,cgender);
			pstmt.setInt(6,cage);
			
			pstmt.executeUpdate();
	
			con.close();
			
		}
		catch (Exception e)
		{
			out.print(e);
		}
		
	}
}
