<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="description" content="" />
	<meta name="keywords" content="" />
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>야구ROUTE</title>
	<link href="https://fonts.googleapis.com/css?family=Montserrat%7COpen+Sans:700,400%7CRaleway:400,800,900" rel="stylesheet" />
	<!-- <link rel="icon" href="favicon.ico" type="image/x-icon"> -->
	<link href="/css/style.min.css" rel="stylesheet" type="text/css" />
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	
	<script type="text/javascript">
		$(function() {
			$('button:contains("확인")').on('click', function(){
				window.close();
			})
		});
	</script>
</head>
<body>
	<section class="checkout-wrap">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h4>채널 정보</h4>
				</div>
				
				<div class="customer-info">
					<div class="col-md-6">
						
						<div class="item">
							<lable>
								<span>
									채널 아이디
								</span>
								${channel.channelID}
							</lable>
						</div>
						
						<div class="item">
							<lable>
								<span>
									채널 이름
								</span>
								${channel.channelName}
							</lable>
						</div>
						
						<div class="item">
							<lable>
								<span>
									녹화본 경로
								</span>
								${channel.bucketName}/${channel.uploadPath}
							</lable>
						</div>
						
						<div class="item">
							<lable>
								<span>
									스트림키
								</span>
								${channel.streamKey}
							</lable>
						</div>
						
						<div class="item">
							<lable>
								<span>
									스트림 URL
								</span>
								${channel.streamURL}
							</lable>
						</div>
						
						<div class="item">
							<lable>
								<span>
									스트리밍 주소
								</span>
								${channel.channelCDN}
							</lable>
						</div>
						
					</div>
				</div>
				
			</div>
			
			<div class="row">
				<div class="col-md-12 text-right">
					<button class="btn small">확인</button>
				</div>
			</div>
		</div>

		
	</section>
	
	
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
</body>
</html>