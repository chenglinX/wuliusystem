<%@page contentType="text/html; charset=GBK"  %>
<html>
<head>
    <title>
        logout
    </title>
</head>
<body bgcolor="#ffffff">
<%
    session.invalidate();
    response.sendRedirect("index.jsp");
%>
</body>
</html>