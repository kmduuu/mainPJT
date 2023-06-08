<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>

	<meta charset="UTF-8">
	<meta name="description" content="" />
    <meta name="keywords" content="" />
    <meta name="viewport" content="width=device-width,initial-scale=1">
	<title>getProduct</title>
	<link href="https://fonts.googleapis.com/css?family=Montserrat%7COpen+Sans:700,400%7CRaleway:400,800,900" rel="stylesheet" />
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <link href="/css/style.min.css" rel="stylesheet" type="text/css" />
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<style>
.product-slider img {
    max-width: 100%;
    max-height: 100%;
}

.product-main-img {
    max-width: 100%;
    max-height: 100%;
        object-fit: contain;
}

</style>


<script type="text/javascript">



</script>

</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
<jsp:include page="/common/topBar.jsp"/>
	<!-- ToolBar End /////////////////////////////////////-->



    <!--BREADCRUMBS BEGIN-->
<section class="image-header">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="info">
                    <div class="wrap">
                        <ul class="breadcrumbs">
                            <li><a href="index.html">Main</a>/</li>
                            <li>Category</li>
                        </ul>
                        <h1>상품상세조회</h1>
                    </div>
                </div>
            </div>	
        </div>
    </div>
</section>
<!--BREADCRUMBS END-->

    <!--PRODUCT SINGLE BEGIN-->

    <section class="product-single">
        <div class="container">
            <div class="row">
                <div class="col-md-12"><h4>${product.prodName} ${product.prodTeamCode }</h4></div>
                <div class="col-md-7">
                    <div class="product-slider">
                        <div class="connected-carousels">
                            <div class="navigation jcarousel-skin-default">
                                <a href="#" class="prev prev-navigation"><i class="fa fa-angle-up" aria-hidden="true"></i></a>
                                <a href="#" class="next next-navigation"><i class="fa fa-angle-down" aria-hidden="true"></i></a>
                                <div class="carousel carousel-navigation jcarousel-vertical" style="max-height: 500px; overflow: hidden;">
                                    <ul>
                                        <li>
                                            <img src="/images/product/${product.prodImageFirst}" alt="product-thumb">
                                        </li>
                                        <li>
                                            <img src="/images/product/${product.prodImageSecond}" alt="product-thumb">
                                        </li>
                                        <li>
                                            <img src="/images/product/${product.prodImageThird}"alt="product-thumb">
                                        </li>
                                        <li>
                                    </ul>
                                </div>
                            </div>
                            <div class="stage">
                                <div class="carousel carousel-stage"  style="width: 100%; height: 500px;">
                                    <ul>
                                        <li class="stage-item">
                                            <span class="store-badge new">new</span>
                                            <img src="/images/product/${product.prodImageFirst}" alt="product-main-img">
                                        </li>
                                    </ul>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                
                
                <div class="col-md-5">
                    <div class="product-right-info">
                        <div class="rating-wrap">
                            <div class="rating four"></div>
                            <div class="quantity">( 상품평균평점, 상품평수 작성예정)</div>
                        </div>
						
						<h4>${product.prodName}</h4>
                        <div class="price">${product.prodPrice}원</div>
                       
   
                        <div class="quantity-wrap">
                            <input type="number" placeholder="1">
                            <a href="cart.html" class="btn small">Add to cart</a>
                             <a href="cart.html" class="btn detail">바로구매</a>
                        </div>
                        <div class="details">
                            <ul>
                                <li><span>team: </span>${product.prodTeamCode}</li>
                                <li><span>Categories: </span>${product.prodCategory} </li>
                                <li>
                                    <span>Tags: </span>
                                    <a href="#">이것도,</a>
                                    <a href="#">쓸수있으면,</a>
                                    <a href="#">좋은,</a>
                                    <a href="#">태그,</a>
                                    <a href="#">running,</a>
                                    <a href="#">run</a>
                                </li>
                            </ul>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <div class="product-tab-wrap">
            <div class="tab-top">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <ul>
                                <li><a href="#description">Description</a></li>
                                <li><a href="#aditionalInformation">Aditional Information</a></li>
                                <li class="active"><a href="#reviews">Reviews (2)</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-item">
                <div class="container">
                    <div class="row">
                        <div class="col-md-7">
                            <div class="comments-wrap">
                                <h6>Reviews</h6>
                                <div class="comment-item">
                                    <div class="avatar"><img src="images/common/author-avatar.jpg" alt="author-avatar"></div>
                                    <div class="info">
                                        <div class="date">
                                            <a href="#">25 Sep 2016</a> by <a href="#">Ian Finch</a>
                                            <a href="#" class="quote">#</a>
                                        </div>
                                        <div class="rating four"></div>
                                        <p>Pabst irony tattooed, synth sriracha selvage pok pok. Wayfarers kinfolk sartorial, helvetica you probably haven't heard of them tumeric venmo deep v mixtape semiotics brunch.</p>
                                    </div>
                                </div>
                                <div class="comment-item">
                                    <div class="avatar"><img src="images/common/author-avatar.jpg" alt="author-avatar"></div>
                                    <div class="info">
                                        <div class="date">
                                            <a href="#">25 Sep 2016</a> by <a href="#">Ian Finch</a>
                                            <a href="#" class="quote">#</a>
                                        </div>
                                        <div class="rating two"></div>
                                        <p>Pabst irony tattooed, synth sriracha selvage pok pok. Wayfarers kinfolk sartorial, helvetica you probably haven't heard of them tumeric venmo deep v mixtape semiotics brunch.</p>
                                    </div>
                                </div>
                                <div class="comment-item">
                                    <div class="avatar"><img src="images/common/author-avatar.jpg" alt="author-avatar"></div>
                                    <div class="info">
                                        <div class="date">
                                            <a href="#">25 Sep 2016</a> by <a href="#">Ian Finch</a>
                                            <a href="#" class="quote">#</a>
                                        </div>
                                        <div class="rating five"></div>
                                        <p>Pabst irony tattooed, synth sriracha selvage pok pok. Wayfarers kinfolk sartorial, helvetica you probably haven't heard of them tumeric venmo deep v mixtape semiotics brunch.</p>
                                    </div>
                                </div>
                            </div>	
                        </div>
                        <div class="col-md-5">
                            <div class="leave-comment-wrap">
                                <h6>Add a review </h6>	
                                <form>								
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="item">
                                                <label>
                                                    <span>Name <i>*</i></span>
                                                    <input type="text" name="text">
                                                </label>
                                            </div>	
                                        </div>
                                        <div class="col-md-12">
                                            <div class="item">
                                                <label>
                                                    <span>Email <i>*</i></span>
                                                    <input type="email" name="email">
                                                </label>
                                            </div>	
                                        </div>
                                        <div class="col-md-12">
                                            <div class="item">
                                                <label>
                                                    <span>Your comment</span>
                                                    <textarea></textarea>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <button class="comment-submit">post a review</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <!--STORE BANNER BEGIN-->

        <div class="store-banner position-relative">
            <div class="store-banner-info">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="title">official <span>apparel</span></div>
                            <a href="store.html" class="btn">Details</a>
                        </div>	
                    </div>
                </div>
            </div>
        </div>

        <!--STORE BANNER END-->

    </section>

    <!--PRODUCT SINGLE END-->

    <!--FEATURED PRODUCTS BEGIN-->

    <section class="featured-products">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h4>Featured products</h4>
                </div>
                <div class="col-md-12">
                    <div class="owl-carousel owl-theme featured-slider">
                        <div class="store-list-item">
                            <div>
                                <a href="product.html">
                                    <span class="store-badge hot">hot</span>
                                    <img src="images/common/store-item-img.jpg" alt="store-item-img">
                                </a>
                                <div class="info">
                                    <span class="name">Men's Short-Sleeve Football</span>
                                    <span class="price">£ 80</span>	
                                    <div class="btn-wrap">
                                        <button class="btn small">add to cart</button>
                                        <button class="btn small">Details</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="store-list-item">
                            <div>
                                <a href="product.html">
                                    <span class="store-badge hot">hot</span>
                                    <img src="images/common/product-2.jpg" alt="store-item-img">
                                </a>
                                <div class="info">
                                    <span class="name">Men's Short-Sleeve Football</span>
                                    <span class="price">£ 80</span>	
                                    <div class="btn-wrap">
                                        <button class="btn small">add to cart</button>
                                        <button class="btn small">Details</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="store-list-item">
                            <div>
                                <a href="product.html">
                                    <span class="store-badge hot">hot</span>
                                    <img src="images/common/product-3.jpg" alt="store-item-img">
                                </a>
                                <div class="info">
                                    <span class="name">Men's Short-Sleeve Football</span>
                                    <span class="price">£ 80</span>	
                                    <div class="btn-wrap">
                                        <button class="btn small">add to cart</button>
                                        <button class="btn small">Details</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="store-list-item">
                            <div>
                                <a href="product.html">
                                    <span class="store-badge hot">hot</span>
                                    <img src="images/common/product-4.jpg" alt="store-item-img">
                                </a>
                                <div class="info">
                                    <span class="name">Men's Short-Sleeve Football</span>
                                    <span class="price">£ 80</span>	
                                    <div class="btn-wrap">
                                        <button class="btn small">add to cart</button>
                                        <button class="btn small">Details</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="store-list-item">
                            <div>
                                <a href="product.html">
                                    <span class="store-badge hot">hot</span>
                                    <img src="images/common/product-3.jpg" alt="store-item-img">
                                </a>
                                <div class="info">
                                    <span class="name">Men's Short-Sleeve Football</span>
                                    <span class="price">£ 80</span>	
                                    <div class="btn-wrap">
                                        <button class="btn small">add to cart</button>
                                        <button class="btn small">Details</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="custom-navigation featured-navigation">
                        <a class="custom-next-btn"><i class="fa fa-angle-left" aria-hidden="true"></i></a>
                        <a class="custom-prev-btn"><i class="fa fa-angle-right" aria-hidden="true"></i></a>
                    </div>
                </div>
                <div class="col-md-6 text-right">
                    <a href="store.html" class="feat-show-all">show all</a>
                </div>
            </div>
        </div>
    </section>

    <!--FEATURED PRODUCTS END-->

       <!--FOOTER BEGIN-->
<footer class="footer">
    <div class="wrapper-overfllow">
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-sm-12">
                    <div class="footer-left">
                        <div class="wrap">
                            <a href="index.html" class="foot-logo"><img src="images/baseball/footer-logo.png" alt="footer-logo"></a>
                            <p>Activated charcoal trust fund ugh prism af, beard marfa air plant stumptown gastropub farm-to-table jianbing.</p>
                            <ul class="foot-left-menu">
                                <li><a href="staff.html">First team</a></li>
                                <li><a href="staff.html">Second team</a></li>
                                <li><a href="amateurs.html">Amateurs</a></li>
                                <li><a href="donations.html">Donation</a></li>
                                <li><a href="trophies.html">trophies</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-12 col-lg-offset-1">
                    <div class="foot-news">
                        <h4>Recent news</h4>
                        <div class="item">
                            <a href="news.html" class="image"><img class="img-responsive" src="images/baseball/foot-news-img.jpg" alt="news-image"></a>
                            <a href="news.html" class="name">When somersaulting Sanchez shouldered Mexico’s hopes</a>
                            <a href="news.html" class="date">25 Sep 2016</a>
                            <span class="separator">in</span>
                            <a href="news.html" class="category">Highlights</a>
                        </div>
                    </div>
                </div>
                <div class=" col-lg-3 col-md-4 col-sm-12">
                    <div class="foot-contact">
                        <h4>Contact us</h4>
                        <ul class="contact-list">
                            <li><i class="fa fa-flag" aria-hidden="true"></i><span>276 Upper Parliament Street, Liverpool L8, Great Britain</span></li>
                            <li><i class="fa fa-envelope" aria-hidden="true"></i><a href="mailto:team@email.com">team@email.com</a></li>
                            <li class="phone"><i class="fa fa-phone" aria-hidden="true"></i><span>+61 3 8376 6284</span></li>
                        </ul>
                        <ul class="socials">
                            <li><a href="#"><i class="fa fa-facebook-square" aria-hidden="true"></i></a></li>
                            <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                            <li><a href="#"><i class="fa fa-google" aria-hidden="true"></i></a></li>
                            <li><a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>
                            <li><a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer-menu-wrap">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <ul class="footer-menu">
                        <li class="active"><a href="index.html"><span>Home</span></a></li>
                        <li><a href="matches.html"><span>Matches</span></a></li>
                        <li><a href="staff.html"><span>Team</span></a></li>
                        <li><a href="news.html"><span>News</span></a></li>
                        <li><a href="store.html"><span>Store</span></a></li>
                        <li><a href="contacts.html"><span>Contact</span></a></li>
                    </ul>	
                    <a href="#top" class="foot-up"><span>up <i class="fa fa-caret-up" aria-hidden="true"></i></span></a>
                </div>
            </div>
        </div>
    </div>
    <div class="footer-bottom">
        <div class="container">
            <div class="row">
                <div class="col-xs-6">
                    <div class="copyrights">
                        © 2017 Team - Sport club psd template
                    </div>
                </div>
                <div class="col-xs-6">
                    <div class="created">
                        <a href="#">Created by <img src="images/common/created-icon.png" alt="create-by-image"> torbara</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>
<!--FOOTER END-->
   
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
