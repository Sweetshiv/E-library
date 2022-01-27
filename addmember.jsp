<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Member</title>
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

    String uname=request.getParameter("username");
    String pwd=request.getParameter("password");
    String name=request.getParameter("Name");
    String addr=request.getParameter("Address");
    String email=request.getParameter("Email");
    String mb=request.getParameter("Mob");
    char gender=request.getParameter("Gender").charAt(0);
    Date date= Date.valueOf(request.getParameter("DOB"));

   try{
    			Class.forName("com.mysql.cj.jdbc.Driver");
    			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ e_lib","root","root");
    			PreparedStatement stmt=con.prepareStatement("select * from user where user_name =? " );
    			stmt.setString(1,uname);
    			//stmt.setString(2,pwd);
    			
    			ResultSet rs=stmt.executeQuery();
    			if(rs.next()){
    				out.println("<h1><center>User is already exist</center><h1>");
    				
    				
    			}else{

                PreparedStatement stmt1=con.prepareStatement("insert into user(user_name,password,user_type) values(?,?,0)" );
               stmt1.setString(1,uname);
                stmt1.setString(2,pwd);
            
                stmt1.executeUpdate();
             
                 rs=stmt.executeQuery();
         if(rs.next()){
             int uid=rs.getInt("user_id");

             PreparedStatement stmt2=con.prepareStatement("insert into userdetails values(?,?,?,?,?,?,?)");
             stmt2.setInt(1,uid);
             stmt2.setString(2,name);
             stmt2.setString(3,addr);
             stmt2.setString(4,email);
             stmt2.setString(5,mb);
             stmt2.setString(6,String.valueOf(gender));
             stmt2.setDate(7,date);
            
           stmt2.executeUpdate();
}

    				
    			}
    		}catch(Exception e){
    			out.println(e.toString());
    		}

}
else{
	%>
<div align="center">
	<form action="addmember.jsp" method="post" name="form2">
	<label>User Name :</label>
	<input type="text" name ="username" placeholder="username" required ><br><br>
	
	<label>Password :</label>
	<input type="password" name ="password" placeholder="********" required ><br><br>
	
	<label>Name :</label>
	<input type="text" name ="Name" placeholder="Name" required ><br><br>
	
	<label>Address :</label>
	<Textarea name="Address" row="5" col="10"></textarea><br><br>
	
	<label>Email :</label>
	<input type="text" name ="Email" placeholder="email" required ><br><br>
	
	<label>Mobile No. :</label>
	<input type="number" name ="Mob" placeholder="mob.no." required ><br><br>
	
	<label>Gender :</label>
	<input type="radio" name ="Gender" value="M"  >Male</input>
	<input type="radio" name ="Gender" value="F"  >Female</input>
	<input type="radio" name ="Gender" value="O"  >Others</input><br><br>
	
	<label>DOB:</label>
	<input type="date" name ="DOB" ><br><br>
	
	<input type="submit" value ="SUBMIT  "><br><br>
<input type="reset" value ="CANCEL">
	</form>
</div>
	
	<%
}
%>
</body>
</html>