<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<script type="text/javascript">
		location.href="/index";
	</script>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>

<a href="./index">main</a>
    <%@ include file="./footer.jsp" %>
</body>
</html>
