<%--
  Created by IntelliJ IDEA.
  User: ZXJL
  Date: 2019/10/15
  Time: 18:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<html>
<head>
    <meta charset="UTF-8">
    <title>登录</title>
</head>

<body>
<form action="/login" method="post">
 用户名：<input type="text" name="userName" placeholder="请输入用户名" /><br/>
    密码：<input type="text" name="userPassword" placeholder="请输入密码"/>
    <input type="submit" name="sub-btn" value="登录"/><br/>
</form>
${userMsg}
</body>
</html>--%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Fancy--login</title>
    <link rel="stylesheet" href="../css/reset.css" type="text/css">
    <link rel="stylesheet" href="../css/style.css" type="text/css">
    <link rel="Shortcut Icon" href="fancy.ico" type="image/x-icon">
    <link rel="stylesheet" href="../css/login.css" type="text/css">
</head>
<body>
<%--抬头已注释--%>
<%--<section id="banner">
    <div class="banner">
        <div class="banner-l">
            <ul>
                <li><a href="#" class="first"><img src="images/fancy files/fancy.jpg" alt=""></a></li>
                <li><a href="" class="center icon-compass2">设置</a></li>
            </ul>
        </div>
        <div class="banner-r">
            <ul>
                <li><a href="" class="icon-envelop">消息</a></li>
                <li><a href="" class="icon-user-plus">关注</a></li>
                <li><a href="" class=" icon-spinner9">阅读记录</a></li>
            </ul>
        </div>
    </div>
</section>--%>
<section id="login">
    <div  class="login-h">
        <span id='x1' class="li on">登录</span>
        <span id='x2' class="li">注册</span>
    </div>
    <div  class="login-b">
        <div class="dom1" style="display: block">
            <form action="/login">
                <div class="s1"><h4>帐号</h4>
                    <input type="text" name="userName" placeholder="帐号" ></div>
                <div class="s1"><h4>密码</h4>
                    <input type="password" name="userPassword" placeholder="8-32位数字或字母"></div>
                <div class="s2"><input type="checkbox"><span>记住密码</span></div>
                <input type="submit" name="submit" value="登 录" class="login-s">
            </form>
            <div class="s3">
                <a href="">忘记密码</a>
                <span>| 还没帐号？</span>
                <a href="register.jsp">立即注册</a>
            </div>
            <div class="s4">
                <p>社交账号登录</p>
                <img src="images/fancy files/wechatqq.png" alt="">
            </div>
        </div>
        <div  class="dom2" style="display: none" >
            <form action="/register">
                <div class="s1"><h4>手机号</h4>
                    <input type="text" name="userId" placeholder="帐号" ></div>
                <div class="s1"><h4>用户名</h4>
                    <input type="text" name="userName" placeholder="用户名" ></div>
                <div class="s1"><h4>密码</h4>
                    <input type="password" name="userPassword" placeholder="8-32位数字或字母"></div>
                <div class=" s1 ">
                    <h4>短信验证码</h4>
                    <input type="password">
                    <input type="button" value="发送验证码">
                </div>
                <input type="submit" name="submit" value="注册" class="login-s">
            </form>
            <div class="s4">
                <p>社交账号登录</p>
                <img src="images/fancy files/wechatqq.png" alt="">
            </div>
        </div>
    </div>
    ${userMsg}
</section>
<script>
    window.onload=function () {
        var li1=document.getElementById('x1');
        var li2=document.getElementById('x2');
        var dom1=document.getElementsByClassName('dom1')[0];
        var dom2=document.getElementsByClassName('dom2')[0];

        li1.onclick=function () {
            li2.className='li';
            dom2.style.display='none';
            li1.className='on';
            dom1.style.display='block';
        }
        li2.onclick=function () {
            li1.className='li';
            dom1.style.display='none';
            li2.className='on';
            dom2.style.display='block';
        }
    }
</script>
</body>
</html>