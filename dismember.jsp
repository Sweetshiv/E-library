<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Disable Member</title>
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
	<%@ include file="userHome.jsp" %>
	<%
	if ("POST".equalsIgnoreCase(request.getMethod())) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/e_lib", "root", "root");

			PreparedStatement stmt = con.prepareStatement("update user set status = ? where user_name=?");
			
			String uname= request.getParameter("uname");
			String option = request.getParameter("s1");
			
			if(option.equals("d")){
				stmt.setInt(1, 0);
			}
			else{
				stmt.setInt(1, 1);
			}
			stmt.setString(2, uname);
			stmt.executeUpdate();
			out.println("User Status Changed..");
			
		}
		catch(Exception e)
		{
			out.println(e.toString());
		}
		
	}
	else{
		%>
		<div align="center">
		<form action="dismember.jsp" method="post">
		
		<label>User Name: </label><input type="text" name="uname"/><br><br>
		<label>Option : </label>
			<select name="s1">
				<option value="d">Disable</option>
			
				<option value="a">Enable</option>	
			</select><br><br>
			
			<input type="submit" value="SUBMIT"/><br><br>
			<input type="reset" value="Cancel"/>
		
		</form>
		</div>
		
		<%
	}
%>

</body>
</html>