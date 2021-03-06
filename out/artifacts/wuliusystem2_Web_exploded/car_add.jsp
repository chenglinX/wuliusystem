<%@ page contentType="text/html; charset=gb2312" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="CSS/style.css">
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>
        Goods page
    </title>
</head>
<Script language="javascript">
    function check()
    {
        if(form1.gclass.value=="")
        {
            alert("请填写货物类型！！");
            form1.gclass.focus();
            return false;
        }
        if(form1.gname.value=="")
        {
            alert("请填写货物名称！！！");
            form1.gname.focus();
            return false;
        }
        if(form1.gcount.value=="")
        {
            alert("请填写货物数量！！！");
            form1.gcount.focus();
            return false;
        }
        if(form1.gunit.value=="")
        {
            alert("请填写货物数量单位！！！");
            form1.gunit.focus();
            return false;
        }
        if(form1.startProvince.value=="")
        {
            alert("请填写起始省份！！！");
            form1.startProvince.focus();
            return false;
        }
        if(form1.gstartcity.value=="")
        {
            alert("请填写起始城市！！！");
            form1.gstartcity.focus();
            return false;
        }
        if(form1.endProvince.value=="")
        {
            alert("请填写抵达省份！！！");
            form1.endProvince.focus();
            return false;
        }
        if(form1.gendcity.value=="")
        {
            alert("请填写抵达城市！！！");
            form1.gendfirm.focus();
            return false;
        }
        if(form1.gtransstyle.value=="")
        {
            alert("请填写运输类型！！！");
            form1.gtransstyle.focus();
            return false;
        }
        if(form1.gtime.value=="")
        {
            alert("请填写运输时间！！！");
            form1.gtime.focus();
            return false;
        }
        if(form1.glink.value=="")
        {alert("请填写联系人！！！");
            form1.glink.focus();
            return false;
        }
        if(form1.gphone.value=="")
        {
            alert("请填写联系电话！！！");
            form1.gphone.focus();
            return false;
        }
        if(form1.gremark.value=="")
        {
            alert("请填写备注！！！");
            form1.gremark.focus();
            return false;
        }
        if(form1.grequest.value=="")
        {
            alert("请填写要求！！！");
            form1.grequest.focus();
            return false;
        }
    }
</Script>
<body bgcolor="#ffffff">

<jsp:include page="top.jsp"/>
<p align="center"><b>车辆信息发布</b></p>
<form method="POST" action="car_config.jsp" name="form1">
    <table class="table table-hover"  style="width: 800px; margin: 0 auto; font-size: 13px">
        <tr>
            <td>
                <p align="center">车辆号码：</p>      </td>
            <td >
                <p align="center"><input type="text" name="Code" size="20" class="form-control"></p>
            </td>
            <td>
                <p align="center">车辆品名：</p>
            </td>
            <td>
                <p align="center"><input type="text" name="TradeMark" size="20" class="form-control"></p>
            </td>
        </tr>
        <tr>
            <td width="20%" height="42">
                <p align="center">类型：</p>      </td>
            <td width="36%" height="42">
                <p align="center"><input type="text" name="Brand" size="20" class="form-control"></p>
            </td>
            <td width="18%" height="42">
                <p align="center">已使用：</p>
            </td>
            <td width="30%" height="42">
                <p align="center"><input type="text" name="UsedTime" size="20" class="form-control"></p>
            </td>
        </tr>
        <tr>
            <td width="20%" height="43">
                <p align="center">司机驾龄：</p>      </td>
            <td width="36%" height="43">
                <p align="center"><input type="text" name="LinkPhone" size="20" class="form-control"></p>
            </td>
            <td width="18%" height="43">
                <p align="center">联系电话：</p>
            </td>
            <td width="30%" height="43">
                <p align="center"><input type="text" name="gstartcity" size="20" class="form-control"></p>
            </td>
        </tr>

        <tr>
            <td width="20%" height="74">
                <p align="center">要求：</p>
            </td>
            <td width="84%" height="74" colspan="3">
                <p align="left"><textarea rows="5" name="Remark" cols="72"  class="form-control"></textarea></p>
            </td>
        </tr>
        <tr>
            <td width="786" height="58" colspan="4">
                <p align="center">
                    <button type="button" class="btn btn-default"> <input type="submit" name="show" value="发布" onClick="return check()"> </button>
                    <button type="button" class="btn btn-default"> <input type="reset" name="reset" value="重置"></button> &nbsp;&nbsp;
                    <button type="button" class="btn btn-default"><a href="goods_select.jsp">返回</a></button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
