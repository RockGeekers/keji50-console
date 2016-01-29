<%@ page contentType="text/html; charset=UTF-8" language="java"
	pageEncoding="UTF-8" session="true"%>
<%@ include file="/views/common/header.jsp"%>
<%@ include file="/views/common/banner.jsp"%>
<script type="text/javascript">
function edit(id){
	window.location="<c:url value="/manager"/>?command=EditInfoCategory&id="+id;
}
</script>

<div class="container" id="main">
	<div class="containerBox">
		<div class="boxHeader">
			<h2>资讯类别管理</h2>
		</div>
		<div class="content">
			<div class="newTips"></div>

			<div class="cLine">
				<h3 class="left">
					资讯类别列表<span style="color: #979797; font-weight: normal;"></span>
				</h3>
				&nbsp;&nbsp;<font color="red"><c:out value="${msg}" /></font>
				<div class="clr"></div>
			</div>

			<table style="margin: auto; text-align: center;">
				<tr>

					<td style="width: 5%"><strong>编号</strong></td>
					<td style="width: 20%"><strong>名称</strong></td>
					<td style="width: 10%"><strong>代码</strong></td>
					<td style="width: 10%"><strong>颜色</strong></td>
					<td style="width: 10%"><strong>状态</strong></td>
					<td style="width: 15%"><strong>操作</strong></td>
				</tr>
				<c:if test="${empty categories}">
					<p>没有资讯类别数据</p>
				</c:if>
				<c:forEach var="category" items="${categories }" varStatus="status">
					<form action="<c:url value="/manager"/>?command=AddInfoCategory&id=<c:out value="${category.id}"/>" name="category<c:out value="${status.count}" />" method="post">
						<tr style="height: 40px">
							<td><c:out value="${status.count}" /></td>
							<td style="width: 20%"><c:out value="${category.name}" /></td>
							<td style="width: 10%"><c:out value="${category.code}" /></td>
							<td stype="width: 10%"><span style="background-color: <c:out value="${category.color_code}" />">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></td>
							<td style="width: 5%">
								<c:if test="${category.state == 'c'}">草稿</c:if>
								<c:if test="${category.state == 's'}">已审核</c:if>
								<c:if test="${category.state == 'd'}">已删除</c:if>
							</td>
							<td><input type="button" value="修改" onClick="edit('<c:out value="${category.id}" />')" /> 
							</td>
						</tr>
					</form>
				</c:forEach>
			</table>
		</div>
		<div class="sideBar">
			<div class="catalogList">
				<ul>
					<li><a href="<c:url value="/manager?command=ListInfo&page=1"/>">资讯列表</a></li>
					<li><a href="<c:url value="/manager?command=AddInfo&id=0"/>">发表资讯</a></li>
					<li class="selected"><a href="<c:url value="/manager?command=ListInfoCategory&page=1"/>">资讯类别列表</a></li>
					<li><a href="<c:url value="/manager?command=AddInfoCategory&id=0"/>">增加类别目录</a></li>
					<li><a href="<c:url value="/manager?command=ListInfoComment&page=1"/>">资讯评论列表</a></li>
				</ul>
			</div>
		</div>
		<div class="clr"></div>
	</div>
</div>

<%@ include file="/views/common/footer.jsp"%>