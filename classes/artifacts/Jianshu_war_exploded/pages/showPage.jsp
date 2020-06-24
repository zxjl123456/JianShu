<%--
  Created by IntelliJ IDEA.
  User: ZXJL
  Date: 2019/11/2
  Time: 14:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>分页显示</title>
    <script type="text/javascript">
        function $(id) {
            return document.getElementById(id);
        }
        function gotoPage() {
           //获取用户输入的值
            var pn=$("pn_input").value;
            //发送新的分页请求
            window.location.href="/pageDiv?pn=pn"
        }
    </script>
    <style>
        #pn_input{
            size: 2px;
            width: 30px;
        }
    </style>
</head>
<body>
${requestScope.page}
<form action="/pageDiv" method="post">
<div>
    <c:if test="${requestScope.page==null}">
        很抱歉，小编没有找到你想要的内容~
    </c:if>
<c:if test="${requestScope.page!=null}">
    <table border="1"cellpadding="10" cellspacing="0">
    <tr><th>关键字</th><th colspan="3">内容</th></tr>
    <c:forEach items="${requestScope.page.pageData}" var="ct">
        <tr>
            <td>${ct.keywords}</td>
            <td>${ct.content}</td>
            <td><a href="">点赞</a></td>
            <td><a href="">评论</a></td>
        </tr>
    </c:forEach>
</table>
</c:if>

    <div>
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
        共${page.totalPage}页，${page.totalCount}条记录 到第<input  value="${page.pageNo}" name="pn" id="pn_input"/>页
        <input type="submit"  id="gotoPage" value="确定"/>
    </div>
</div>
</form>
</body>
</html>


<%--
<body>
${requestScope.contentList}<br/>
${requestScope.contentList[1].id}<br/>
<form action="/thumbsUp" method="post">
    <input type="hidden" name="id" value="${requestScope.contentList[0].id}"/>
    <input type="submit" value="点赞"/>,<br/>
    点赞数为：${thumbsUp}
    <c:if test="${empty requestScope.contentList}">
        很抱歉~没有你要找的内容
    </c:if>
    <c:if test="${!empty requestScope.contentList}">
        <table border="1"cellpadding="10" cellspacing="0">
            <tr>
                <th>搜索词</th>
                <th>内容</th>
            </tr>
            <c:forEach items="${requestScope.contentList}" var="ct">
                <tr>
                    <td>${ct.keywords}</td>
                    <td>${ct.content}</td>
                    <td><a href="">点赞</a></td>
                    <td><a href="">评论</a></td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
</form>
</body>--%>
