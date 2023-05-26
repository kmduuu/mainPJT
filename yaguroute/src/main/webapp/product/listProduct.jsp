<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>
<html>

<head>
<meta charset="EUC-KR">

<!-- <title>jQuery UI Autocomplete - Default functionality</title>  -->
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
 
 <!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   	 
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
        
        .thumbnail {
        
        width:360px;
        height:360px;

        }
    </style>
    
  
 		
<script type="text/javascript">

	//=====����Code �ּ� ó�� ��  jQuery ���� ======//
	// �˻� / page �ΰ��� ��� ��� Form ������ ���� JavaScrpt �̿�  
	function fncGetProductList(currentPage) {
		//document.getElementById("currentPage").value = currentPage;
		$("#currentPage").val(currentPage)
	   	//document.detailForm.submit();
		$("form").attr("method" , "POST").attr("action" , "/product/listProduct").submit();
	}
	
	
	//===========================================//
	//==> �߰��Ⱥκ� : "�˻�" ,  userId link  Event ���� �� ó��
	 $(function() {
		 
		//==> �˻� Event ����ó���κ�
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����. 
		 $( "td.ct_btn01:contains('�˻�')" ).on("click" , function() {
			//Debug..
			//alert(  $( "td.ct_btn01:contains('�˻�')" ).html() );
			fncGetProductList(1);
		});
		
		
		//==> userId LINK Event ����ó��
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 3 �� 1 ��� ���� : $(".className tagName:filter�Լ�") �����.
// 		$(  ".ct_list_pop td:nth-child(3)" ).on("click" , function() {
// 				//Debug..
// 				//alert(  $( this ).text().trim() );
// 				self.location ="/product/getProduct?prodNo="+$(this).text().trim();
// 		});
		
	 	$(".ct_list_pop td:nth-child(3)" ).on("click" , function() {
	 		var prodNo = $(this).children('input:hidden').val();
	 		
	 		//console.log($(this).val());
	 		//alert(  $( this ).text());
	 		if(($('#menu').attr('name')) == "manage") { 
	 			//alert(  $( this ).text());
 	 			self.location = "/product/updateProduct?prodNo="+prodNo+"&menu=manage";	
 	 			
// 	 		}
// 			if(($('#menu').attr('name')) == "search") {
// 	 			self.location = "/product/getProduct?prodNo="+$(this).children('input:hidden').val()+"&menu="+$('menu').attr('name');				
 			}     
 			if(($('#menu').attr('name')) == "search") {
 				//alert(  $( this ).text());
 				self.location = "/product/getProduct?prodNo="+prodNo+"&menu=search";	
 				
 				}//2nd if end
	 		
	 	});//mainfunction end
	 	
	 	
	 	
		//==> UI ���� �߰��κ�  :  userId LINK Event End User ���� ���ϼ� �ֵ��� 
		$( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
		$("h7").css("color" , "red");
		
		

		//==> �Ʒ��� �ּ��� �ϳ��� Ǯ�� ���� �����ϼ���.					
		$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
		//console.log ( $(".ct_list_pop:nth-child(1)" ).html() );
		//console.log ( $(".ct_list_pop:nth-child(2)" ).html() );
		//console.log ( $(".ct_list_pop:nth-child(3)" ).html() );
		//console.log ( $(".ct_list_pop:nth-child(4)" ).html() ); //==> ok
		//console.log ( $(".ct_list_pop:nth-child(5)" ).html() ); 
		//console.log ( $(".ct_list_pop:nth-child(6)" ).html() ); //==> ok
		//console.log ( $(".ct_list_pop:nth-child(7)" ).html() ); 
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
	 					
	 				    $( "#autoComplete" ).autoComplete({
	 					      source: JSONData
	 					    });
	 				
	 					}
	 					
	 				});
			 });
					
		
</script>

</head>



<body bgcolor="#ffffff" text="#000000">
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	<div class="page-header text-info">
	<div class="row">
<!-- <c:set var="menu" value="${param.menu}" /> -->
	 <c:set var="menu" value="manage" />  
<div style="width:98%; margin-left:10px;">


<!-- 
<form name="detailForm" action="/product/listProduct?menu=${menu}" method="post">  -->
<form name="detailForm" action="/product/listProduct?menu=manage" method="post">



<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">
								
					<c:choose>
					
						<c:when test="${menu eq 'manage'}">
						��ǰ ����
						</c:when>
						
						<c:otherwise>
						��ǰ�����ȸ
						</c:otherwise>
						
					</c:choose>		
				
					
										
					</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>




		<td align="right">
		
			<select name="searchCondition" class="ct_input_g" style="width:80px">
				<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>��ǰ��</option>		
			</select>
			
			<input type="text" name="searchKeyword" id="autoComplete"
						value="${! empty search.searchKeyword ? search.searchKeyword : ""}"  
						class="ct_input_g" style="width:200px; height:20px" > 	
		</td>	
						
								
		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23"> 
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						�˻�	
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>



<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
	  <div class="col-md-6 text-left">
		    	<p class="text-primary">
			��ü  ${resultPage.totalCount } ��, ���� ${resultPage.currentPage}  ������
		</td>
		
	</tr>

	
	<c:set var="i" value="0" />
	<c:forEach var="product" items="${list}">
		<c:set var="i" value="${ i+1 }" />
		<tr class="ct_list_pop">
			<td align="center">${ i }</td>
			
			<td></td>

	 	<td align="left">
			<c:choose>			
				<c:when test= "${menu eq 'manage'}">
					<input type="hidden" id="menu" name="manage" value="${product.prodNo}"/>
				</c:when>
				<c:otherwise>
					<input type="hidden" id="menu" name="search" value="${product.prodNo}"/> 	
				</c:otherwise>
			</c:choose>
			
				${product.prodName} </td> 
		

			<td></td>
			<td align="left">${product.prodPrice}</td>
			<td></td>
			<td align="left">${product.prodRegDate}</td>
			<td></td>
			<td align="left">${product.prodStock}</td>
			<td></td>
			<td align="left">${product.prodCategory}</td>
			<td></td>
			<td align="left">${product.prodImage}</td>
			<td></td>
			<td align="left">${product.prodTeamCode}</td>
			
								
		</tr>
		<tr>
	<!-- 	<td colspan="11" bgcolor="D6D7D6" height="1"></td> -->
		<td id="${product.prodNo}" colspan="11" bgcolor="D6D7D6" height="1"></td>
		</tr>
	</c:forEach>
</table>

<!-- PageNavigation Start... -->
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>

		<td align="center">
			
		   <input type="hidden" id="currentPage" name="currentPage" value=""/>			
			<c:set var="pageType" value="product" scope="request"/>
			<jsp:include page="../common/pageNavigator.jsp"/>	
			
    	</td>
	</tr>
</table>

	<div class="row">
 	 <span class="col-md-3">
 	 
	
 	 
		<c:forEach var="product" items="${list}">
		<c:set var="i" value="${ i+1 }" />

    	<div class="thumbnail">
     	 <img src="/images/product/${product.prodImage }"/>
    	  <div class="caption">
      	  <h3>${product.prodName}</h3>
      	  <p>${product.prodPrice}</p>
       
      </div>
    </div>
 
  </c:forEach>
   </span>
</div>
<!--  ������ Navigator �� -->

</form>
</div>

</body>
</html>
		