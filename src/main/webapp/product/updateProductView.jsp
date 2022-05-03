<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    

	
<!DOCTYPE html>

<html lang="ko">
	
<head>
<title>상품수정</title>
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" 
		integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" 
		crossorigin="anonymous">
	<!-- Optional theme -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" 
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" 
	crossorigin="anonymous">
	<!-- Latest compiled and minified JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" 
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" 
	crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   
 	<title>Bootstrap datepicket demo</title>
    <script src="https://code.jquery.com/jquery-3.2.1.js"></script>

	<link rel="stylesheet" href="/css/jquery-ui.min.css">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"/>

    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>

    <script type='text/javascript' src='//code.jquery.com/jquery-1.8.3.js'></script>



    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">

    <script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>

    <script src="/js/bootstrap-datepicker.kr.js" charset="UTF-8"></script>



    <script type='text/javascript'>

    $(function(){

        $('.input-group.date').datepicker({

            calendarWeeks: false,

            todayHighlight: true,

            autoclose: true,

            format: "yyyy/mm/dd",

            language: "kr"

        });

    });
    </script>
    
    <!--  ///////////////////////// CSS ////////////////////////// -->
   <style>
	 body > div.container{
        	border: 20px solid #eee0;
            margin-top: 20px;
        }
        
        .input-group.date{
        	width:230px;
        }
       
    </style>
 
 <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type='text/javascript'>
	
	function fncAddProduct(value){
		
		var name=$("input[name='prodName']").val();
	 	var detail = $("input[name='prodDetail']").val();
	 	var manuDate = $("input[name='manufDay']").val();
	 	var price = $("input[name='price']").val();
	 	
	 	/* 
		 if (name == null || name.length < 1) {
			alert("상품명은 반드시 입력하여야 합니다.");
			return;
		}  */
		if(detail == null || detail.length<1){
			alert("상품상세정보는 반드시 입력하여야 합니다.");
			return;
		}
		if(manuDate == null || manuDate.length<1){
			alert("제조일자는 반드시 입력하셔야 합니다.");
			return;
		}
		if(price == null || price.length<1){
			alert("가격은 반드시 입력하셔야 합니다.");
			return;
		}
		
		/* document.detailForm.action='/product/getProduct';
		document.detailForm.submit(); */
		/* $("input:hidden[name='prodNo']").val( value );  */
		$("form").attr("method", "POST").attr("action", "/product/updateProduct").submit();
	}		
	$(function(){
		
		$("button.btn.btn-primary").on("click", function(){
		
			fncAddProduct();
		});
		

		$("a[href='#' ]").on("click", function(){
			
			history.go(-1);
		});
	});


	</script>
</head>
<body>
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
		
		<div class="page-header text-center">
	       <h3 class=" text-info">상품정보수정</h3>
	       <h5 class="text-muted">상품정보를 <strong class="text-danger">수정</strong>해 주세요.</h5>
	    </div>
		<form class="form-horizontal" name="detailForm">
		<input type="hidden" name="prodNo" value="${product.prodNo}"/>
		  <div class="form-group">
		    <label for="prodNoame" class="col-sm-offset-1 col-sm-3 control-label">상 품 명</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodName" name="prodName" value="${product.prodName }" placeholder="상품명을 수정하세요"  readonly>
		       <span id="helpBlock" class="help-block">
		      	<strong class="text-danger">상품명은 수정불가</strong>
		      </span>
		    </div>
		  </div>
		  
		   <div class="form-group">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">상품상세정보</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodDetail" name="prodDetail" value="${product.prodDetail}" placeholder="정보를 변경해주세요">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="manufDay" class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>
		    <div class="col-sm-4">
		      <div class="input-group date">
			    <input type="text" class="form-control" id="manufDay" name="manufDay" placeholder="제조일자를 입력하세요">
			    <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
		    </div>
		  </div>
		  </div>
		  
		   <div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">가 격</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="price" name="price" value="${product.price}" placeholder="가격을 변경해주세요">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="imgFile" class="col-sm-offset-1 col-sm-3 control-label">상품이미지</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="imgFile" name="imgFile" value="${product.imgFile}" placeholder="상품이미지를 변경해주세요">
		    </div>
		  </div>
		  
		   <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary" value="${product.prodNo}" >수 &nbsp;정</button>
			  <a class="btn btn-primary btn" href="#" role="button">취 &nbsp;소</a>
		    </div>
		  </div>
		</form>
		
		
		
	</div>	
</body>


</html>