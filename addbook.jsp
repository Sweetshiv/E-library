<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Books</title>
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
if ("POST".equalsIgnoreCase(request.getMethod())) 
{
	String title=request.getParameter("title");
	String author=request.getParameter("author");
	String publication=request.getParameter("publication");
	String edition=request.getParameter("edition");
	int price=Integer.parseInt(request.getParameter("price"));
	
	try
	{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/e_lib","root","root");
		PreparedStatement stmt=con.prepareStatement("insert into books (author,title,Edition,Price,Publication) values (?,?,?,?,?)");
		
		stmt.setString(1,author);
		stmt.setString(2,title);
		stmt.setString(3,edition);
		stmt.setInt(4,price);
		stmt.setString(5,publication);
		
		stmt.executeUpdate();
		out.println("Book Inserted Sucessfully.......");
		
	}
	catch(Exception e)
	{
		out.println(e.toString());
	}
		
}
else
{
%>
<div align="center">
<form action="addbook.jsp" method="Post">
<label>Title :<input type="text" name="title"></label><br><br>
<label> Author :<input type="text" name="author"></label><br><br>
<label> Publication:<input type="text" name="publication"></label><br><br>
<label>Edition :<input type="text" name="edition"></label><br><br>
<label>Price :<input type="text" name="price"></label><br><br>
<input type="submit" value="Add"><br><br>
<input=type="button" value="cancel">
</div>
</form>
<%
}
%>
</body>
</html>