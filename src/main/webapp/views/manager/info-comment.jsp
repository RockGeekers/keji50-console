<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" session="true"%>
<%@ include file="/views/common/header.jsp"%>
<%@ include file="/views/common/banner.jsp"%>
<script type="text/javascript">
function del(id){
	if(confirm("确定删除？")){
	window.location="<c:url value="/manager"/>?command=DelInfoComment&id="+id;
	}
}
function confirmComment(id){
	window.location="<c:url value="/manager"/>?command=ConfirmInfoComment&id="+id;
}
</script>

<div class="container" id="main">
	<div class="containerBox">                     
		<div class="boxHeader">         
			<h2>资讯评论管理</h2> 
		</div>                     
		<div class="content">   
			<div class="newTips">     
			</div>   
		
			<div class="cLine"> 
				<h3 class="left">
					评论列表<span style="color:#979797;font-weight: normal;"></span>
				 </h3> 
				 <form action="<c:url value="/manager"/>?command=ListInfoComment" method="post" name="f-search">
				 	<input style="float:right" class="adminsearchsub" type="submit" value="搜索" />
				 	<input style="float:right" class="adminsearchtxt" type="text" size="30" name="key" value="<c:out value="${key}" />" />
				 	<select style="float: right" name="state" id="state">
						<option value="">全部状态
						<option value="c" <c:if test="${state == 'c'}">selected</c:if>>未审核
						<option value="s" <c:if test="${state == 's'}">selected</c:if>>已审核
						<option value="d" <c:if test="${state == 'd'}">selected</c:if>>已删除
					</select>
				 </form>
				&nbsp;&nbsp;<font color="red"><c:out value="${msg}" /></font>
				<div class="clr"></div>   
			 </div>     
			 <input type="button" value="全选" id="allchk1"/> 		
			 <input type="button" value="反选" id="allchk2"/> 		
			<table style="margin: auto;text-align:center;">
    <tr>
        
        <td style="width:5%"><strong>选框</strong></td>
        <td style="width:20%"><strong>评论内容</strong></td>
        <td style="width:5%"><strong>评论状态</strong></td>
        <td style="width:10%"><strong>资讯</strong></td>
        <td style="width:15%"><strong>操作</strong></td>
    </tr>
    <c:if test="${empty infoCommentList}">
    	<p>没有评论数据</p>
    </c:if>
    <c:forEach var="comment" items="${infoCommentList}" varStatus="status">
    <tr style="height:40px">
        <td><input type="checkbox" name="subchk" value="<c:out value="${comment.id}" />"/></td>
    	<td style="width:10%"><c:out value="${comment.content}" /></td>
    	<td style="width: 5%">
			<c:if test="${comment.state == 'c'}">未审核</c:if>
			<c:if test="${comment.state == 's'}">已审核</c:if>
			<c:if test="${comment.state == 'd'}">已删除</c:if>
		</td>
        <td><a href="<c:out value="${keji50InfoDomain }"/>/p/<c:out value="${comment.info_id }"/>" target="_blank">查看原文</a></td>
        <td>
        	<c:if test="${comment.state != 's' }">
        		<input type="button" value="审核" onClick="confirmComment('<c:out value="${comment.id}" />')"/> 
        	</c:if>
        	<c:if test="${comment.state != 'd' }">
        		<input type="button" value="删除" onClick="del('<c:out value="${comment.id}" />')"/>
        	</c:if>
        </td>
    </tr>
    </c:forEach>
    <tr>
    	<td><input  id="confirm_model" type="button" onclick="" value="全部审核"/></td>
    	<td><input  id="del_model" type="button" onclick="" value="全部删除"/></td>
    	<td colspan="3"></td>
    </tr>
   <c:if test="${not empty infoCommentList}"><tr><td colspan="20"><center><c:out escapeXml="false" value="${scroll}" /></center></td></tr></c:if>
	</table>
		</div>
		<div class="sideBar">       
			<div class="catalogList">        
				<ul>
					<li><a href="<c:url value="/manager?command=ListInfo&page=1"/>">资讯列表</a></li>
					<li><a href="<c:url value="/manager?command=AddInfo&id=0"/>">发表资讯</a></li>
					<li><a href="<c:url value="/manager?command=ListInfoCategory&page=1"/>">资讯类别列表</a></li>
					<li><a href="<c:url value="/manager?command=AddInfoCategory&id=0"/>">增加类别目录</a></li>
					<li class="selected"><a href="<c:url value="/manager?command=ListInfoComment&page=1"/>">资讯评论列表</a></li>
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
					url:"<%=request.getContextPath() %>/manager?command=DelAllInfoComment",
					data:{'delitems':checkedList.toString()},
					success:function(result){
						$("[name='subchk']:checkbox").attr("checked",false);
						window.location="<c:url value="/manager"/>?command=ListInfoComment";
					},
					error:function(result){
						alert("出错");
						window.location="<c:url value="/manager"/>?command=ListInfoComment";
					}
				});
			}
		});
		
		$("#confirm_model").click(function(){
			var checkedNum=$("input[name='subchk']:checked").length;
			if(checkedNum==0){
				alert("至少选一个");
				return;
			}
			
			if(confirm("确定审核通过 ？")){
				var checkedList = new Array();
				$("input[type='checkbox']:checked").each(function(){
					checkedList.push($(this).val());
				});
				$.ajax({
					type:"POST",
					url:"<%=request.getContextPath() %>/manager?command=ConfirmAllInfoComment",
					data:{'delitems':checkedList.toString()},
					success:function(result){
						$("[name='subchk']:checkbox").attr("checked",false);
						window.location="<c:url value="/manager"/>?command=ListInfoComment";
					},
					error:function(result){
						alert("出错");
						window.location="<c:url value="/manager"/>?command=ListInfoComment";
					}
				});
			}
		});
	});
	

	
</script>

<%@ include file="/views/common/footer.jsp"%>