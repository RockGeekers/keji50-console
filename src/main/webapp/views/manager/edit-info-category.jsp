<%@ page contentType="text/html; charset=UTF-8" language="java"
	pageEncoding="UTF-8" session="true"%>
<%@ include file="/views/common/header.jsp"%>
<%@ include file="/views/common/banner.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/editnews.js"></script>
<div class="container" id="main">
	<div class="containerBox">
		<div class="boxHeader">
			<h2>增加资讯类别</h2>
		</div>
		<div class="content">
			<div class="newTips"></div>

			<div class="cLine">
				<h3 class="left">
					<p style="color: #4C7E05">资讯类别：</p>
				</h3>
				&nbsp;&nbsp;<font color="red"><c:out value="${msg}" /></font>
				<div class="clr"></div>
			</div>
			<form action="<c:url value="/manager"/>?command=SaveInfoCategory&id=<c:out value="${category.id}"/>" name="category<c:out value="${status.count}" />" method="post" onSubmit="return Validator.Validate(this,3)">
				<table>
					<tr>
						<td>类别名称</td>
						<td><input name="name" id="name" value="<c:out value="${category.name}" />" size="60" type="text" dataType="Require" msg="请输入类别名称" /></td>
					</tr>
					<tr>
						<td>类别代码</td>
						<td><input name="code" id="code" value="<c:out value="${category.code}" />" size="60" type="text" dataType="Require" msg="请输入类别代码" /></td>
					</tr>


					<tr>
						<td>类别颜色</td>
						<td><input name="color_code" id="color_code" value="<c:out value="${category.color_code}" />" size="60" type="text" dataType="Require" msg="请输入类别颜色代码" /></td>
					</tr>

					<tr>
						<td>状态</td>
						<td>
							<select name="state" id="state">
								<option value="c" <c:if test="${category.state == 'c'}">selected</c:if>>草稿		
								<option value="s" <c:if test="${category.state == 's'}">selected</c:if>>已审核	
								<option value="d" <c:if test="${category.state == 'd'}">selected</c:if>>已删除	
							</select>
						</td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" value="提交" /></td>
					</tr>
				</table>
			</form>
		</div>
		<div class="sideBar">
			<div class="catalogList">
				<ul>
					<li><a
						href="<c:url value="/manager?command=ListInfo&page=1"/>">资讯列表</a></li>
					<li><a
						href="<c:url value="/manager?command=AddInfo&id=0"/>">发表资讯</a></li>
					<li><a
						href="<c:url value="/manager?command=ListInfoCategory&page=1"/>">资讯类别列表</a></li>
					<li class="selected"><a
						href="<c:url value="/manager?command=AddInfoCategory&id=0"/>">增加类别目录</a></li>
					<li><a href="<c:url value="/manager?command=ListInfoComment&page=1"/>">资讯评论列表</a></li>
				</ul>
			</div>
		</div>
		<div class="clr"></div>
	</div>
</div>
<%@ include file="/views/common/footer.jsp"%>