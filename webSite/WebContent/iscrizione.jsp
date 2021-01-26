<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- mio CSS -->
<link href="css/stileLogin.css" rel="stylesheet">
</head>
<body>
	<%
		if(session.getAttribute("uname")!=null){
			response.sendRedirect("articolo1.jsp");
		}
	%>
	<form action="Iscrizione" method="get">
		<div class="imgcontainer">
			<img src="media/img_avatar.png" alt="Avatar" class="avatar">
		</div>

		<div class="container">
			<label for="uname"><b>Username</b></label> <input type="text"
				placeholder="Inserisci il nome utente" name="uname" required> <label
				for="psw"><b>Password</b></label> <input type="password"
				placeholder="Inserisci la Password" name="psw" required>

			<button type="submit">ISCRIVITI !</button>
		</div>
	</form>
</body>
</html>