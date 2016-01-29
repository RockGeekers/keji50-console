<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" session="true"%>
<%@ include file="/views/common/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>科技50 </title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/static/css/style.css"></link>
<script type="text/javascript" src="<%=request.getContextPath() %>/ueditor/editor_config.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/ueditor/editor_all_min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/static/js/Validate.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/static/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/static/js/highcharts.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/static/js/exporting.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/static/js/My97DatePicker/WdatePicker.js"></script>

</head>
<body>
<div class="header" id="header">     
	<div class="logoArea">       
		<a href="/" class="logo left block">                 
			<img src="<%=request.getContextPath() %>/static/images/logo1.png" />        
		</a>             
		<div class="accountOp right">       
		<c:if test="${sessionScope.login}">    
			<span><a href="#"><c:out value="${sessionScope.account.username}"/></a></span>  
			<span class="none"><a href="#">帮助中心</a></span>      
			<span><a href="<c:url value="/manager?command=Logout"/>">退出</a></span>     
		</c:if>     		
		</div>       
		<div class="clr"></div>     
	</div>          
	<div class="navigator">       
		<ul class="textLarge">     
		<c:if test="${sessionScope.login}">   
			<c:if test="${sessionScope.account.purview==99}">                   
				<li <c:if test="${menu eq 'news'}">class="selected"</c:if>><a href="<c:url value="/manager?command=ListNews"/>">活动管理</a></li>
				<li <c:if test="${menu eq 'info'}">class="selected"</c:if>><a href="<c:url value="/manager?command=ListInfo"/>">资讯管理</a></li> 
				<li <c:if test="${menu eq 'ad'}">class="selected"</c:if>><a href="<c:url value="/manager?command=ListAd"/>">广告管理</a></li> 
				<li <c:if test="${menu eq 'pro'}">class="selected"</c:if>><a href='<c:url value="/manager?command=ListPro"/>'>项目管理</a></li>   
				<li <c:if test="${menu eq 'made'}">class="selected"</c:if>><a href="<c:url value="/manager?command=ListMade"/>">创富集</a></li> 
				<li <c:if test="${menu eq 'tutor'}">class="selected"</c:if>><a href="<c:url value="/manager?command=ListTutor"/>">专家管理</a></li> 
				
				<li <c:if test="${menu eq 'content'}">class="selected"</c:if>><a href="<c:url value="/manager?command=ListContent"/>">页面设置</a></li>
				<li <c:if test="${menu eq 'show'}">class="selected"</c:if>><a href="<c:url value="/manager?command=ShowApply"/>">报名管理</a></li>  
				<li <c:if test="${menu eq 'account'}">class="selected"</c:if>><a href="<c:url value="/manager?command=ListAccount"/>">用户管理</a></li> 
				<li <c:if test="${menu eq 'sendmail'}">class="selected"</c:if>><a href="<c:url value="/manager?command=SendMail"/>">邮件群发</a></li> 
				                  
			<!-- <li <c:if test="${menu eq 'log'}">class="selected"</c:if>><a href="<c:url value="/manager/log.txt"/>" target="_blank"/>查看日志</a></li>  -->
			</c:if>
		</c:if>                                     
		</ul>     
	</div>           
</div>