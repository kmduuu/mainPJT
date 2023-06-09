<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>야구ROUTE</title>
<meta charset="UTF-8">
<meta name="description" content="" />
<meta name="keywords" content="" />
<meta name="viewport" content="width=device-width,initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Montserrat%7COpen+Sans:700,400%7CRaleway:400,800,900" rel="stylesheet" />
<link rel="icon" href="favicon.ico" type="image/x-icon">
<link href="/css/style.min.css" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<style>

body{
	text-align:center;
}
.col-md-4 {
	margin-top: 50px;
	
}
h3, h4 {
	color: white;
}
.text-overlay {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	font-size: 6px;
	margin-left: 200px;
	/* 기타 스타일 속성 설정 */
}

button[type="button"]:hover {
	background-color: #99BEFF;
}

button[type="button"] {
	width: 30%;
	height: 45px;
	background-color: #ffffff;
	color: #000000;
	border: 1px solid #ccc;
	border-radius: 5px;
	cursor: pointer;
	font-size: 15px;
}
</style>
<script type="text/javascript">
	$(function() {
		$(".getSeats").on(
				"click",
				function() {
					var gameCode = $(this).closest(".container").find(
							"input[name='gameCode']").val();
					self.location = "/ticket/getSeats?gameCode=" + gameCode;
				});
	});
</script>
</head>
<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-L1DH7W8BRC"></script>
<script>
	window.dataLayer = window.dataLayer || [];
	function gtag() {
		dataLayer.push(arguments);
	}
	gtag('js', new Date());
	gtag('config', 'G-L1DH7W8BRC');
</script>

<body>
	<!--PLAYER SINGLE WRAP BEGIN-->
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<img class="teamTopBar" src="${game.homeTeam.teamTopBar}" width="900">
					<div class="text-overlay">
						<h3>${game.homeTeam.teamNickName} &nbsp;vs&nbsp; ${game.awayTeam.teamNickName}</h3>
						<h4>${game.gameDate} / ${game.gameTime}</h4>
					</div>
				</div>
				<div class="col-md-6">
					<div class="player-photo">
						<img src="/images/stadium/${game.homeTeam.teamCode}.png" width="400" height="400" alt="player">
					</div>
				</div>
				<div class="col-md-6">
					<div class="player-info">
						<div class="captain-bage">경기 장소</div>
						<p>${game.homeTeam.stadiumName}</p>
						<div class="captain-bage">남은 좌석</div>
						<p>${salesTicket}/ 60</p>
						<p style="color:red;">*1인 최대 4매까지 구매 가능합니다.</p>
						<p style="color:red;">*구매한 티켓은 경기시작 하루 전 23시까지 취소 가능합니다.</p>
					</div>
					<hr>
					<button type="button" class="getSeats">좌석 선택</button>
					<input type="hidden" name="gameCode" value="${game.gameCode}" />
				</div>
				<div class="col-md-12">
					<!-- <p>경기 예매 규정 안내글 ~sdafasdadfasdffasdafsdasdfasdfsfadfdaaaaaasddddddddddddddddddddddddddd~~~</p> -->
				</div>
			</div>
		</div>

	<!--PLAYER SINGLE WRAP END-->


</body>
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
