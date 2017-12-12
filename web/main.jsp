<%@ page language="java" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>main</title>
    <!-- CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/blog.css" rel="stylesheet">
</head>
<body>
<div class="blog-masthead">
    <div class="container">
        <nav class="blog-nav">
            <a class="blog-nav-item active" href="demo.action">首页</a>
            <a class="blog-nav-item" href="#part1">生活</a>
            <a class="blog-nav-item" href="#part2">旅行</a>
            <a class="blog-nav-item" href="#part3">到处逛</a>
        </nav>
    </div>
</div>
<div class="intr">
    <span class="avtar"></span>
    <p class="peointr">我叫Marco 欢迎来到我的博客 这个博客和技术无关</p>
    <p class="peointr">爱生活，爱旅行，爱自己</p>
</div>
<div class="title" id="part1">爱生活</div>
<div class="content">
    <div class="pic pic1">
        <img src="images/xiu12.jpg" alt="">
        <p>杭州</p>
    </div>
    <div class="pic pic2">
        <img src="images/xiu12.jpg" alt="">
        <p>杭州</p>
    </div>
    <div class="pic pic3">
        <img src="images/xiu12.jpg" alt="">
        <p>杭州</p>
    </div>
</div>
<div class="title" id="part2">爱旅行</div>
<div class="content">
    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner" role="listbox">
            <div class="item active">
                <img src="images/tou2.jpg" alt="...">
            </div>
            <div class="item">
                <img src="images/tou2.jpg" alt="...">
            </div>
            <div class="item">
                <img src="images/tou2.jpg" alt="...">
            </div>
        </div>
        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
</div>
<div class="title" id="part3">到处逛</div>
<div class="content">
    <div id="main" style="height:500px"></div>
</div>
<div class="blog-footer">
    <p>by <a href="http://blog.csdn.net/baidu_24598621/article/details/75626711">Marco</a>.</p>
</div>
<a href="" class="btt">顶部</a>
<!-- Js-->
<script src="js/jquery-1.9.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/plugin.js"></script>
<script src="dist/echarts.js"></script>
<script src="dist/china.js" charset="gbk"></script>
<script>
    var chart = echarts.init(document.getElementById('main'));
    chart.setOption({
        series: [{
            type: 'map',
            map: 'china'
        }]
    });
    chart.on('click', function (params) {
        var city = params.name;
        console.log(params.name);
        var url="chooseaction.action?";
        var urlArr = [
            'id=1',
            'id=2',
            'id=3',
            'id=4',
            'id=5',
            'id=6',
            'id=7',
            'id=8',
            'id=9',
            'id=10',
            'id=11',
            'id=12',
            'id=13',
            'id=14',
            'id=15',
            'id=16',
            'id=17',
            'id=18',
            'id=19',
            'id=20',
            'id=21',
            'id=22',
            'id=23',
            'id=24',
            'id=25',
            'id=26',
            'id=27',
            'id=28',
            'id=29',
            'id=30',
            'id=31',
            'id=32',
            'id=33'
        ];
        if(params.name=='新疆'){
            //id=1
            location.href =url+ urlArr[0];
        }
        if(params.name=="西藏"){
            location.href =url+ urlArr[1];
        }
        if(params.name=='青海'){
            location.href =url+ urlArr[2];
        }
        if(params.name=="甘肃"){
            location.href =url+ urlArr[3];
        }
        if(params.name=='内蒙古'){
            location.href = url+ urlArr[4];
        }
        if(params.name=="宁夏"){
            location.href = url+ urlArr[5];
        }
        if(params.name=='云南'){
            location.href = url+ urlArr[6];
        }
        if(params.name=="四川"){
            location.href = url+ urlArr[7];
        }
        if(params.name=="陕西"){
            location.href = url+ urlArr[8];
        }
        if(params.name=="广西"){
            location.href = url+ urlArr[9];
        }
        if(params.name=="贵州"){
            location.href =url+ urlArr[10];
        }
        if(params.name=="重庆"){
            location.href = url+ urlArr[11];
        }
        if(params.name=="山西"){
            location.href = url+ urlArr[12];
        }
        if(params.name=="河南"){
            location.href = url+ urlArr[13];
        }
        if(params.name=="湖北"){
            location.href = url+ urlArr[14];
        }
        if(params.name=="湖南"){
            location.href = url+ urlArr[15];
        }
        if(params.name=="广东"){
            location.href =url+ urlArr[16];
        }
        if(params.name=="海南"){
            location.href =url+ urlArr[17];
        }
        if(params.name=="江西"){
            location.href =url+ urlArr[18];
        }
        if(params.name=="安徽"){
            location.href =url+ urlArr[19];
        }
        if(params.name=="山东"){
            location.href =url+ urlArr[20];
        }
        if(params.name=="河北"){
            location.href =url+ urlArr[21];
        }
        if(params.name=="北京"){
            location.href =url+ urlArr[22];
        }
        if(params.name=="天津"){
            location.href =url+ urlArr[23];
        }
        if(params.name=="辽宁"){
            location.href =url+ urlArr[24];
        }
        if(params.name=="吉林"){
            location.href =url+ urlArr[25];
        }
        if(params.name=="黑龙江"){
            location.href =url+ urlArr[26];
        }
        if(params.name=="江苏"){
            location.href =url+ urlArr[27];
        }
        if(params.name=="上海"){
            location.href =url+ urlArr[28];
        }
        if(params.name=="浙江"){
            location.href =url+ urlArr[29];
        }
        if(params.name=="福建"){
            location.href =url+ urlArr[30];
        }
        if(params.name=="台湾"){
            location.href =url+ urlArr[31];
        }
        if(params.name=="香港"){
            location.href =url+ urlArr[32];
        }
    });
</script>
</body>
</html>
