<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<title>야구ROUTE</title>
	<meta charset="UTF-8">
	<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-regular-rounded/css/uicons-regular-rounded.css'>
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-solid-rounded/css/uicons-solid-rounded.css'>
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-solid-rounded/css/uicons-solid-rounded.css'>
	<link href="https://fonts.googleapis.com/css?family=Montserrat%7COpen+Sans:700,400%7CRaleway:400,800,900" rel="stylesheet" />
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <link href="/css/style.min.css" rel="stylesheet" type="text/css" />
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    
   <style type="text/css">
   	div, a{
   		font-family:"Gwangyang" !important;
   	}
    	.background {
		  display: flex;
		  justify-content: center;
		  align-items: center;
		  margin-top: 50px;
		}
	  .wrap {
	    display: flex;
	    align-items: center;
	  }
	  .wrap > * {
	    margin-right: 10px;
	  }		
	  .wrap label {
	    width: 70px; /* 원하는 크기로 지정 */
	    height: 50px;
	    margin-top: 5px;
	    display: inline-block;
	  }	  
		.sidebar{
			position: sticky;
		    top: 100px;
		    right: 300px;
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
		section.h1{
			display:flex;
			justify-content:center;
		}
		h1{
		color: white;
		position: relative;
  		z-index: 9900;
		font-family:"Gwangyang";
		}
		.row-align {
	    display: flex;
	    align-items: center;
	  }
		//따라다니는 퀵메뉴
		div, ul, li {-webkit-box-sizing: border-box;-moz-box-sizing: border-box;box-sizing: border-box;padding:0;margin:0}
		a {text-decoration:none;}
		.quickmenu {position:absolute;width:50px;top:70%;margin-top:-70px;right:10px;background:#fff;}
		.quickmenu ul {position:relative;float:left;width:100%;display:inline-block;*display:inline;border:1px solid #ddd;}
		.quickmenu ul li {float:left;width:100%;border-bottom:1px solid #ddd;text-align:center;display:inline-block;*display:inline;}
		.quickmenu ul li a {position:relative;float:left;width:100%;height:50px;line-height:50px;text-align:center;color:#999;font-size:9.5pt;}
		.quickmenu ul li a:hover {color:#000;}
		.quickmenu ul li:last-child {border-bottom:0;}
		.content {position:relative;min-height:1000px;}		
		.quickmenu .submenu {display: none;}
		
		#back-img {
		  position: fixed;
		  width: 100%;
		  height: 100vh;
		  overflow: hidden;
		}
	  
	  .row-offcanvas {
	    background-color: rgba(217, 217, 217, 0.8); /* 흰색 배경과 투명도 조절 */
	  }
	  i.fi-sr-heart {
	  		color:#ff0000;
	  }
	  .fa-2x,div.comment-quantity{
	  		font-size:17px !important;
	  }	  
	  
	 </style>
    
    <script type="text/javascript">
    //따라다니는 퀵메뉴
	$(document).ready(function(){
		var currentPosition = parseInt($(".quickmenu").css("top"));
		$(window).scroll(function() {
	   	var position = $(window).scrollTop(); 
	   	$(".quickmenu").stop().animate({"top":position+currentPosition+"px"},700);
	  	});
		
	  	$('.quickmenu li a[href="#back"]').click(function(e) {
			history.back();
	 	});
	  	
	  	$('.quickmenu li a[href="#forward"]').click(function(e) {
		   history.forward();
	 	});
	});
	//따라다니는 퀵메뉴 끝
	
    function fncGetPostList(currentPage){
			$("#currentPage").val(currentPage);
			$("form").attr("method" ,"GET").attr("action" , "/post/getMyPostList").submit();
	 }
    
    $(function(){
    	var teamCode = "${teamCode}";
    	var MyTeamCode = "${user.teamCode}";
		console.log(teamCode);
		
	    	$( "td:nth-child(3)" ).on("click" , function() {
	    		 self.location ="/post/getPost?postNo="+$(this).siblings("td:nth-child(1)").text();
	    	});
	    	$( "i.fa.fa-search").on("click" , function() {
				fncGetPostList(1);
			});
			
			//#태그 핸들러
			$("a[href='teamCodeHref']").on('click',function(){
	    		teamCode = $(this).find("input[name='foreachTeamCode']").val()
	    		self.location = "/post/getPostList?teamCode="+teamCode;
		   });
			$("a.talk").on("click",function(){
				self.location = "/post/getPostList?postType=0&teamCode="+teamCode;
			});
			$("a.cheer").on("click",function(){
				self.location = "/post/getPostList?postType=1&teamCode="+teamCode;
			});
			$("a.buy").on("click",function(){
				self.location = "/post/getPostList?postType=2&teamCode="+teamCode;
			});
			$("a.sell").on("click",function(){
				self.location = "/post/getPostList?postType=3&teamCode="+teamCode;
			});
		   $("a.getPost").on('click',function(){
			   postNo = $(this).siblings("input[name='postNo']").val()
			   self.location = "/post/getPost?postNo="+postNo;
		   });
		   $("a.getPostList").on('click',function(){
			   self.location = "/post/getPostList?teamCode="+teamCode;
		   });
		   $("a.getMyPostList").on('click',function(){
			   self.location = "/post/getMyPostList";
		   });
		   $("a.getBestList").on('click',function(){
			   self.location = "/post/getBestList?teamCode="+teamCode;
		   });
		   $("a.getNoticeList").on('click',function(){
			   self.location = "/post/getNoticeList?teamCode="+teamCode;
		   });
    })
    
    $(function(){
    		$("a.addPostView").on('click',function(){
    			window.open("/post/addPostView.jsp","게시물 작성",'width=1000,height=700');
		   });
    })

   </script>
	
</head>
<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-L1DH7W8BRC"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'G-L1DH7W8BRC');
</script>

<body>
<jsp:include page="/common/topBar.jsp"/>


<section class="image-header" style="min-height: 0px;height: 0px;">
	<div class="row">
		<div class="col-md-12" >
           	<img id="back-img" src="/images/background/background1.jpg" alt="img">
        </div>	
	</div>
</section>

<section class="h1">
	<h1>내가 쓴 게시물</h1>
</section>
<!--CONTENT BEGIN-->
<div class="content">
    <div class="container">
        <div class="row row-offcanvas row-offcanvas-left">

<!--NEWS LIST BEGIN-->
<div class="news-list col-xs-12 col-md-12">
    <p class="hidden-md hidden-lg">
        <button type="button" class="btn sidebar-btn" data-toggle="offcanvas" title="Toggle sidebar">sidebar</button>
    </p>
    <c:forEach var="post" items="${list}">
	    <div class="item">
	        <div class="info">
	        		<div class="row row-align">
	        		<div class="col-md-1.5">
	        			<div class="tags">
	            		<c:choose>
								<c:when test="${post.postType == '0'}"><a>잡담</a></c:when>
								<c:when test="${post.postType == '1'}"><a>응원</a></c:when>
								<c:when test="${post.postType == '2'}"><a>중고구매</a></c:when>
								<c:when test="${post.postType == '3'}"><a>중고판매</a></c:when>
								<c:when test="${post.postType == '4'}"><a>공지사항</a></c:when>
							</c:choose>
	            	</div>
	            </div>
	            <div class="col-md-10.5">
		        		<h5>
		        		<input type="hidden" name="postNo" value="${post.postNo}">
		            <a href="javascript:;" class="getPost">
		            ${post.postTitle}
		            </a>	
		            </h5>
		         </div>
		      	</div>
	            <div class="wrap">
	            	<fmt:parseDate value="${post.postDate}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
					  <fmt:formatDate value="${parsedDateTime}" pattern="yyyy년 MM월 dd일 hh시 mm분" var="DateTime"/>
	                <a href="news-single.html">${DateTime}</a> by <a href="news-single.html">${post.user.userNickName}</a>
	                <img src="${post.user.userImage}" style="width:30px;">
	        		</div>
	    			<p>${post.postContents}</p>
	            <input type="hidden" name="postNo" value="${post.postNo}">
	            <a href="javascript:;"  class="getPost">Continue Reading</a>
	            <div class="comment-quantity">${post.postViews} Views</div>
	            <div class="comment-quantity">${post.postLikes} <i class="fi fi-sr-heart fa-2x"></i> &nbsp;&nbsp;</div>
	            <div class="comment-quantity">${post.postComments} <i class="fi fi-rr-comment-alt"></i> &nbsp;&nbsp;</div>
	        </div>
	    </div>
    </c:forEach>
    <c:if test="${not empty resultPage}">
		<!-- PageNavigation Start... -->
		<jsp:include page="../common/pageNavigator_all.jsp">
		<jsp:param name="id" value="post" />
		</jsp:include>
		<!-- PageNavigation End... -->
    </c:if>
</div>
<!--NEWS LIST END-->

        </div>
    </div>
</div>
<!--CONTENT END-->

<!-- 퀵메뉴 -->
<div class="quickmenu">
  <ul>
    <li><a href="#top"><span class="glyphicon glyphicon-chevron-up" aria-hidden="true"></span></a></li>
    <li><a href="#bottom"><span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span></a></li>
    <li><a href="#back"><span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span></a></li>
    <li><a href="#forward"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span></a></li>
  </ul>
</div>     

<form>
    <input type="hidden" id="currentPage" name="currentPage" value="" />
 </form>

<jsp:include page="/common/quickMenu.jsp"/>
 	
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