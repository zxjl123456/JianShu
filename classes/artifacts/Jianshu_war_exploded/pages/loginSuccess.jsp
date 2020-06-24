<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: ZXJL
  Date: 2019/10/16
  Time: 20:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录成功</title>
</head>
<body>
<p style="color: red">欢迎${user.userName}登录！</p>
编辑个人资料：
<!--使用form标签快速开发出表单标签    并进行表单数据回显-->
<form:form action="/editInformation" method="post" modelAttribute="user">
    <input type="hidden" name="id" value="${user.id}"/><br/>
    用户名：<form:input path="userName"/><br/>
    性别：<form:input path="gender"/><br/>
    年龄：<form:input path="age"/><br/>
    邮箱：<form:input path="email"/><br/>
    <input type="submit" value="保存"/>
</form:form>
${user.userMsg}
</body>
</html>
