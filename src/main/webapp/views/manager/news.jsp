<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" session="true"%>
<%@ include file="/views/common/header.jsp"%>
<%@ include file="/views/common/banner.jsp"%>
<script type="text/javascript">
function del(id){
	if(confirm("确定删除？")){
	window.location="<c:url value="/manager"/>?command=DelNews&id="+id;
	}
}
function edit(id){
	window.location="<c:url value="/manager"/>?command=EditNews&id="+id;
}
</script>

<div class="container" id="main">
	<div class="containerBox">                     
		<div class="boxHeader">         
			<h2>活动管理</h2> 
		</div>                     
		<div class="content">   
			<div class="newTips">     
			</div>   
		
			<div class="cLine"> 
				<h3 class="left">
					活动列表<span style="color:#979797;font-weight: normal;"></span>
				 </h3> 
				 <form action="<c:url value="/manager"/>?command=ListNews" method="post" name="f-search">
				 	<input style="float:right" class="adminsearchsub" type="submit" value="搜索" />
				 	<input style="float:right" class="adminsearchtxt" type="text" size="30" name="key" value="<c:out value="${key}" />" />
				 </form>
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
			 <input type="button" value="全选" id="allchk1"/> 		
			 <input type="button" value="反选" id="allchk2"/> 		
			<table style="margin: auto;text-align:center;">
    <tr>
        
        <td style="width:5%"><strong>选框</strong></td>
        <td style="width:20%"><strong>名称</strong></td>
        <td style="width:15%"><strong>操作</strong></td>
    </tr>
    <c:if test="${empty newslist}">
    	<p>没有活动数据</p>
    </c:if>
    <c:forEach var="news" items="${newslist}" varStatus="status">
    <form action="<c:url value="/manager"/>?command=AddNews&id=<c:out value="${news.id}"/>" name="news<c:out value="${status.count}" />" method="post">
    <tr style="height:40px">
        <td><input type="checkbox" name="subchk" value="<c:out value="${news.id}" />"/></td>
    	<td style="width:10%"><c:out value="${news.title}" /></td>
        
        <td>
        	<input type="button" value="修改" onClick="edit('<c:out value="${news.id}" />')"/> 
        	<input type="button" value="删除" onClick="del('<c:out value="${news.id}" />')"/>
        </td>
    </tr>
    </form>
    </c:forEach>
    <tr><td ><input  id="del_model" type="button" onclick="" value="全部删除"/></td><td colspan="2"></td></tr>
    <!-- <form action="<c:url value="/manager"/>?command=SaveCate" name="cate" method="post">
    <tr> 
    	<td><input name="name" id="name" type="text" size="25"/></td>
        <td><input name="code" id="code" type="text" size="5"/></td>
        <td><input name="icon" id="icon" size="40"   type="text" /></td>
        <td><input type="submit" value="添加分类"/></td>
    </tr>
    </form> -->
   <c:if test="${not empty newslist}"><tr><td colspan="20"><center><c:out escapeXml="false" value="${scroll}" /></center></td></tr></c:if>
	</table>
				
			<!-- <div class="cLine">              
				 <div class="pageNavigator right">       
				 	<span><a id="prePage" class="prePage textDisable" href="#" onclick="javaScript:void(0);">上一页</a></span>
				 	<span class="pageNum">&nbsp;&nbsp;<c:out value="${page}"/>&nbsp;/&nbsp;<c:out value="${pageCount}"/>&nbsp;&nbsp;</span>
				 	<span><a id="nextPage" class="nextPage" href="#" onclick="javaScript:void(0);">下一页</a></span>
				 </div>      
			</div>  -->
			 	     
		</div>                   
		<div class="sideBar">       
			<div class="catalogList">        
				<ul>
				
					<!-- <li><a href="<c:url value="/manager?command=ListCate&page=1"/>">活动分类</a></li>-->     
					<li class="selected"><a href="<c:url value="/manager?command=ListNews&page=1"/>">活动列表</a></li> 
					<li><a href="<c:url value="/manager?command=AddNews&id=0"/>">增加活动</a></li> 
					
				</ul>       
			</div>     
		</div>           
		<div class="clr"></div>     
	</div>
</div>
<script type="text/javascript">
	$(function(){
		$("#allchk1").click(function(){
			$("input[type='checkbox']").prop("checked","checked");
		});
	
 $("#allchk2").click(function(){
        $("input[name='subchk']").each(function(){
            if (this.checked) {
                this.checked = false;
            }
            else {
                this.checked = true;
            }
        });
    });
		
		$("#del_model").click(function(){
			var checkedNum=$("input[name='subchk']:checked").length;
			if(checkedNum==0){
				alert("至少选一个");
				return;
			}
			
			if(confirm("确定删除？")){
				var checkedList = new Array();
				$("input[type='checkbox']:checked").each(function(){
					checkedList.push($(this).val());
				});
				$.ajax({
					type:"POST",
					url:"<%=request.getContextPath() %>/manager?command=DelAllNews",
					data:{'delitems':checkedList.toString()},
					success:function(result){
						$("[name='subchk']:checkbox").attr("checked",false);
						window.location="<c:url value="/manager"/>?command=ListNews";
					},
					error:function(result){
						alert("出错");
						window.location="<c:url value="/manager"/>?command=ListNews";
					}
				});
			}
		});
	});
	

	
</script>

<%@ include file="/views/common/footer.jsp"%>