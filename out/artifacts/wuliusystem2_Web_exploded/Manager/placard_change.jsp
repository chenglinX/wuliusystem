<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="java.util.Date,java.sql.*"%>
<jsp:useBean id="connection" scope="page" class="util.JDBConnection"/>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <link rel="stylesheet" href="../CSS/style.css">
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>
        placard_show page
    </title>
</head>
<script language="javascript">
    function check()
    {
        if(form1.title.vlaue=="")
        {
            alert("����д���⣡����");
            form1.title.focus();
        }
        if(form1.content.value=="")
        {
            alert("����д���ݣ�����");
            form1.content.focus();
        }
    }
</script>
<%!
    ResultSet rs;
    String sql;
    int code;
%>
<body bgcolor="#ffffff"><jsp:include page="mtop.jsp"/>
<form method="POST" action="placard_changeConfig.jsp"name="form1">
    <table class="table table-hover"  style="width: 300px; margin: 0 auto; font-size: 10px">
        <tr>
            <td width="100%" height="39">
                <p align="center">������Ϣ�޸�</td>
        </tr>
        <%
            sql="select * from tb_Placard where ID="+request.getParameter("id");
            try
            {
                rs=connection.executeQuery(sql);
                if(rs.next())
                {
                    code=rs.getInt("ID");
        %>
        <tr>
            <td width="100%" height="37"> ���⣺
                <input type="text" name="title" size="37" value="<%=rs.getString("Title")%>"></td>
        </tr>
        <tr>
            <td width="100%" height="37"> *  ע����������������д1000����</td>
        </tr>
        <tr>
            <td width="100%" height="36">
   <textarea rows="10" name="content" cols="100">
   <%=rs.getString("Content")%></textarea></td>
        </tr>
        <tr>
            <td width="100%" height="16">  ������:
                <input type="text" name="author" size="37" value="<%=rs.getString("Author")%>">
            </td>
        </tr>
        <tr>
            <td width="100%" height="16"> ����ʱ��:
                <%=rs.getDate("IssueDate")%>
            </td>
        </tr>
        <tr>
            <td width="100%" height="16"> ���º�:
                <input type="hidden" name="id" size="37" value="<%=code%>">
            </td>
        </tr>
        <%
                }
            }catch(Exception e)
            {
                e.printStackTrace();
            }
        %>
        <tr>
            <td width="30%" height="16">
                <input type="submit" value="�޸�" name="B1"onClick="return check()">
                <input type="reset" value="��д" name="B2">
                &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                <a href="placard_select.jsp">����</a>
            </td>
        </tr>
    </table>
</form><jsp:include page="down.jsp"/>
</body>
</html>
