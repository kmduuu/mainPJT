<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팀 정보</title>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=s5i3dw6edg"></script>
<link href="https://fonts.googleapis.com/css?family=Montserrat%7COpen+Sans:700,400%7CRaleway:400,800,900" rel="stylesheet" />
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <link href="/css/style.min.css" rel="stylesheet" type="text/css" />
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <style type="text/css">
    	.background {
		  display: flex;
		  justify-content: center;
		  align-items: center;
		  margin-top: 50px;
		   margin-bottom: 50px;
    	}
    	.text-center{
    		text-align: center !important;
    		font-size: 15px !important;
    		font-weight: 700;
    	}
    	.table-css td{
    		font-size: 16px !important;
    		font-weight: 550 !important;
    		font-family: 'Gwangyang';
    	}
    	.table-css th{
    		font-size: 15px !important;
    		font-weight: 550 !important;
    		font-family: 'Gwangyang';
    	}
    	.text-overlay {
		  position: absolute;
		  top: 50%;
		  left: 50%;
		  transform: translate(-50%, -50%);
		  font-size: 18px;
		  margin-left:400px;
		}
		.teamTopBar {
		  width: 100%;
		  height: auto;
		}
		.image-container {
		  position: relative;
		  display: inline-block;
		  width: 100%;
		}
		h1,h2,h3,h4,h5,h6{
			color: ${teamInfo.teamColor};
		}
    </style>
</head>
<body>
<jsp:include page="/common/loading.jsp"/>
<jsp:include page="/common/topBar.jsp"/>
<section class="image-header">
    <div class="image-container">
	  <img class="teamTopBar" src="${teamInfo.teamTopBar}">
	  <div class="text-overlay"><h1 style="color: white;">${teamInfo.teamFullName}</h1></div>
	</div>
</section>
<div class="mathc-live-broadcasts background">
		<div class="broadcast-tabs-wrapper">
	            <ul class="nav nav-tabs" role="tablist">
	            <c:forEach var="team" items="${allTeam}">
	            	<c:if test="${team.teamCode ne 'ALL'}">
		                <li class="${team.teamCode eq teamCode ?'active':''}" role="presentation">
		                <a href="teamCodeHref" role="tab" data-toggle="tab">
			                <img alt="img" src="${team.teamEmblem}">
			                <span class="info">
			                	<span class="title">${team.teamNickName}</span>
			                	<input type="hidden" value="${team.teamCode}"/>
			                </span> 
		                </a>
		                </li>
		        	</c:if>
	            </c:forEach>
	            </ul>
	        </div>
</div>
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="text-center"><h1>${teamInfo.teamFullName}</h1></div>
				<div class="col-md-4">
					<div><h4>Emblem</h4></div>
					<div><img src="${teamInfo.teamEmblem}" width="320" height="300"></div>
				</div>
				<div class="col-md-8">
					<div><h4>Introduce</h4></div>
					<div class="text"> ${teamInfo.teamIntroduce}</div>
				</div>
				<div class="col-md-8">
					<div><h4>Hometown - ${teamInfo.hometown}<br><br><br>Homepage - <a href="${teamInfo.teamHomepage}">${teamInfo.teamFullName} 홈페이지 바로가기</a></h4></div>
				</div>
				<div class="col-md-12" style="margin-top: 0px; ">
					<h4 id="nowYear" style="padding-top: 0px;"></h4>
					<table class="table-standings" style="margin-bottom: 0px;">
		                        <tr class="table-css">
		                        	<th>현재순위</th>
		                        	<th>경기</th>
		                        	<th>승리</th>
		                        	<th>무승부</th>
		                        	<th>패배</th>
		                        	<th>승률</th>
		                        	<th>지난 10경기</th>
		                        </tr>
		                        <tr class="table-css">
		                        	<td>${teamInfo.teamRanking}위</td>
		                        	<td>${teamInfo.endGameCount}</td>
		                        	<td>${teamInfo.winCount}</td>
		                        	<td>${teamInfo.tieCount}</td>
		                        	<td>${teamInfo.loseCount}</td>
		                        	<td>${teamInfo.winRate}</td>
		                        	<td>${teamInfo.lastTenMatch}</td>
		                        </tr>
		                    </table>
				
				</div>
				<div class="col-md-12 col-sm-12">
	            	<div class="cart-total">
	                    <button class="proceed text-center" id="goTicket" style="margin-top: 0px;margin-bottom: 50px;">티켓 예매하러 가기<i class="fa fa-check" aria-hidden="true"></i></button>
	                </div>
            	</div>
				
				<div class="col-md-12">
					<div><h4>Stadium</h4></div>
					<div style="text-align: center;"><h5>${teamInfo.stadiumName}</h5></div>
					<div><img width="100%" height="800px" src="${teamInfo.stadiumImageFile}" alt="stadium-img"></div>
				</div>
		</div>
	</div>
</div>


<div class="container">
	<div class="row">
		<div class="col-md-12" style="justify-content: center;">
			<div style="text-align: center; padding-top: 50px;"><h5 class="player-name">${teamInfo.stadiumName} 위치 정보</h5></div>
			<div><p class="text">주소 : ${teamInfo.stadiumAddress}</p></div>
			<div id="wrap" class="section" style="padding-bottom: 100px;">
				<div id="map" style="width: 100%; height: 500px;" class="buttons"></div>
			</div>
		</div>
	</div>
</div>

</body>
<jsp:include page="/common/quickMenu.jsp"/>
<script type="text/javascript">
	$(function(){
		initMap();
		
		var today = new Date();
		var currentYear = today.getFullYear().toString();
		$("#nowYear").html(currentYear + '시즌');
		
		$("#goTicket").on("click",function(){
			self.location = "/ticket/getGameList2w?teamCode=${teamInfo.teamCode}";
		})
	})
	function initMap(){
		
		$("a[href='teamCodeHref']").on('click',function(){
			self.location = "/game/getTeam?teamCode="+$(this).find(".info input").val();
	    })
		
		let map = new naver.maps.Map('map',{
			center : new naver.maps.LatLng(${teamInfo.stadiumLat},${teamInfo.stadiumLng})
		})
		
		let marker = new naver.maps.Marker({
			map: map,
			title : "${teamInfo.stadiumName}",
			position: new naver.maps.LatLng(${teamInfo.stadiumLat},${teamInfo.stadiumLng})
		})
		
		let infoWindow = new naver.maps.InfoWindow({
			content:'<div><div style="margin-left:20px;margin-right:20px;margin-bottom:30px;">'+
				'<div style="text-align:center;"><h6>${teamInfo.stadiumName}</h6></div>'+
				'<div><img style="width:30px;height:30px;" src="${teamInfo.teamEmblem}">${teamInfo.teamNickName} 홈구장</div>'+
				'<div><p class="text">주소 : ${teamInfo.stadiumAddress}</p></div>'+
				'<div><a href="${teamInfo.teamHomepage}">홈페이지 바로가기</a></div>'+
			'<div></div>'
		})
		
		infoWindow.open(map,marker);
	}
</script>
<script type="text/javascript" src="/js/library/jquery.js"></script>
<script type="text/javascript" src="/js/library/jquery-ui.js"></script>
<script type="text/javascript" src="/js/library/bootstrap.js"></script>
<script type="text/javascript" src="/js/library/jquery.sticky.js"></script>
<script type="text/javascript" src="/js/library/jquery.jcarousel.js"></script>
<script type="text/javascript" src="/js/library/jcarousel.connected-carousels.js"></script>
<script type="text/javascript" src="/js/library/owl.carousel.js"></script>
<script type="text/javascript" src="/js/library/progressbar.js"></script>
<script type="text/javascript" src="/js/library/jquery.bracket.min.js"></script>
<script type="text/javascript" src="/js/library/chartist.js"></script>
<script type="text/javascript" src="/js/library/Chart.js"></script>
<script type="text/javascript" src="/js/library/fancySelect.js"></script>
<script type="text/javascript" src="/js/library/isotope.pkgd.js"></script>
<script type="text/javascript" src="/js/library/imagesloaded.pkgd.js"></script>

<script type="text/javascript" src="/js/jquery.team-coundown.js"></script>
<script type="text/javascript" src="/js/matches-slider.js"></script>
<script type="text/javascript" src="/js/header.js"></script>
<script type="text/javascript" src="/js/matches_broadcast_listing.js"></script>
<script type="text/javascript" src="/js/news-line.js"></script>
<script type="text/javascript" src="/js/match_galery.js"></script>
<script type="text/javascript" src="/js/main-club-gallery.js"></script>
<script type="text/javascript" src="/js/product-slider.js"></script>
<script type="text/javascript" src="/js/circle-bar.js"></script>
<script type="text/javascript" src="/js/standings.js"></script>
<script type="text/javascript" src="/js/shop-price-filter.js"></script>
<script type="text/javascript" src="/js/timeseries.js"></script>
<script type="text/javascript" src="/js/radar.js"></script>
<script type="text/javascript" src="/js/slider.js"></script>
<script type="text/javascript" src="/js/preloader.js"></script>
<script type="text/javascript" src="/js/diagram.js"></script>
<script type="text/javascript" src="/js/bi-polar-diagram.js"></script>
<script type="text/javascript" src="/js/label-placement-diagram.js"></script>
<script type="text/javascript" src="/js/donut-chart.js"></script>
<script type="text/javascript" src="/js/animate-donut.js"></script>
<script type="text/javascript" src="/js/advanced-smil.js"></script>
<script type="text/javascript" src="/js/svg-path.js"></script>
<script type="text/javascript" src="/js/pick-circle.js"></script>
<script type="text/javascript" src="/js/horizontal-bar.js"></script>
<script type="text/javascript" src="/js/gauge-chart.js"></script>
<script type="text/javascript" src="/js/stacked-bar.js"></script>

<script type="text/javascript" src="/js/library/chartist-plugin-legend.js"></script>
<script type="text/javascript" src="/js/library/chartist-plugin-threshold.js"></script>
<script type="text/javascript" src="/js/library/chartist-plugin-pointlabels.js"></script>

<script type="text/javascript" src="/js/treshold.js"></script>
<script type="text/javascript" src="/js/visible.js"></script>
<script type="text/javascript" src="/js/anchor.js"></script>
<script type="text/javascript" src="/js/landing_carousel.js"></script>
<script type="text/javascript" src="/js/landing_sport_standings.js"></script>
<script type="text/javascript" src="/js/twitterslider.js"></script>
<script type="text/javascript" src="/js/champions.js"></script>
<script type="text/javascript" src="/js/landing_mainnews_slider.js"></script>
<script type="text/javascript" src="/js/carousel.js"></script>
<script type="text/javascript" src="/js/video_slider.js"></script>
<script type="text/javascript" src="/js/footer_slides.js"></script>
<script type="text/javascript" src="/js/player_test.js"></script>

<script type="text/javascript" src="/js/main.js"></script>
</html>