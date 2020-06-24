<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ZXJL
  Date: 2019/10/30
  Time: 20:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Fancy--去发现，去分享</title>
    <link rel="stylesheet" href="/css/reset.css" type="text/css">
    <link rel="stylesheet" href="/css/fancy.css" type="text/css">
    <link rel="stylesheet" href="/css/style.css" type="text/css">
    <link rel="Shortcut Icon" href="fancy.ico" type="image/x-icon">
    <meta name="keyword" content="分享，发现，社区，学习，兴趣，fancy">
    <meta name="description" content="分享，发现，社区，学习，兴趣，fancy">

</head>
<body>

<section id="banner">
    <div class="banner">
        <div class="banner-l">
            <ul>
                <li><a href="#" class="first"><img src="/images/fancyfiles/fancy.jpg" alt=""></a></li>
                <%--<li><a href="#" class="center icon-compass2">设置</a>--%>
                </li>
                <li>
                    <form action="/findContent" class="posi">
                        <input type="text" name="keywords" class="text">
                        <input type="submit" name="" value="" class="submit " id="x">
                        <span class="icon-search"></span>
                    </form>
                </li>
            </ul>
        </div>
        <c:if test="${user.userName!=null}">
            <div class="banner-r">
                <ul>
                        <%--<li><a href="" class="icon-envelop">消息</a></li>--%>
                    <li><a href="/pages/express.jsp" class="icon-quill">写作</a></li>
                    <li><a href="../pages/personal.jsp?id=${user.id}" class="icon-user-plus">个人中心</a></li>
                    <li><a href="" class=" icon-exit">退出</a></li>
                </ul>
            </div>
        </c:if>
        <c:if test="${user.userName==null}">
            <div class="banner-r">
                <ul>
                    <li><a href="../pages/login.jsp" class="lor">登录/注册</a></li>
                </ul>
            </div>
        </c:if>
    </div>
</section>
<div class="poster">
    <a href="#"><img id="poster" src="/images/fancyfiles/face.jpg" alt="face"></a>
    <img id="left" src="/images/fancyfiles/left.jpg" alt="left">
    <img id="right" src="/images/fancyfiles/right.jpg" alt="right">
</div>
<section class="major clearfix">
    <div class="major-l">
        <div class="head-l">
            <a href="" class="font1">精选</a>
            <span class="span">今日推荐</span>
        </div>
        <c:if test="${requestScope.page==null}">
            <table border="1" cellpadding="10" cellspacing="0">
                <tr>
                    <td width="800" height="200"></td>
                    <td><img width="200" height="180" src="/images/fancyfiles/23.jpg"></td>
                </tr>
                <tr>
                    <td width="800" height="200"></td>
                    <td><img width="200" height="180" src="/images/fancyfiles/2.jpg"></td>
                </tr>
                <tr>
                    <td width="800" height="200"></td>
                    <td><img width="200" height="180" src="/images/fancyfiles/3.jpg"></td>
                </tr>
                <tr>
                    <td width="800" height="200"></td>
                    <td><img width="200" height="180" src="/images/fancyfiles/4.jpg"></td>
                </tr>

            </table>
        </c:if>
        <c:if test="${requestScope.page!=null}">
            <table border="1" cellpadding="10" cellspacing="0">
                    <%--  <tr><th>关键字</th><th colspan="3">内容</th></tr>--%>
                <c:forEach items="${requestScope.page.pageData}" var="ct">
                    <tr>
                        <td width="800" height="200"><a href="/lookContent?id=${ct.id}"><span
                                style="color: deepskyblue">${ct.keywords}</span></a><br/>${ct.content}</td>
                        <td><img width="200" height="180" src="/images/fancyfiles/${ct.id%9}.jpg" alt=""></td>
                        <hr style="color: gold;size: 2px"/>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
        <div align="center">
            <a href="/pageDiv?pn=1">首页</a>
            <c:if test="${page.hasPrev}"><a href="/pageDiv?pn=${page.pageNo-1}">上一页</a></c:if>
            <c:if test="${page.totalPage<=5}">
                <c:set var="begin" value="1" scope="page"></c:set>
                <c:set var="end" value="${page.totalPage}" scope="page"></c:set>
            </c:if>
            <c:if test="${page.totalPage>5}">
                <c:if test="${page.pageNo<=3}">
                    <c:set var="begin" value="1" scope="page"></c:set>
                    <c:set var="end" value="5" scope="page"></c:set>
                </c:if>
                <c:if test="${page.pageNo}>3">

                    <c:set var="begin" value="${page.pageNo-2}" scope="page"></c:set>
                    <c:set var="end" value="${page.pageNo+2}" scope="page"></c:set>
                </c:if>
                <c:if test="${page.pageNo+2>=page.totalPage}">
                    <c:set var="begin" value="${page.totalPage-4}" scope="page"></c:set>
                    <c:set var="end" value="${page.totalPage}" scope="page"></c:set>
                </c:if>
            </c:if>
            <!--显示所有页码-->
            <c:forEach begin="${begin}" end="${end}" var="pnum">
                <c:if test="${pnum==page.pageNo}"><span style="color: red">【<c:out value="${pnum}"/>】</span></c:if>
                <c:if test="${pnum!=page.pageNo}"> <a href="/pageDiv?pn=${pnum}"><c:out value="${pnum}"/></a></c:if>
                <%--<c:out value="${pnum}"/>--%>
            </c:forEach>

            <c:if test="${page.hasNext}"><a href="/pageDiv?pn=${page.pageNo+1}">下一页</a></c:if>
            <a href="/pageDiv?pn=${page.totalPage}">末页</a>
            共${page.totalPage}页，${page.totalCount}条记录 到第<input width="30" height="20" value="${page.pageNo}" name="pn"
                                                               id="pn_input"/>页
            <input type="submit" id="gotoPage" value="确定"/>
        </div>
    </div>
    <div class="major-r">
        <div class="major-r-t">
            <div class="r-l">
                <div class="hot">
                    <a href=""><img src="/images/fancyfiles/HOT.jpg" alt="">热点话题</a>
                    <p>
                        <a href="https://www.baidu.com/s?ie=utf-8&f=8&rsv_bp=1&rsv_idx=1&tn=baidu&wd=70周年纪念日&oq=%25E7%25BB%259D%25E5%25AF%25B9%25E8%25B7%25AF%25E5%25BE%2584&rsv_pq=d428c1e7001f8519&rsv_t=b446z19yIs7f28TqP4HmxqIwY0dq1hd9%2BHeCwYC9I1%2BnLdyPezxTI5NAEnk&rqlang=cn&rsv_enter=0&rsv_dl=tb&inputT=3545958&rsv_sug3=115&rsv_sug1=97&rsv_sug7=100&rsv_sug2=0&rsv_sug4=3548780">#疫情最新#</a>
                    </p>
                    <p><a href="https://www.w3cschool.cn/group/frontend.html">#前端知识大全#</a></p>
                    <p>
                        <a href="http://www.itheima.com/special/uizly/?jingjiaqt-heima-ui-xin-pc-ui%20shejipeixun&bd_vid=7668616007176550563">#UI进阶#</a>
                    </p>
                    <p><a href="">#游戏开发与制作#</a></p>
                    <p><a href="">#APP了解#</a></p>
                </div>
            </div>
            <div class="r-r clearfix">
                <div class="fan">
                    <p>
                        <img src="/images/fancyfiles/little.jpg" alt="">
                        ${user.userName}
                    </p>
                </div>
                <div class="pen">
                    <ul>
                        <li><a href="/pages/login.jsp" class="icon-quill">写作</a></li>
                        <li><a href="/pages/login.jsp" class="icon-coin-yen">账户</a></li>
                    </ul>
                </div>
                <div class="my">
                    <ul>
                        <li><a href="" class="icon-newspaper">作品</a></li>
                        <li><a href="" class="icon-home">主页</a></li>
                        <li><a href="" class="icon-exit">退出</a></li>
                    </ul>
                </div>

            </div>
        </div>
        <div class="read">
            <div class="book">
                <ul>
                    <li><a href="" class="icon-book">书架</a></li>
                    <li><a href="" class="icon-compass">书城</a></li>
                </ul>
            </div>
            <div class="lyj">
                <a href=""><img src="/images/fancyfiles/lk.jpg" alt=""></a>
                <a href=""><img src="/images/fancyfiles/luner.jpg" alt=""></a>
            </div>
        </div>
        <div id="ad">
            <img id="gg" src="/images/fancyfiles/ggao.jpg" alt="">
            <img id="xx" src="/images/fancyfiles/x.jpg" alt="">
        </div>
    </div>
</section>
<section>
    <div class="wei">
        <a href="">关于我们</a>
        <a href="">联系我们</a>
        <a href="">加入我们</a>
        <div class="ewm">
            <img id="ewm" src="/images/fancyfiles/ewmlan.png" alt="">
            <img id="myqq" src="/images/fancyfiles/myq.jpg" alt="">
        </div>
    </div>
</section>

<script>
    window.onload = function () {
        //请求地址
       // http://localhost:8080/pageDiv?pn=1
        //重定向页面
        //window.location.href='http://www.google.com/
        //代替原来页面
       // window.location.replace("http://localhost:8080/pageDiv?pn=1");
        /* var btn=document.getElementById('x');
         btn.onclick=function () {
             alert('你点也没用！');
         }*/
        var left = document.getElementById('left');
        var right = document.getElementById('right');
        var poster = document.getElementById('poster');
        var index = 1, min = 1, max = 2;
        left.onclick = function () {
            if (index === min) {
                index = max;
            } else {
                index--;
            }
            poster.setAttribute('src', '/images/fancyfiles/' + index + '.jpg');
            console.log(poster.src);
            return false;
        }
        right.onclick = function () {
            if (index === max) {
                index = min;
            } else {
                index++;
            }
            poster.setAttribute('src', '/images/fancyfiles/' + index + '.jpg');
            console.log(poster.src);
            return false;
        }

        var xx = document.getElementById('xx');
        xx.onclick = function () {
            this.parentNode.remove();
        }
        var ewm = document.getElementById('ewm');
        var myqq = document.getElementById('myqq');
        ewm.onmouseover = function () {
            myqq.style.display = 'block';
        }
        ewm.onmouseout = function () {
            myqq.style.display = 'none';
        }
    }
</script>
</body>
</html>
