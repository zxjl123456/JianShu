<%--
  Created by IntelliJ IDEA.
  User: ZXJL
  Date: 2020/4/28
  Time: 11:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="main">
<head>
    <meta charset="UTF-8">
    <%--引入外部css样式文件--%>
    <link rel="stylesheet" type="text/css" href="../css/personal.css"/>
    <link rel="stylesheet" type="text/css" href="../css/style.css">
    <link rel="stylesheet" type="text/css" href="../css/fancy.css">
    <link rel="stylesheet" type="text/css" href="../css/text.css">
    <link rel="stylesheet" type="text/css" href="../css/read.css">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>personalCenter</title>
    <script src="https://cdn.staticfile.org/vue/2.4.2/vue.min.js"></script>
    <script src="https://cdn.staticfile.org/vue-resource/1.5.1/vue-resource.min.js"></script>
</head>
<body>
<div id="main">
    <div class="top-toolbar">
        <%--<div class="top-l">
            <ul>
                <li><a href="#" class="first"><img src="../images/fancyfiles/fancy.jpg" alt=""></a></li>
                &lt;%&ndash;<li><a href="" class="center icon-compass2">设置</a></li>&ndash;%&gt;
            </ul>
        </div>
        <div class="top-r">--%>
            <a href="#" class="first"><img src="../images/fancyfiles/fancy.jpg" alt=""></a>
            <ul>
                <li><a href="fancy.jsp?user=${user}" class="icon-home">主页</a></li>
                <li ><a href="#" class="icon-envelop">信息</a></li>
                <li><a href="shouye.jsp" class=" icon-exit">退出</a></li>
            </ul>
    </div>

    <div class="left_container">
        <table class="tab-editInfo-left">
            <tr class="tr_pl"><td></td><td></td></tr>
            <tr class="tr_pl"><td><a><img class="testIcon" src="../images/fancyfiles/little.jpg"></a></td><td><a href="#">zxjl</a></td></tr>
            <tr class="tr_pl"><td><a href="fancy.jsp" class="icon-home">主页</a></td></tr>
            <tr class="tr_pl"><td><a id="bt_fan" class="icon-user-plus">关注</a></td></tr>
            <tr class="tr_pl"><td><a id="bt_edit" class="center icon-compass2">编辑个人资料</a></td></tr>
            <tr class="tr_pl"><td><a id="bt_collect" class="icon-spinner9">我的收藏</a></td></tr>
            <tr class="tr_pl"><td><a id="bt_express" class="icon-newspaper">我的作品</a></td></tr>
        </table>
    </div>
    <div class="right_container">
        <div id="edit-b" style="display:none">
            <form action="/editInformation" method="post">
                <table class="tab-editInfo-right">
                    <tr class="tr_edit"><td colspan="2"><h3 align="center">个人资料</h3></td></tr>
                    <tr><td><input type="hidden" name="id" value=${user.id}></td></tr>
                    <tr class="tr_edit"><td>昵&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称：<input class="input-edit" type="text" name="userName"/></td></tr>
                    <tr class="tr_edit"><td>个性签名：<input class="input-edit" type="text" name="gxqm" /></td></tr>
                    <tr class="tr_edit"><td>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：<input class="input-edit" type="text" name="gender" /></td></tr>
                    <tr class="tr_edit"><td>年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;龄：<input class="input-edit" type="number" name="age"/></td></tr>
                    <tr class="tr_edit"><td>专&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;业：<input class="input-edit" type="text" name="zy"/></td></tr>
                    <tr class="tr_edit"><td >20-<input class="input-edit" type="number" name="nj" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;届</td></tr>
                    <tr class="tr_edit"><td><input width="40px" height="30px" type="submit" align="center" value="保存"/></td></tr>
                    <tr class="tr_edit"><td>${user.userMsg}</td></tr>
                </table>
            </form>
        </div>
        <div id="fan-b"  style="display: block">
            <table class="table-fan">
                <tr><td><button id="td-fan" style="background-color: #a8dce0;border: none;width: 120px;height: 30px" class="btg" onclick="showFan()">我的关注</button></td>
                    <td><button id="td-faned" style="background-color: #a8dce0;border: none;width: 120px;height: 30px" class="btg" onclick="showFaned()">粉丝</button></td></tr>
            </table>
            <div id="div-fan" style="display: block">
                <table class="table-fan">
                    <tr><td class="td-imag"><img class="testIcon" src="/images/fancyfiles/testImage.jpg"></td><td><a href="#">眼里有星星</a></td></tr>
                    <tr><td class="td-imag"><img class="testIcon" src="/images/fancyfiles/testImage.jpg"></td><td><a href="#">月色真美</a></td></tr>
                    <tr><td class="td-imag"><img class="testIcon" src="../images/fancyfiles/testImage.jpg"></td><td><a href="#">微凉伴夏</a></td></tr>
                    <tr><td class="td-imag"><img class="testIcon" src="../images/fancyfiles/testImage.jpg"></td><td><a href="#">lisa</a></td></tr>
                    <tr><td class="td-imag"><img class="testIcon" src="../images/fancyfiles/testImage.jpg"></td><td><a href="#">暖阳春草</a></td></tr>
                </table>
            </div>
            <div id="div-faned" style="display: none">
                <table class="table-fan">
                    <tr><td class="td-imag"><img class="testIcon" src="../images/fancyfiles/testImage.jpg"></td><td><a href="#">lisa</a></td></tr>
                    <tr><td class="td-imag"><img class="testIcon" src="../images/fancyfiles/testImage.jpg"></td><td><a href="#">小叮当</a></td></tr>
                    <tr><td class="td-imag"><img class="testIcon" src="../images/fancyfiles/testImage.jpg"></td><td><a href="#">微凉伴夏</a></td></tr>
                    <tr><td class="td-imag"><img class="testIcon" src="../images/fancyfiles/testImage.jpg"></td><td><a href="#">月色真美</a></td></tr>
                    <tr><td class="td-imag"><img class="testIcon" src="../images/fancyfiles/testImage.jpg"></td><td><a href="#">暖阳春草</a></td></tr>
                </table>
            </div>
        </div>
        <div id="collect-b" style="display: none">
            <table class="table-collect">
                <tr><td colspan="2"><h3 align="center">我的收藏</h3></td></tr>
                <tr><td><a href="#">岁月如棋局局新</a></td></tr>
                <tr><td><a href="#">断桥残雪</a></td></tr>
                <tr><td><a href="#">时光似水点点逝</a></td></tr>
                <tr><td><a href="#">计算机</a></td></tr>
                <tr><td><a href="#">剪一窗岁月寄语明天</a></td></tr>
            </table>
        </div>
        <div id="express-b" style="display: none">
            <table class="table-collect">
                <tr><td colspan="2"><h3 align="center">我的发表</h3></td></tr>
                <tr><td><a href="#">出发吧，少年</a></td></tr>
                <tr><td><a href="#">发女儿们的恋爱</a></td></tr>
                <tr><td><a href="#">周末</a></td></tr>
                <tr><td><a href="#">开学</a></td></tr>
                <tr><td><a href="#">hello</a></td></tr>
            </table>
        </div>
    </div>
    <div class="bottom_container">
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
    </div>
</div>
<script>
    window.onload=function () {
        //控制右侧区域的显示内容
        var div_edit=document.getElementById('edit-b');
        var div_fan=document.getElementById('fan-b');
        var div_collect=document.getElementById('collect-b');
        var div_express=document.getElementById('express-b');
        var bt_edit=document.getElementById('bt_edit');
        var bt_fan=document.getElementById('bt_fan');
        var bt_collect=document.getElementById('bt_collect');
        var bt_express=document.getElementById('bt_express');
        //var fan_head=document.getElementById("fan-head");
        bt_edit.onclick=function () {
            div_edit.style.display='block';
            div_fan.style.display='none';
            div_collect.style.display='none';
            div_express.style.display='none';
        }
        bt_fan.onclick=function () {
            div_fan.style.display='block';
            div_edit.style.display='none';
            div_collect.style.display='none';
            div_express.style.display='none';
        }
        bt_collect.onclick=function () {
            div_collect.style.display='block';
            div_fan.style.display='none';
            div_edit.style.display='none';
            div_express.style.display='none';
        }
        bt_express.onclick=function () {
            div_express.style.display='block';
            div_fan.style.display='none';
            div_collect.style.display='none';
            div_edit.style.display='none';
        }
    }
    //显示我的关注页面
    function showFan() {
        //var td_fan=document.getElementById("td-fan");
        var div_fan=document.getElementById("div-fan");
        var div_faned=document.getElementById("div-faned");
        div_fan.style.display='block';
        div_faned.style.display='none';
    }
    //显示关注我的页面
    function showFaned() {
        //var td_faned=document.getElementById("td-faned");
        var div_fan=document.getElementById("div-fan");
        var div_faned=document.getElementById("div-faned");
        div_faned.style.display='block';
        div_fan.style.display='none';
    }
    var xx=document.getElementById('xx');
    xx.onclick=function () {
        this.parentNode.remove();
    }
</script>
</body>
</html>