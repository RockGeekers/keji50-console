<%@ page contentType="text/html; charset=UTF-8" language="java"
	pageEncoding="UTF-8" session="true"%>
<%@ include file="/views/common/header.jsp"%>
<%@ include file="/views/common/banner.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/editnews.js"></script>
<div class="container" id="main">
	<div class="containerBox">
		<div class="boxHeader">
			<h2>发表资讯</h2>
		</div>
		<div class="content">
			<div class="newTips"></div>

			<div class="cLine">
				<h3 class="left">
					<p style="color: #4C7E05">资讯：</p>
				</h3>
				&nbsp;&nbsp;<font color="red"><c:out value="${msg}" /></font>
				<div class="clr"></div>
			</div>
			<form action="<c:url value="/manager"/>?command=SaveInfo&id=<c:out value="${info.id}"/>" name="info<c:out value="${status.count}" />" method="post" onSubmit="return Validator.Validate(this,3)">
				<table>
					<tr>
						<td>资讯名称</td>
						<td><input name="title" id="title" value="<c:out value="${info.title}" />" size="80" type="text" dataType="Require" msg="请输入文章标题" /></td>
					</tr>
					<tr>
						<td>主题图片</td>
						<td>
							<input type="text" id="image" name="image" size="80" value="<c:out value="${info.image}" />" /> 
							<input id="imageUpload" name="imageUpload" onclick="upImage();" value="上传图片" type="button" />
						</td>
					</tr>


					<tr>
						<td>资讯摘要</td>
						<td><textarea id="short_desc" msg="请输入资讯摘要" datatype="Require" cols="80" rows="4" name="short_desc"><c:out value="${info.short_desc}" /></textarea></td>
					</tr>

					<tr>
						<td>资讯内容</td>
						<td>
						<script id="content" type="text/plain">
							<c:if test="${empty info}">资讯内容</c:if>
							<c:if test="${not empty info}"><c:out escapeXml="false" value="${info.content}" /></c:if>
						</script>
						 </td>
					</tr>
					
					<tr>
						<td>资讯标签</td>
						<td><input name="tags" id="tags" value="<c:out value="${info.tags}" />" size="80" type="text"  msg="请输入资讯标签" /></td>
					</tr>
					<tr>
						<td>作者邮箱</td>
						<td>
							<input name="author_email" id="author_email" value="<c:out value="${author_email}" />" datatype="Require" size="80" type="text"  msg="请输入作者邮箱" />
						</td>
					</tr>
					<tr>
						<td>资讯类别</td>
						<td>
						<select name="info_category_id" id="info_category_id">
								<c:forEach var="category" items="${categories }" varStatus="cateStatus">
									<option value="${category.id }" <c:if test="${info.info_category_id == category.id }">selected</c:if>><c:out value="${category.name}" /></option>
								</c:forEach>
						</select>
						</td>
					</tr>
					<tr>
						<td>广告推荐</td>
						<td>
							<select name="suggest" id="suggest">
								<option value="0" <c:if test="${info.suggest == '0'}">selected</c:if>>否		
								<option value="1" <c:if test="${info.suggest == '1'}">selected</c:if>>是	
							</select>
						</td>
					</tr>
					<tr>
						<td>状态</td>
						<td>
							<select name="state" id="state">
								<option value="c" <c:if test="${info.state == 'c'}">selected</c:if>>草稿		
								<option value="s" <c:if test="${info.state == 's'}">selected</c:if>>已审核	
								<option value="d" <c:if test="${info.state == 'd'}">selected</c:if>>已删除	
							</select>
						</td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" value="提交" /></td>
					</tr>
				</table>
				<input type="hidden" id="create_date" name="create_date" value="<c:out value="${info.getCreate_datestr()}" />" />
				<input type="hidden" id="update_date" name="update_date" value="<c:out value="${info.getUpdate_datestr()}" />" />
			</form>
		</div>
		<div class="sideBar">
			<div class="catalogList">
				<ul>
					<li><a
						href="<c:url value="/manager?command=ListInfo&page=1"/>">资讯列表</a></li>
					<li class="selected"><a
						href="<c:url value="/manager?command=AddInfo&id=0"/>">发表资讯</a></li>
					<li><a
						href="<c:url value="/manager?command=ListInfoCategory&page=1"/>">资讯类别列表</a></li>
					<li><a
						href="<c:url value="/manager?command=AddInfoCategory&id=0"/>">增加类别目录</a></li>
					<li><a href="<c:url value="/manager?command=ListInfoComment&page=1"/>">资讯评论列表</a></li>
				</ul>
			</div>
		</div>
		<div class="clr"></div>
	</div>
</div>
<script type="text/javascript">
	var option = {
		initialContent : '编写资讯内容...',//初始化编辑器的内容 
		textarea : 'content',//设置提交时编辑器内容的名字 
	}
	var editor = new baidu.editor.ui.Editor(option);//new一个对象，通过对象创建编辑器 
	editor.render("content");
</script>

<%@ include file="/views/common/footer.jsp"%>