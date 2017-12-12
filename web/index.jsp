<!doctype html>
<html lang="zh">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>index</title>

  <link rel="stylesheet" type="text/css" href="css/styles.css">

</head>
<style>
  .demo{
    width: 220px;
    height: 220px;
    margin: 100px auto 0 auto;
    background: no-repeat url("images/zj.jpg") left top;
    -webkit-background-size: 220px 220px;
    background-size: 220px 220px;
    -webkit-border-radius: 110px;
    border-radius: 110px;
    -webkit-transition: -webkit-transform 2s ease-out;
    -moz-transition: -moz-transform 2s ease-out;
    -ms-transition: -ms-transform 2s ease-out;
  }
  .demo:hover{
    -webkit-transform: rotateZ(360deg);
    -moz-transform: rotateZ(360deg);
    -ms-transform: rotateZ(360deg);
    transform: rotateZ(360deg);
  }

</style>
<body>

<div class="wrapper" id="wrapper">
  <div class="container">
    <div class="demo"></div>
    <h1>Welcome</h1>
  </div>

  <ul class="bg-bubbles">
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
  </ul>

</div>

<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
<script type="text/javascript">
    var wrapper=document.getElementById('wrapper');
    wrapper.addEventListener('click',function(){
        window.location.href="demo.action";
    });
</script>

</body>
</html>