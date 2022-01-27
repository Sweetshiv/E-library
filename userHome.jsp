    <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<style>
body{
margin:0;
padding:0;
background:url(http://www.screadiness.org/wp-content/uploads/2020/06/free-book-library.jpg);
background-size:cover;
font-family:sans-serify;

}

</style>
</head>
<body>
	<%
		String uName= session.getAttribute("um").toString();
		String userType = session.getAttribute("ut").toString();
		
		int ut=Integer.parseInt(userType);
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/e_lib", "root", "root");

			PreparedStatement stmt = con.prepareStatement("select * from usermenu where userRole="+ut);
			
			ResultSet rst = stmt.executeQuery();
			
			while(rst.next()){
				out.println("<center><a href="+rst.getString("url")+">"+rst.getString("MenuItem")+"</center></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
			}
			
		}
		catch(Exception e)
		{
			out.println(e.toString());
		}
	%>
</body>
</html>
    
