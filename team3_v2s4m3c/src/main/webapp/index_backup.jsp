<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>서울여행</title>
 
<link href="./css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
<script type="text/javascript">
</script>
<style>
* {
  box-sizing: border-box;
  margin:0px;
  padding:0px;
}
.header {
  background-color: #f1f1f1;
  padding: 30px;
  text-align: left;
  margin-top:30px;
  font-size: 35px;
}
.column {
  float: left;
  width: 25%;
  padding: 10px;
  height: 300px; /* Should be removed. Only for demonstration */
}
.row:after {
  content: "";
  display: table;
  clear: both;
}

.footer {
  background-color: #f1f1f1;
  padding: 10px;
  text-align: center;
}

@media (max-width: 600px) {
  .column {
    width: 100%;
  }
}
   ul,li{list-style:none;}
    .slide{height:400px;overflow:hidden;}
    .slide ul{width:calc(100% * 4);display:flex;animation:slide 12s infinite;} 
    .slide li{width:calc(100% / 4);height:400px;}
    .slide li:nth-child(1){background:#ffff0;}
    .slide li:nth-child(2){background:#faa;}
    .slide li:nth-child(3){background:#afa;}
    .slide li:nth-child(4){background:#aaf;}
    @keyframes slide {
      0% {margin-left:0;} 
      10% {margin-left:0;} 
      25% {margin-left:-100%;} 
      35% {margin-left:-100%;}
      50% {margin-left:-200%;}
      60% {margin-left:-200%;}
      75% {margin-left:-300%;}
      85% {margin-left:-300%;}
      100% {margin-left:0;}
    }

</style>
</head>


<body>

<DIV class='container-fluid'>

  <div class="row" style='height: 30px; background-color:#efeff5;'>
    <div class="col-md-9">
      로고자리
    </div>
      <div class="col-md-3" style='text-align:center; margin-top:5px;'>
          <span class="glyphicon glyphicon-user"> 회원가입  /</span>
          <span class="glyphicon glyphicon-log-in"> 로그인</span>
    </div> 
  </div>
  <!-- toptop -->

  
<nav class="navbar-default" style="margin-top:20px;">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">서율서율</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">상품 <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">여행지</a></li>
            <li><a href="#">맛집</a></li>
            <li><a href="#">훔ㅁㅁ</a></li>
          </ul>
        </li>
        <li><a href="#">설문조사</a></li>
        <li><a href="#">예약문의</a></li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">고객센터 <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">1:1문의</a></li>
            <li><a href="#">몰랑</a></li>
          </ul>
        </li>
      </ul>

    </div>
  </div>
</nav>
    <!-- 상단메뉴 →

<div class="slide" style="margin:0px auto;">
    <ul>
      <li></li>
      <li></li>
      <li></li>
      <li></li>
    </ul>
  </div>

    <!-- 이미지 넘기는거 --> 
<!-- 알가서 추천  1-->
<div class="row">
  <div class="col-md-12" style="font-size:40px; text-align:left; height:60px; margin-left:50px; margin-bottom:60px; margin-top:50px;">
    여행지 / 숙박  
  </div>
</div>


<div class="row"  style="background-color:  #e0e0eb;">

    <div class="col-md-2">
    
      </div>
    
    
    <div class="col-md-2" style="margin:10px auto; ">
      <div class="thumbnail" >
        <a href="/w3images/fjords.jpg" target="_blank">
          <img src="./css/images/logo.png" alt="Fjords" style="width:100%">
          <div class="caption" style="text-decoration: none;">
            <p>Lorem ipsum donec id elit non mi porta gravida at eget metus.</p>
          </div>
        </a>
      </div>
    </div>

    <div class="col-md-2" style="margin:10px auto;">
      <div class="thumbnail" >
        <a href="/w3images/fjords.jpg" target="_blank">
          <img src="./css/images/logo.png" alt="Fjords" style="width:100%">
          <div class="caption" style="text-decoration: none; text-align:center;">
            <p>호호호</p>
          </div>
        </a>
      </div>
    </div>
    
    <div class="col-md-2" style="margin:10px auto;">
      <div class="thumbnail" >
        <a href="/w3images/fjords.jpg" target="_blank">
          <img src="./css/images/logo.png" alt="Fjords" style="width:100%">
          <div class="caption" style="text-decoration: none;">
            <p>Lorem ipsum donec id elit non mi porta gravida at eget metus.</p>
          </div>
        </a>
      </div>
    </div>
    
        <div class="col-md-2" style="margin:10px auto;">
      <div class="thumbnail" >
        <a href="/w3images/fjords.jpg" target="_blank">
          <img src="./css/images/logo.png" alt="Fjords" style="width:100%">
          <div class="caption" style="text-decoration: none;">
            <p>Lorem ipsum donec id elit non mi porta gravida at eget metus.</p>
          </div>
        </a>
      </div>
    </div>
    
    <div class="col-md-2">
    
      </div>
    
    
  </div>
  
  <!--맛집추천2  -->
  <div class="row">
  <div class="col-md-12" style="font-size:40px; text-align:left; height:60px; margin-left:50px; margin-bottom:60px; margin-top:50px;">
    맛집 추천 
  </div>
</div>


<div class="row"  >

    <div class="col-md-2">
    
      </div>
    
    
    <div class="col-md-2" style="margin:10px auto; ">
      <div class="thumbnail" >
        <a href="/w3images/fjords.jpg" target="_blank">
          <img src="./css/images/logo.png" alt="Fjords" style="width:100%">
          <div class="caption" style="text-decoration: none;">
            <p>Lorem ipsum donec id elit non mi porta gravida at eget metus.</p>
          </div>
        </a>
      </div>
    </div>

    <div class="col-md-2" style="margin:10px auto;">
      <div class="thumbnail" >
        <a href="/w3images/fjords.jpg" target="_blank">
          <img src="./css/images/logo.png" alt="Fjords" style="width:100%">
          <div class="caption" style="text-decoration: none;">
            <p>Lorem ipsum donec id elit non mi porta gravida at eget metus.</p>
          </div>
        </a>
      </div>
    </div>
    
    <div class="col-md-2" style="margin:10px auto;">
      <div class="thumbnail" >
        <a href="/w3images/fjords.jpg" target="_blank">
          <img src="./css/images/logo.png" alt="Fjords" style="width:100%">
          <div class="caption" style="text-decoration: none;">
            <p>Lorem ipsum donec id elit non mi porta gravida at eget metus.</p>
          </div>
        </a>
      </div>
    </div>
    
        <div class="col-md-2" style="margin:10px auto;">
      <div class="thumbnail" >
        <a href="/w3images/fjords.jpg" target="_blank">
          <img src="./css/images/logo.png" alt="Fjords" style="width:100%">
          <div class="caption" style="text-decoration: none;">
            <p>Lorem ipsum donec id elit non mi porta gravida at eget metus.</p>
          </div>
        </a>
      </div>
    </div>
    
    <div class="col-md-2">
    
      </div>
    
    
  </div>
  
  <!-- 여행지추천 -->
  <div class="row">
  <div class="col-md-12" style="font-size:40px; text-align:left; height:60px; margin-left:50px; margin-bottom:60px; margin-top:50px;">
    알가서 추천  
  </div>
</div>


<div class="row"  style="background-color:  #e0e0eb;">

    <div class="col-md-2">
    
      </div>
    
    
    <div class="col-md-2" style="margin:10px auto; ">
      <div class="thumbnail" >
        <a href="/w3images/fjords.jpg" target="_blank">
          <img src="./css/images/logo.png" alt="Fjords" style="width:100%">
          <div class="caption" style="text-decoration: none;">
            <p>Lorem ipsum donec id elit non mi porta gravida at eget metus.</p>
          </div>
        </a>
      </div>
    </div>

    <div class="col-md-2" style="margin:10px auto;">
      <div class="thumbnail" >
        <a href="/w3images/fjords.jpg" target="_blank">
          <img src="./css/images/logo.png" alt="Fjords" style="width:100%">
          <div class="caption" style="text-decoration: none;">
            <p>Lorem ipsum donec id elit non mi porta gravida at eget metus.</p>
          </div>
        </a>
      </div>
    </div>
    
    <div class="col-md-2" style="margin:10px auto;">
      <div class="thumbnail" >
        <a href="/w3images/fjords.jpg" target="_blank">
          <img src="./css/images/logo.png" alt="Fjords" style="width:100%">
          <div class="caption" style="text-decoration: none;">
            <p>Lorem ipsum donec id elit non mi porta gravida at eget metus.</p>
          </div>
        </a>
      </div>
    </div>
    
        <div class="col-md-2" style="margin:10px auto;">
      <div class="thumbnail" >
        <a href="/w3images/fjords.jpg" target="_blank">
          <img src="./css/images/logo.png" alt="Fjords" style="width:100%">
          <div class="caption" style="text-decoration: none;">
            <p>Lorem ipsum donec id elit non mi porta gravida at eget metus.</p>
          </div>
        </a>
      </div>
    </div>
    
    <div class="col-md-2">
    
      </div>
    
    
  </div>


 <!-- 화면 하단 메뉴 --> 
  <DIV style='text-align: center; margin-top:250px;'>
    <hr>
<h2>여긴뭐하징?-?</h2>
    
  </DIV>

</DIV> <!--container DIV  -->
</body> 
</html>
 
