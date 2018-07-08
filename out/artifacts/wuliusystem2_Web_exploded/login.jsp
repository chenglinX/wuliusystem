<%--
  Created by IntelliJ IDEA.
  User: chenglinx
  Date: 2018/7/4
  Time: 下午7:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="CSS/style.css">
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>Title</title>
    <Script language="javascript">
        function check1()
        {
            if(form_u.name.value=="")
            {
                alert("请添入姓名");
                form_u.name.focus();
                return false;
            }
            if(form_u.password.value=="")
            {
                alert("请添入密码");
                form_u.password.focus();
                return false;
            }
        }
    </Script>
</head>

<body>
  <form method="POST" action="login_config.jsp" name="form_u" style="margin-top: 200px" >
    <table class="table table-hover"  style="width: 300px; margin: 0 auto; font-size: 10px">
        <tr>
            <td width="32%" height="30" align="center" valign="bottom"><div align="right">用户名</div></td>
            <td width="68%" align="center" valign="bottom"><input name="name" type="text" size="16" maxlength="20" class="form-control"></td>
        </tr>
        <tr>
            <td height="30" align="center"><div align="right">密码</div></td>
            <td height="20" align="center"><input type="password" name="password" size="16" maxlength="20" class="form-control"></td>
        </tr>
        <tr>
            <td height="40" colspan="2" align="center" valign="middle" style="height: 60px">
                <input type="submit" value="提交" name="login" onClick="return check1()">
                &nbsp;<input type="reset" value="重置"><br><br>
                <button type="button" class="btn btn-default"> <a href="register.jsp">新注册</a></button>
                &nbsp;<button type="button" class="btn btn-default"><a href="found.jsp">找回密码</a></button></td>
        </tr>
    </table>
</form>

</body>
</html>
