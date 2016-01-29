<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" session="true"%>
<%@ include file="/views/common/header.jsp"%>
<%@ include file="/views/common/banner.jsp"%>
<script type="text/javascript">
function del(id){
	if(confirm("确定删除？")){
	window.location="<c:url value="/manager"/>?command=DelAccountv&id="+id;
	}
	
}
function edit(id){
	window.location="<c:url value="/manager"/>?command=EditAccount&id="+id;
}
</script>
<style type="text/css">
</style>
<div class="container" id="main">
	<div class="containerBox">                     
		<div class="boxHeader">         
			<h2>用户管理</h2> 
		</div>                     
		<div class="content">   
			<div class="newTips">     
			</div>   
		
			<div class="cLine"> 
				<h3 class="left">
					用户列表<span style="color:#979797;font-weight: normal;"></span>
				 </h3>     
				&nbsp;&nbsp;<font color="red"><c:out value="${msg}" /></font>
				<!-- <div class="searchbar right">       
					<input type="text" id="msgSearchInput" class="txt left" value="" placeholder="输入内容搜索">       
					<button id="msgSearchBtn" href="javascript:;" class="btnGrayS left" title="搜索" type="submit">搜索</button>     
				</div>      -->
				<div class="clr"></div>   
			 </div>     
			  <!-- 
		     <div class="cLine">              
				 <div class="pageNavigator right">       
				 	<span><a class="prePage textDisable" href="#">上一页</a></span>
				 	<span class="pageNum">&nbsp;&nbsp;1&nbsp;/&nbsp;4&nbsp;&nbsp;</span>
				 	<span><a class="nextPage" href="#">下一页</a></span>
				 </div>      
			</div> 
			 -->      
			<table style="margin: auto;text-align:center;">
    <tr>
        <td><strong>邮箱</strong></td>
        <td><strong>昵称</strong></td>
        <td><strong>密码</strong></td>
        <td><strong>权限</strong></td>
        <td><strong>电话</strong></td>
        <td><strong>操作</strong></td>
    </tr>
    <c:forEach var="account" items="${accountList}" varStatus="status">
    <form action="<c:url value="/manager"/>?command=AddAccount&id=<c:out value="${account.id}"/>" name='cate<c:out value="${status.count}" />' method="post">
    <tr>
        <td style="width:15%">${account.email}</td>
      	<td style="width:12%">${account.nickname}</td>
      	<td style="width:6%"><input name="password" id="password" value="<c:out value="${account.password}" />" size="10" type="password" disabled="disabled"/></td>
      	<td style="width:5%">
      			<c:if test="${account.purview eq 0}">
      			普通
				</c:if>
				
				<c:if test="${account.purview eq 99}">
				管理员
				</c:if>
				
        	
        </td>
  	     <!-- <td style="width:15%">${account.email}</td>	 -->
  	    <td style="width:12%">${account.tel}</td>
        <td style="width:13%">
        	<input type="button" value="修改" onClick="edit('<c:out value="${account.id}" />')"/>
        	<input type="button" value="删除" onClick="del('<c:out value="${account.id}" />')"/>
        </td>
    </tr>
    </form>
    </c:forEach>
    <tr><td colspan="20"><center><c:out escapeXml="false" value="${scroll}" /></center></td></tr>
	</table>
			<!-- <div class="cLine">              
				 <div class="pageNavigator right">       
				 	<span><a id="prePage" class="prePage textDisable" href="#" onclick="javaScript:void(0);">上一页</a></span>
				 	<span class="pageNum">&nbsp;&nbsp;<c:out value="${page}"/>&nbsp;/&nbsp;<c:out value="${pageCount}"/>&nbsp;&nbsp;</span>
				 	<span><a id="nextPage" class="nextPage" href="#" onclick="javaScript:void(0);">下一页</a></span>
				 </div>      
			</div>	      -->
		</div>                   
		<div class="sideBar">       
			<div class="catalogList">        
				<ul>
					<li class="selected"><a href="<c:url value="/manager?command=ListAccount"/>">用户列表</a></li>       
					<li><a href="<c:url value="/manager?command=AddAccount"/>">添加用户</a></li>
				</ul>       
			</div>     
		</div>           
		<div class="clr"></div>     
	</div>
</div>
<!-- 
<script type="text/javascript">

$(function(){
	var list=<c:out value="${pageCount}"/>
	if(list==0){
		$(".cLine").css("display","none");
	}
	var page=<c:out value="${page}"/>;
	var pageCount=<c:out value="${pageCount}"/>;
	$("#prePage").click(function(){
	
		if(page>1){
			window.location="<c:url value="/manager"/>?command=ListAccount&page="+(page-1);
		}
	});
	
	$("#nextPage").click(function(){
	
		if(page<pageCount){
			window.location="<c:url value="/manager"/>?command=ListAccount&page="+(page+1);
		}
	});
});
	
</script> -->
<%@ include file="/views/common/footer.jsp"%>