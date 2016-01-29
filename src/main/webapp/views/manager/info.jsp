<%@ page contentType="text/html; charset=UTF-8" language="java"
	pageEncoding="UTF-8" session="true"%>
<%@ include file="/views/common/header.jsp"%>
<%@ include file="/views/common/banner.jsp"%>
<script type="text/javascript">
function edit(id){
	window.location="<c:url value="/manager"/>?command=EditInfo&id="+id;
}
</script>

<div class="container" id="main">
	<div class="containerBox">
		<div class="boxHeader">
			<h2>资讯管理</h2>
		</div>
		<div class="content">
			<div class="newTips"></div>

			<div class="cLine">
				<h3 class="left">
					资讯列表<span style="color: #979797; font-weight: normal;"></span>
				</h3>
				<form action="<c:url value="/manager"/>?command=ListInfo" method="post" name="f-search">
					<input style="float: right" class="adminsearchsub" type="submit"
						value="搜索" /> <input style="float: right" class="adminsearchtxt"
						type="text" size="30" name="key" value="<c:out value="${key}" />" />
					<select style="float: right" name="suggest" id="suggest">
						<option value="">是否首页推荐
						<option value="1" <c:if test="${suggest == '1'}">selected</c:if>>是
						<option value="0" <c:if test="${suggest == '0'}">selected</c:if>>否
					</select>
					<select style="float: right" name="state" id="state">
						<option value="">全部状态
						<option value="c" <c:if test="${state == 'c'}">selected</c:if>>草稿
						<option value="s" <c:if test="${state == 's'}">selected</c:if>>已审核
						<option value="d" <c:if test="${state == 'd'}">selected</c:if>>已删除
					</select>
					<select style="float: right" id="info_category_id" name="info_category_id">
						<option value="">全部分类
						<c:forEach var="category" items="${categories }" varStatus="cateStatus">
							<option value="${category.id }" <c:if test="${info_category_id == category.id }">selected</c:if>><c:out value="${category.name}" /></option>
						</c:forEach>
					</select> 
				</form>
				&nbsp;&nbsp;<font color="red"><c:out value="${msg}" /></font>
				<div class="clr"></div>
			</div>

			<table style="margin: auto; text-align: center;">
				<tr>

					<td style="width: 5%"><strong>序号</strong></td>
					<td style="width: 30%"><strong>标题</strong></td>
					<td style="width: 5%"><strong>分类</strong></td>
					<td style="width: 5%"><strong>推荐</strong></td>
					<td style="width: 5%"><strong>状态</strong></td>
					<td style="width: 15%"><strong>创建时间</strong></td>
					<td style="width: 15%"><strong>操作</strong></td>
				</tr>
				<c:if test="${empty infoList}">
					<p>没有资讯数据</p>
				</c:if>
				<c:forEach var="info" items="${infoList}" varStatus="status">
					<form action="<c:url value="/manager"/>?command=AddInfo&id=<c:out value="${info.id}"/>" name="info<c:out value="${status.count}" />" method="post">
						<tr style="height: 40px">
							<td><c:out value="${status.count}" /></td>
							<td style="width: 30%"><c:out value="${info.title}" /></td>
							<td style="width: 5%">
							<c:forEach var="category" items="${categories }" varStatus="cateStatus">
								<c:if test="${category.id == info.info_category_id }">
									<c:out value="${category.name }"></c:out>
								</c:if>
							</c:forEach>
							</td>
							<td style="width: 5%">
								<c:if test="${info.suggest == '1' }">是</c:if>
								<c:if test="${info.suggest == '0' }">否</c:if>
							</td>
							<td style="width: 5%">
								<c:if test="${info.state == 'c'}">草稿</c:if>
								<c:if test="${info.state == 's'}">已审核</c:if>
								<c:if test="${info.state == 'd'}">已删除</c:if>
							</td>
							<td><c:out value="${info.getCreate_datestr() }"></c:out></td>
							<td><input type="button" value="修改" onClick="edit('<c:out value="${info.id}" />')" /> 
							</td>
						</tr>
					</form>
				</c:forEach>
				<c:if test="${not empty infoList}">
					<tr>
						<td colspan="20">
						<center>
								<c:out escapeXml="false" value="${scroll}" />
						</center>
						</td>
					</tr>
				</c:if>
			</table>
		</div>
		<div class="sideBar">
			<div class="catalogList">
				<ul>
					<li class="selected"><a href="<c:url value="/manager?command=ListInfo&page=1"/>">资讯列表</a></li>
					<li><a href="<c:url value="/manager?command=AddInfo&id=0"/>">发表资讯</a></li>
					<li><a href="<c:url value="/manager?command=ListInfoCategory&page=1"/>">资讯类别列表</a></li>
					<li><a href="<c:url value="/manager?command=AddInfoCategory&id=0"/>">增加类别目录</a></li>
					<li><a href="<c:url value="/manager?command=ListInfoComment&page=1"/>">资讯评论列表</a></li>
				</ul>
			</div>
		</div>
		<div class="clr"></div>
	</div>
</div>

<%@ include file="/views/common/footer.jsp"%>