<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ZXJL
  Date: 2019/10/31
  Time: 17:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>fancy--read</title>
    <link rel="stylesheet" href="../css/reset.css" type="text/css">
    <link rel="stylesheet" href="../css/style.css" type="text/css">
    <link rel="Shortcut Icon" href="fancy.ico" type="image/x-icon">
    <link rel="stylesheet" href="../css/read.css" type="text/css">
</head>
<body>
<section id="banner">
    <div class="banner">
        <div class="banner-l">
            <ul>
                <li><a href="#" class="first"><img src="../images/fancyfiles/fancy.jpg" alt=""></a></li>
            </ul>
        </div>
    </div>
</section>
<section id="read">
    <div class="r-body ">
        <div class="content-h" style="display: block">
            <div class="content-h-r" style="display: block">
                <img  src="../images/fancyfiles/little.jpg" alt="头像"/>${user.userName}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">+关注</a>
            </div>
            <div class="content-h-l">
            <h3 align="center">${content.keywords}</h3>
            </div>
        </div>
        <%-- <div class="r-b"><h4 align="center">${content.keywords}</h4></div>--%>
        <div class="content-b">
            <textarea id="fabiao">
                ${content.content}
            </textarea>
        </div>
        <div class="content-thumbsup">
            <a href="" class="icon-bubble"><span></span></a>
            <a href="/thumbsUp?id=${content.id}" class="icon-heart"><span>1</span></a>
            <%--${content.thumbsUp}--%>
            <a href="" class="icon-share2"><span>666</span></a>
        </div>
        <div class="remark">
            <form action="/comment" method="post">
                <input type="hidden" name="contentId" value="${content.id}"/>
                <input type="hidden" name="userId" value="${user.id}"/>
                <input type="text" class="p1" placeholder="评论..."/>
                <input id="comment" class="p2" type="submit" value="评论"/>
            </form>
        </div>
        <div class="comment-b">
            <c:if test="${empty requestScope.comments}">
                还没有评论哦~
            </c:if>
            <c:if test="${!empty requestScope.comments}">
                <table >
                        <%--  <tr><th>关键字</th><th colspan="3">内容</th></tr>--%>
                    <c:forEach items="${requestScope.comments}" var="cm">
                        <tr>
                            <td><p><span style="color: #0099ff">【zxjl】</span></p>
                                <p>${cm.comment}</p></td>
                        </tr>
                    </c:forEach>
                </table>
            </c:if>
        </div>
    </div>
    <%--<div class="author">
        <div class="fan">
            <p>
                <img src="../images/fancyfiles/little.jpg" alt="头像">
                ${user.userName}
                <a href="">+关注</a>
            </p>
        </div>
        <div class="focus">
            <span>Ta的作品</span> <a href="">+关注</a>
        </div>
    </div>--%>
</section>
<script type="text/javascript">
    document.getElementById("comment").onmouseover(function () {
      alert("请先登录！")
    });

</script>
</body>
</html>