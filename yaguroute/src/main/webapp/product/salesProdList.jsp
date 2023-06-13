<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>

<head>

	<meta charset="UTF-8">
	<meta name="description" content="" />
    <meta name="keywords" content="" />
    <meta name="viewport" content="width=device-width,initial-scale=1">
	<title>salesProdList</title>
	<link href="https://fonts.googleapis.com/css?family=Montserrat%7COpen+Sans:700,400%7CRaleway:400,800,900" rel="stylesheet" />
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <link href="/css/style.min.css" rel="stylesheet" type="text/css" />
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
   
   
<script type="text/javascript">
    function fncGetSalesProdList(currentPage) {
        $("#currentPage").val(currentPage);
        $("form").attr("method", "GET").attr("action", "/product/salesProdList")
        .submit();
    }

    $(function() {
        $("a[href='teamCodeHref']").on('click', function() {
            teamCode = $(this).find("input[name='teamCode']").val();
            self.location = "/product/salesProdList?prodTeamCode=" + teamCode;    
        });
        
		$("button.btn.btn-default").on("click", function() {
			fncGetSalesProdList(1);
		});
    });
    
	 $( function() {
		 
		 $.ajax(
	 				{
	 					url: "/product/json/autoComplete",
	 					method: "GET",
	 					dataType: "json",
	 					headers: {
	 						"Accept" : "application/json",
							"Content-Type" : "application/json"						
	 					},
	 					success: function(JSONData, status) {
	
	 						
	 					console.log(JSONData);
	 					
	 				    $( "#autoComplete" ).autocomplete({
	 					      source: JSONData
	 					    });
	 				
	 					}
	 					
	 				});
			 });
					
    
</script>
</head>

<body>

		<!-- ToolBar Start /////////////////////////////////////-->
				<jsp:include page="/common/topBar.jsp"/>
		<!-- ToolBar End /////////////////////////////////////-->

		<form name="detailForm">

			<div class="mathc-live-broadcasts background" style="display: flex; justify-content: center;">
			    <div class="broadcast-tabs-wrapper">
			        <ul class="nav nav-tabs" role="tablist">
			            <c:forEach var="team" items="${allTeam}">
			                <li class="${team.teamCode eq teamCode ?'active':''}" role="presentation">
			                    <a href="teamCodeHref" role="tab" data-toggle="tab">
			                        <img alt="img" src="${team.teamEmblem}">
			                        <span class="info">
			                            <span class="title">${team.teamNickName}</span>
			                            <input type="hidden" name="teamCode" value="${team.teamCode}"/>
			                        </span> 
			                    </a>
			                </li>
			            </c:forEach>
			        </ul>
			    </div>
			</div>

	<div class="container">
		<div class="page-header text-info">
			<div class="row">
			<div style="width: 98%; margin-left: 10px; margin-top: 20px;">
			
			        <!-- Search -->
					<div class="search-container">
						<div class="form-group" style="width: 100px;">
							<select class="form-control" name="searchCondition">
								<option value="0" ${!empty search.searchCondition && search.searchCondition == 0 ? "selected" : ""}>상품명</option>
							</select>
						</div>
						<div class="form-group" style="width: 230px;">
							<input type="text" class="form-control"  id="autoComplete" 	name="searchKeyword" placeholder="상품명으로 검색하세요"
								value="${!empty search.searchKeyword ? search.searchKeyword : ''}"> </div>

						<button type="button" class="btn btn-default">검색</button>
						<p class="text" style="font-family: 'Montserrat', sans-serif; ">전체 ${resultPage.totalCount} 건, 현재 ${resultPage.currentPage} 페이지</p>
					</div>
				<!-- Search -->

						<input type="hidden" id="prodTeamCode" name="prodTeamCode" value="${prodTeamCode}" /> 
						<input type="hidden" id="currentPage" name="currentPage" value="" />				
    <!--STORE WRAP BEGIN-->
		    <div class="store-wrap">
		        <div class="container">
		            <div class="row row-offcanvas row-offcanvas-left">
		                <div class="sidebar col-xs-6 col-sm-6 col-md-3 sidebar-offcanvas" id="sidebar">
		                    <div class="filter-wrap">
		                 </div>
		                </div>
		                <div class="col-md-12">
		                    <h6>${product.prodTeamCode}</h6>
		                    <div class="row">
		                           <c:forEach var="product" items="${list}">
		                        <div class="col-md-4 col-sm-6">
		                            <div class="store-list-item">         
		                                <div>
		                                    <a href="/product/getProduct?prodNo=${product.prodNo}">
		                                        <img src="/images/product/${product.prodImageFirst}"  alt="product"> </a>
		                                    <div class="info">
		                                        <span class="name">${product.prodName} </span>
		                                        <div class="price"><input type="hidden" value="${product.prodPrice}"><fmt:formatNumber value="${product.prodPrice}" pattern="###,###"/>원</div>   
		                                        
		                                        <div class="btn-wrap">
		                                         <a href="/product/getProduct?prodNo=${product.prodNo}" class="btn btn-detail">상세보기</a>
		                                        </div>
		            	                       	 </div>
			                                </div>
			                            </div>
			                        </div>
		                       </c:forEach>
		                </div>
		            </div>

     			<!-- PageNavigation Start... -->
				<jsp:include page="../common/pageNavigator_all.jsp">
					<jsp:param name="id" value="salesProd" />
				</jsp:include>
				<!-- PageNavigation End... -->

			</div>
		</div>
	</div>
</div>

    <!--STORE WRAP END-->

				</div>
		</div>
</div>

</form>

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

