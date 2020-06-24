<%--
  Created by IntelliJ IDEA.
  User: ZXJL
  Date: 10/17/2019
  Time: 9:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<html>
<head>
    <title>发表</title>
</head>
<body>
<form action="/express" method="post">
    <input type="text" name="keywords" placeholder="要发表的关键字"/><br/>
    <input type="text" name="content" placeholder="要发表的内容"/><br/>
    <input type="submit" value="发表"/>
</form>
<br/>
发表内容如下：${content.content}
</body>
</html>--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Fsncy--Text</title>
    <link rel="stylesheet" href="../css/reset.css" type="text/css">
    <link rel="stylesheet" href="../css/style.css" type="text/css">
    <link rel="Shortcut Icon" href="fancy.ico" type="image/x-icon">
    <link rel="stylesheet" href="../css/text.css" type="text/css">
</head>
<body>
<section id="banner">
    <div class="banner">
        <div class="banner-l">
            <ul>
                <li><a href="#" class="first"><img src="../images/fancyfiles/fancy.jpg" alt=""></a></li>
                <%--<li><a href="" class="center icon-compass2">设置</a></li>--%>
            </ul>
        </div>
        <div class="banner-r">
            <ul>
                <li><a href="fancy.jsp" class="icon-home">主页</a></li>
                <li ><a href="/pages/express.jsp" class="icon-quill">写作</a></li>
                <li><a href="../pages/personal.jsp" class="icon-user-plus">个人中心</a></li>
                <li><a href="" class=" icon-exit">退出</a></li>
            </ul>
        </div>
    </div>
</section>
<form action="/express" method="post">
<section id="text">
    <div class="fan">
        <ul class="y">
            <li ><a class="x" href="./fancy.jsp">返回首页</a></li>
            <li >  <img src="../images/fancy%20files/little.jpg" alt="">
                凡人且梦多</li>
            <li ><input class="x" type="submit" value="发表文章"></li>
        </ul>
    </div>
    <div class="input">
        <input type="text" placeholder="请输入标题" name="keywords" >
    </div>
    <div>
        <textarea name="content" id="textarea" cols="30" rows="10"  placeholder="请输入内容"></textarea>
    </div>
</section>
</form>
</body>
</html>