<%--
  Created by IntelliJ IDEA.
  User: ZXJL
  Date: 2019/10/15
  Time: 18:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>注册</title>
    <script type="text/javascript">
        function $(id) {return document.getElementById(id);}
        function  test() {
            var userName = $("input1").value;
            var userPassword = $("input2").value;
            var rePassword = $("input3").value;
            alert("获取表单数据");
            var regUserName = /^[a-zA-Z][a-zA-Z0-9_]{4,15}$/;
            var regPassWord = /^[0-9]{5,17}$/;
            var regEmail = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$ /;
            //用户名不合法
            if (!regUserName.test(userName)) {
                alert("用户名不合法")
                return false;
            }
            //密码不合法
            if (!regPassWord.test(userPassword)) {
                alert("密码不合法");
                return false;
            }
            //密码不一致
            if (userPassword != rePassword) {
                alert("俩次密码不一致");
                return false;
            }
        }
    </script>

</head>
<body>
<form action="/register" method="post">
    用户名：<input type="text" id="input1" name="userName" placeholder="请输入用户名" /><br/>
    密码：<input type="text" id="input2"name="userPassword" placeholder="请输入密码"/><br/>
    确认密码：<input type="text" id="input3"name="rePassword" placeholder="确认密码"><br/>
    <input type="submit" id="sub-btn" value="注册" onclick="test()"/><br/>
</form>
${user.userName}${user.userMsg}
</body>
</html>
