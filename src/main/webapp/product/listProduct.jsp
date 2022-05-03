<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	
	<meta charset="EUC-KR">

<title>��ǰ �����ȸ</title>
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
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
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  <!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
    </style>
    
    <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
    
	//=============    �˻� / page �ΰ��� ��� ���  Event  ó�� =============	
	function fncGetPageList(currentPage) {
		
		$("#currentPage").val(currentPage)	
		$("form").attr("method", "POST").attr("action","/product/listProduct?menu="+"${param.menu}" ).submit();  
	
	}
	
	//============= "�˻�"  Event  ó�� =============	
	$(function(){
		 $("button.btn.btn-default").on("click",function(){
		
			fncGetPageList(1);
		}); 
		
	});	
	
	  $(function() {
			
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		  $( "td.abc" ).on("click" , function() {
			  var prodNo = $(this).attr("value");
			  console.log(prodNo);
			  
			  if($("input[name='menu']").val()=="manage"){	
					
					self.location = "/product/updateProduct?prodNo="+prodNo
			  } else if($("input[name='menu']").val()!="manage"){		
				 self.location ="/product/getProduct?prodNo="+prodNo+"&menu="+$("input [name='menu']").val();
			  }
		   });  
						
			//==> userId LINK Event End User ���� ���ϼ� �ֵ��� 
			$( "td.abc" ).css("color" , "red");
			
		});	 


 
	/*  $(function(){
		$("td.abc").on("click",function(){
			var prodNo = $(this).attr("value");
			console.log(prodNo);
				
			if($("input[name='menu']").val()=="manage"){	
					
				self.location = "/product/updateProduct?prodNo="+prodNo  */
			
					
			/*} else if($("input[name='menu']").val()!="manage"){
				 self.location = "/product/getProduct?prodNo="+prodNo+"&menu="+$("input [name='menu']").val() */ 
			
		 $(function() {			
			$(  "td:nth-child(6) > i" ).on("click" , function() {		
				var prodNo = $(this).attr("id");
				console.log(prodNo);
				$.ajax(
						{
							url : "json/getProduct/"+prodNo+"/"+"${param.menu}" ,
							method : "GET",
							dataType : "json",
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							success : function(JSONData, status){
									
								var displayValue = "<h6>"
										+"��ǰ��ȣ : "+JSONData.product.prodNo+"<br>"
										+"��ǰ�� : "+JSONData.product.prodName+"<br>"
										+"������ : "+JSONData.product.prodDetail+"<br>"
										+"�������� : "+JSONData.product.manufDay+"<br>"
										+"�� �� : "+JSONData.product.price+"<br>"
										+"����� : "+JSONData.product.regDateString+"<br>"
										+"</h6>";
				
									$("h6").remove();
									$("#"+prodNo+"").html(displayValue);
							}
				});
			

		});
		 $( "td:nth-child(2)" ).css("color" , "red");
		$("h7").css("color" , "red");
		
		$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke"); 
	});
		
 </script>
 


</head>
<!--  self.location = "/product/getProduct?prodNo="+prodNo+"&menu="+${menu} -->
<body>
	<jsp:include page="/layout/toolbar.jsp" />
	<div class="container">
		<div class="page-header text-info">
	       <h3>
	       <c:if test = "${ param.menu == 'manage'}">
			�ǸŻ�ǰ����<br/>
			</c:if>
			<c:if test = "${ param.menu == 'search'}">
			��ǰ�˻�<br/>
			</c:if>
			</h3>
	    </div>
	    
	    <!-- table ���� �˻� Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
						<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>��ǰ��ȣ</option>
						<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>��ǰ��</option>
						<option value="2" 	${! empty search.searchCondition && search.searchCondition == 2 ? "selected" : "" }>��ǰ����</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">�˻���</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="�˻���"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default">�˻�</button>
				  
				  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    </div>	
	
		<!-- table ���� �˻� Start /////////////////////////////////////-->
		
		
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
		        <thead>
				<tr>
					<th align="center">No</th>
					<th align="left">��ǰ��</th>
					<th align="left">����</th>
					<th align="left">�����</th>	
					<th align="left">�������</th>	
					<th align="left">��������</th>
				</tr>
		        </thead>
		       
				<tbody>
					<c:set var="i" value="0" />
					<c:forEach var="product" items="${list }">
					<c:set var="i" value="${i+1}"/>
						<tr>
							<td align="center" >${ i }</td>
							<td align="left" class="abc" title="Click : ��ǰ���� Ȯ��" value="${product.prodNo }">
							<c:if  test = "${menu=='manage'}">
							${product.prodName }
							</c:if>		
												
							<c:if  test = "${menu!='manage' }" >
							${ product.prodName}
							</c:if>
							</td>
						
								<td align="left">${product.price}</td>
						
								<td align="left">${ product.regDate}</td>
						
								<td align="left">�Ǹ���</td>	
								<td align="left">
								  	<i class="glyphicon glyphicon-ok" id= "${product.prodNo}"></i>
								  	<input type="hidden" value="${product.prodNo}">
								</td>
							</tr>
			
						</c:forEach>
					</tbody>
		</table>

		<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
				<tr>
					<td align="center">
						<input type="hidden" id="currentPage" name="currentPage" value=""/>
						<input type="hidden" name="menu" value="${param.menu}" />
							
			    		<jsp:include page="../common/pageNavigator.jsp"/>	
			    	</td>
				</tr>
	      
	      </table>
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	
</body>
 

</html>