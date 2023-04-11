<!-- 작업자 : 김남훈 -->
<!-- 작업내용 : 교회약도 예배시간 -->
<!-- 최근 수정 내역 : map이 잘 안되서 이걸로 옮김 예배시간 추가해야됨 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"/>
	<title>오시는 길</title>
<!-- <link rel="stylesheet" href ="resources/css/map.css" type="text/css"> -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=91966b94c8dcb08be4fe8c7e60e81bb2"></script>
<style>
#map{
width: 100%;
height: 400px;
margin: 0 auto;
board:1px solid light grey;
border-radius: 10px;
box-shadow: 1px 1px 2px 4px grey;
}

@font-face {
    font-family: 'NanumSquareNeo-Variable';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}

.map_title{
text-align: center;
}


.map_title h1{
font-family: "NanumSquareNeo-Variable";
font-weight: bold;
text-decoration: underline overline;
text-underline-position : under;
text-decoration-color : #0288d1;
}

.map-container {
margin : 0 auto;
margin-top : 30px;
width: 80%;
}

.map-container h2{
font-family: "TAEBAEKmilkyway";
color: #0288d1;
font-weight: bold;
}

.map-container p{
color: #808080;
font-family : "TAEBAEKmilkyway";
font-size: 20px;
font-weight: bold;
}
</style>
</head>
<body>

	<div class="map_title">
	<h1>약도</h1>
	<hr>
    <div id="map"></div>
    </div>
	<div class="map-container">
		<h2>계정교회</h2><hr>
		<p>주소 : 경기도 양평군 양동면 양서북로 490 <p>	
		<p>전화번호 : 010-1234-1234</p>
		<hr>
		<br>
		<h2>예배시간</h2>
		<hr>
</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=91966b94c8dcb08be4fe8c7e60e81bb2"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.4546, 127.7707), // 지도의 중심좌표
        level: 1 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
var zoomControl = new kakao.maps.ZoomControl();
map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

// 지도가 확대 또는 축소되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'zoom_changed', function() {        
    
    // 지도의 현재 레벨을 얻어옵니다
    var level = map.getLevel();
    
    
});

var markerPosition  = new kakao.maps.LatLng(37.4546, 127.7707); 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

</script>
</body>
</html>