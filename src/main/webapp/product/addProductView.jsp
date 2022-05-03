
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
<head>
<title>상품등록</title>

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
    
	function fncAddProduct() {
	
		
		var name=$("input[name='prodName']").val();
		var detail=$("input[name='prodDetail']").val();
		var manuDate=$("input[name='manufDay']").val();
		var price=$("input[name='price']").val();

		if (name == null || name.length < 1) {
			alert("상품명은 반드시 입력하여야 합니다.");
			return;
		}
		if (detail == null || detail.length < 1) {
			alert("상품상세정보는 반드시 입력하여야 합니다.");
			return;
		}
		if (manuDate == null || manuDate.length < 1) {
			alert("제조일자는 반드시 입력하셔야 합니다.");
			return;
		}
		if (price == null || price.length < 1) {
			alert("가격은 반드시 입력하셔야 합니다.");
			return;
		}

		//document.detailForm.action = '/product/addProduct';
		//document.detailForm.submit();
		$("form").attr("method", "POST").attr("action", "/product/addProduct").submit();
	}

	/* function resetData() {
		document.detailForm.reset();
	}
	 */
	 
	 $(function(){
			
			$("a[href='#' ]").on("click", function(){
				
				fncAddProduct();
			});
		});
	 
	$(function(){
		
		$("a[href='#' ]").on("click", function(){
			
			$("form")[0].reset();
		});
	});
	

	
</script>
</head>
<body>
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
   	<div class="container">
	<div class="page-header text-info">
	       <h3>판매상품등록</h3>
	    </div>
	   </div>
	 

	<!-- <form name="detailForm" method="post" enctype="multipart/form-data">

		<table width="100%" height="37" border="0" cellpadding="0"
			cellspacing="0">
			<tr>
				<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"
					width="15" height="37" /></td>
				<td background="/images/ct_ttl_img02.gif" width="100%"
					style="padding-left: 10px;">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="93%" class="ct_ttl01">상품등록</td>
							<td width="20%" align="right">&nbsp;</td>
						</tr>
					</table>
				</td>
				<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"
					width="12" height="37" /></td>
			</tr>
		</table> -->
<div class="container">		
<form class="form-horizontal">

  <div class="form-group">
    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">상품명</label>
    <div class="col-sm-4">
    <input type="text" id="prodName" name="prodName"  placeholder="상품명을 입력하세요">
  	 </div>
  </div>
  <div class="form-group">
    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">상품상세정보</label>
    <div class="col-sm-4">
    <input type="text" id="prodDetail" name="prodDetail" placeholder="상세정보 입력하세요">
 	</div>
  </div>
  <div class="form-group">
    <label for="maunfDay" class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>
    <div class="input-group date">
    <input type="text" class="form-control" id="manufDay" name="manufDay" placeholder="제조일자를 입력하세요">
    <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
    <!-- <div class="input-group date">

            <input type="text" class="form-control"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>

        </div> -->



    	
 	</div>
  </div>
  <div class="form-group">
    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">가격</label>
    <div class="col-sm-4">
    <input type="text"  id="price" name="price" placeholder="가격을 입력하세요">
   	</div>
  </div>
  <div class="form-group">
    <label for="imgFile" class="col-sm-offset-1 col-sm-3 control-label">이미지</label>
    <div class="col-sm-4">
    <input type="file"  id="imgFile">
    <p class="help-block">이미지를 업로드하세요.</p>
 	</div>
  </div>
  
  <div class="form-group">
  	<div class="col-sm-offset-4  col-sm-4 text-center">
 	 <a  href="#" class="btn btn-primary btn-lg active" role="button">등&nbsp;록</a>
 	 <a href="#"  class="btn btn-default btn-lg active" role="button">취&nbsp;소</a>
 	</div>
  </div>
  
</form>


	<!-- <tr>
		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			style="margin-top: 13px;">
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
				<td width="104" class="ct_write">상품명<imgsrc="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"></td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="105"><input type="text" name="prodName"
								class="ct_input_g" style="width: 100px; height: 19px"
								maxLength="20"></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">상품상세정보 <img
					src="/images/ct_icon_red.gif" width="3" height="3"
					align="absmiddle" />
				</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01"><input type="text" name="prodDetail"
					class="ct_input_g" style="width: 100px; height: 19px"
					maxLength="10" minLength="6" /></td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">제조일자 <img
					src="/images/ct_icon_red.gif" width="3" height="3"
					align="absmiddle" />
				</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01"><input type="text" name="manufDay"
					class="ct_input_g" style="width: 100px; height: 19px"
					maxLength="10" minLength="6" /> &nbsp;<img
					src="../images/ct_icon_date.gif" width="15" height="15"
					onclick="show_calendar('document.detailForm.manufDay', document.detailForm.manufDay.value)" />
				</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">가격 <img
					src="/images/ct_icon_red.gif" width="3" height="3"
					align="absmiddle" />
				</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01"><input type="text" name="price"
					class="ct_input_g" style="width: 100px; height: 19px"
					maxLength="10">&nbsp;원</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">상품이미지</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">
				<input type="file" name="imgFile"
					class="ct_input_g" style="width: 100px; height: 19px"
					maxLength="13" /></td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
		</table>

		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			style="margin-top: 10px;">
			<tr>
				<td width="53%"></td>
				<td align="right">
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="17" height="23"><img src="/images/ct_btnbg01.gif"
								width="17" height="23" /></td>
							<td background="/images/ct_btnbg02.gif" class="ct_btn01"
								style="padding-top: 3px;">
								href="javascript:fncAddProduct();"></a>
								등록
								</td>
							<td width="14" height="23"><img src="/images/ct_btnbg03.gif"
								width="14" height="23" /></td>
							<td width="30"></td>
							<td width="17" height="23"><img src="/images/ct_btnbg01.gif"
								width="17" height="23" /></td>
							<td background="/images/ct_btnbg02.gif" class="ct_btn01"
								style="padding-top: 3px;">
								<a href="javascript:resetData();"></a>
								취소
							</td>
							<td width="14" height="23"><img src="/images/ct_btnbg03.gif"
								width="14" height="23" /></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</form>-->

		
	</div>
	
	
</body>
</html>