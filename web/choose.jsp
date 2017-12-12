<%--
  Created by IntelliJ IDEA.
  User: eCRF
  Date: 2017/8/29
  Time: 10:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <style type="text/css">
        .body{
            text-align: center;
            font-family: 'Source Sans Pro' sans-serif;
        }
        #top{
            margin: 0 auto;
            display: block;
            background-color: #FFC0CB;
            width: 800px;
            height: 120px;
        }
        #bottom{
            margin: 0 auto;
            display: block;
            background-color: #90EE90;
            width: 800px;
            height: 80px;
        }
        #container{
            margin: 0 auto;
            width: 800px;
            height:600px;
        }
        #right{
            text-align: center;
            display: block;
            float: left;
            width: 300px;
            height: 600px;
            background-color: aliceblue;
        }
        #left{
            text-align: center;
            display: block;
            float: left;
            width: 500px;
            height: 600px;
            background-color: aliceblue;
        }
        ul{
            box-sizing: border-box;
            position: relative;
            width: 260px;
            height: inherit;
        }
        li{
            width: 100px;
            text-align: left;
            list-style: none;
            height: 35px;
            z-index: 2;
        }
        li a{
            margin-top: 20px;
            text-decoration: none;
            color: #000000;
            border-bottom: solid #FFC0CB;
            border-bottom-width: 2px;
        }
        li a:hover{
            color: cornflowerblue;
            cursor: pointer;
        }
        li:hover .subleft{
            display: block;
        }
        .subleft{
            position: absolute;
            left: 120px;
            top: 0;
            box-shadow: 0 0 0px #DDD;
            -moz-box-shadow: 0 0 0px #DDD;
            -webkit-box-shadow: 0 0 0px #DDD;
            background-color: #FFF;
            z-index: 3;
            display: none;
            margin-left:0px;
            width: 100px;
            height: 300px;
            float: left;
            padding: 5px;
        }
        .subleft dl{
            height: 22px;
            overflow: hidden;
            border-bottom: 1px solid #d1d1d1;
            padding: 0 0;

        }
        .subleft dl dt {
            line-height: 22px;
            margin-right: 10px;
            font-weight: bold;
            color: #707070;
            font-size: 12px;
            cursor: pointer;
        }
        .subleft dl dt a {
            display: block;
            float: left;
            border-left: 1px solid #707070;
            padding: 0 5px;
            color: #707070;
            height: 14px;
            line-height: 14px;
            margin: 3px 0;
            font-size: 11px;
        }
    </style>
</head>
<body class="body">
<div id="top">

</div>
<div id="container" align="center">
    <div id="right" class="div-inline">
        <ul>
            <li><a href="#">一级菜单1</a> <span></span>
                <div class="subleft">
                    <dl>
                        <dt><a href="#">二级标题1</a></dt>
                    </dl>
                    <dl>
                        <dt><a href="#">二级标题1</a></dt>
                    </dl>
                    <dl>
                        <dt><a href="#">二级标题1</a></dt>
                    </dl>
                    <dl>
                        <dt><a href="#">二级标题1</a></dt>
                    </dl>
                </div>
            </li>
            <li><a href="#">一级菜单2</a> <span></span>
                <div class="subleft">
                    <dl>
                        <dt><a href="#">二级标题2</a></dt>
                    </dl>
                    <dl>
                        <dt><a href="#">二级标题2</a></dt>
                    </dl>
                    <dl>
                        <dt><a href="#">二级标题2</a></dt>
                    </dl>
                    <dl>
                        <dt><a href="#">二级标题2</a></dt>
                    </dl>
                </div>
            </li>
            <li><a href="#">一级菜单1</a> <span></span>
                <div class="subleft">
                    <dl>
                        <dt><a href="#">二级标题1</a></dt>
                    </dl>
                    <dl>
                        <dt><a href="#">二级标题1</a></dt>
                    </dl>
                    <dl>
                        <dt><a href="#">二级标题1</a></dt>
                    </dl>
                    <dl>
                        <dt><a href="#">二级标题1</a></dt>
                    </dl>
                </div>
            </li>
            <li><a href="#">一级菜单1</a> <span></span>
                <div class="subleft">
                    <dl>
                        <dt><a href="#">二级标题1</a></dt>
                    </dl>
                    <dl>
                        <dt><a href="#">二级标题1</a></dt>
                    </dl>
                    <dl>
                        <dt><a href="#">二级标题1</a></dt>
                    </dl>
                    <dl>
                        <dt><a href="#">二级标题1</a></dt>
                    </dl>
                </div>
            </li>
            <li><a href="#">一级菜单1</a> <span></span>
                <div class="subleft">
                    <dl>
                        <dt><a href="#">二级标题1</a></dt>
                    </dl>
                    <dl>
                        <dt><a href="#">二级标题1</a></dt>
                    </dl>
                    <dl>
                        <dt><a href="#">二级标题1</a></dt>
                    </dl>
                    <dl>
                        <dt><a href="#">二级标题1</a></dt>
                    </dl>
                </div>
            </li>
            <li><a href="#">一级菜单1</a> <span></span>
                <div class="subleft">
                    <dl>
                        <dt><a href="#">二级标题1</a></dt>
                    </dl>
                    <dl>
                        <dt><a href="#">二级标题1</a></dt>
                    </dl>
                    <dl>
                        <dt><a href="#">二级标题1</a></dt>
                    </dl>
                    <dl>
                        <dt><a href="#">二级标题1</a></dt>
                    </dl>
                </div>
            </li>
            <li><a href="#">一级菜单1</a> <span></span>
                <div class="subleft">
                    <dl>
                        <dt><a href="#">二级标题1</a></dt>
                    </dl>
                    <dl>
                        <dt><a href="#">二级标题1</a></dt>
                    </dl>
                    <dl>
                        <dt><a href="#">二级标题1</a></dt>
                    </dl>
                    <dl>
                        <dt><a href="#">二级标题1</a></dt>
                    </dl>
                </div>
            </li>
            <li><a href="#">一级菜单1</a> <span></span>
                <div class="subleft">
                    <dl>
                        <dt><a href="#">二级标题1</a></dt>
                    </dl>
                    <dl>
                        <dt><a href="#">二级标题1</a></dt>
                    </dl>
                    <dl>
                        <dt><a href="#">二级标题1</a></dt>
                    </dl>
                    <dl>
                        <dt><a href="#">二级标题1</a></dt>
                    </dl>
                </div>
            </li>
            <li><a href="#">一级菜单1</a> <span></span>
                <div class="subleft">
                    <dl>
                        <dt><a href="#">二级标题1</a></dt>
                    </dl>
                    <dl>
                        <dt><a href="#">二级标题1</a></dt>
                    </dl>
                    <dl>
                        <dt><a href="#">二级标题1</a></dt>
                    </dl>
                    <dl>
                        <dt><a href="#">二级标题1</a></dt>
                    </dl>
                </div>
            </li>
            <li><a href="#">一级菜单1</a> <span></span>
                <div class="subleft">
                    <dl>
                        <dt><a href="#">二级标题1</a></dt>
                    </dl>
                    <dl>
                        <dt><a href="#">二级标题1</a></dt>
                    </dl>
                    <dl>
                        <dt><a href="#">二级标题1</a></dt>
                    </dl>
                    <dl>
                        <dt><a href="#">二级标题1</a></dt>
                    </dl>
                </div>
            </li>
            <li><a href="#">一级菜单1</a> <span></span>
                <div class="subleft">
                    <dl>
                        <dt><a href="#">二级标题1</a></dt>
                    </dl>
                    <dl>
                        <dt><a href="#">二级标题1</a></dt>
                    </dl>
                    <dl>
                        <dt><a href="#">二级标题1</a></dt>
                    </dl>
                    <dl>
                        <dt><a href="#">二级标题1</a></dt>
                    </dl>
                </div>
            </li>
            <li><a href="#">一级菜单1</a> <span></span>
                <div class="subleft">
                    <dl>
                        <dt><a href="#">二级标题1</a></dt>
                    </dl>
                    <dl>
                        <dt><a href="#">二级标题1</a></dt>
                    </dl>
                    <dl>
                        <dt><a href="#">二级标题1</a></dt>
                    </dl>
                    <dl>
                        <dt><a href="#">二级标题1</a></dt>
                    </dl>
                </div>
            </li>
            <li><a href="#">一级菜单1</a> <span></span>
                <div class="subleft">
                    <dl>
                        <dt><a href="#">二级标题1</a></dt>
                    </dl>
                    <dl>
                        <dt><a href="#">二级标题1</a></dt>
                    </dl>
                    <dl>
                        <dt><a href="#">二级标题1</a></dt>
                    </dl>
                    <dl>
                        <dt><a href="#">二级标题1</a></dt>
                    </dl>
                </div>
            </li>
            <li><a href="#">一级菜单1</a> <span></span>
                <div class="subleft">
                    <dl>
                        <dt><a href="#">二级标题1</a></dt>
                    </dl>
                    <dl>
                        <dt><a href="#">二级标题1</a></dt>
                    </dl>
                    <dl>
                        <dt><a href="#">二级标题1</a></dt>
                    </dl>
                    <dl>
                        <dt><a href="#">二级标题1</a></dt>
                    </dl>
                </div>
            </li>
            <li><a href="#">一级菜单1</a> <span></span>
                <div class="subleft">
                    <dl>
                        <dt><a href="#">二级标题1</a></dt>
                    </dl>
                    <dl>
                        <dt><a href="#">二级标题1</a></dt>
                    </dl>
                    <dl>
                        <dt><a href="#">二级标题1</a></dt>
                    </dl>
                    <dl>
                        <dt><a href="#">二级标题1</a></dt>
                    </dl>
                </div>
            </li>
            <li><a href="#">一级菜单1</a> <span></span>
                <div class="subleft">
                    <dl>
                        <dt><a href="#">二级标题1</a></dt>
                    </dl>
                    <dl>
                        <dt><a href="#">二级标题1</a></dt>
                    </dl>
                    <dl>
                        <dt><a href="#">二级标题1</a></dt>
                    </dl>
                    <dl>
                        <dt><a href="#">二级标题1</a></dt>
                    </dl>
                </div>
            </li>
            <li><a href="#">一级菜单1</a> <span></span>
                <div class="subleft">
                    <dl>
                        <dt><a href="#">二级标题1</a></dt>
                    </dl>
                    <dl>
                        <dt><a href="#">二级标题1</a></dt>
                    </dl>
                    <dl>
                        <dt><a href="#">二级标题1</a></dt>
                    </dl>
                    <dl>
                        <dt><a href="#">二级标题1</a></dt>
                    </dl>
                </div>
            </li>
        </ul>
    </div>
    <div id="left" class="div-inline">
        <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="500px" height="300px">
            <param name="movie" value="viewer.swf">
            <param name="quality" value="high">
            <embed src="viewer.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="500px" height="300px"></embed>
        </object>
    </div>
</div>
<div id="bottom">

</div>
</body>
</html>
