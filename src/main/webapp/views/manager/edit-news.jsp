<%@ page contentType="text/html; charset=UTF-8" language="java"
	pageEncoding="UTF-8" session="true"%>
<%@ include file="/views/common/header.jsp"%>
<%@ include file="/views/common/banner.jsp"%>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/static/js/editnews.js"></script>
<div class="container" id="main">
	<div class="containerBox">
		<div class="boxHeader">
			<h2>活动管理</h2>
		</div>
		<div class="content">
			<div class="newTips"></div>

			<div class="cLine">
				<h3 class="left">
					<!-- <a
						href="<c:url value="/manager"/>?command=Subject&exam=<c:out value="${exam.id}" />">活动：<c:out
							value="${exam.name}" /></a><span
						style="color: #979797; font-weight: normal;"></span> -->
					<p style="color:#4C7E05">活动：</p>
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
			<form
				action="<c:url value="/manager"/>?command=SaveNews&id=<c:out value="${news.id}"/>"
				name="news<c:out value="${status.count}" />" method="post"
				onSubmit="return Validator.Validate(this,3)">
				<table>
					<tr>
						<td>活动名称</td>
						<td><input name="title" id="title"
							value="<c:out value="${news.title}" />" size="80" type="text"
							dataType="Require" msg="请输入活动名" /></td>
					</tr>
					<tr>
					<td>排序</td>
					<td>
						<input name="sort" id="title" value="<c:out value="${news.sort}" />" 
							size="20" type="text" dataType="Number" msg="请输入数字"/>
					</td>
		</tr>
				
				
					<!--  <tr>
						<td>活动类别</td>
						<td><select name="cate" id="cate">
								<c:forEach var="cate" items="${catelist }"
									varStatus="cateStatus">
									<option value="${cate.id }">${cate.name }</option>
								</c:forEach>
						</select></td>
					</tr>
					-->
					<tr>
						<td>活动图片</td>
						<td><input type="text" id="image" name="image" size="60"
							value="<c:out value="${news.image}" />" /> <input
							id="imageUpload" name="imageUpload" onclick="upImage();"
							value="上传图片" type="button" /></td>
					</tr>
					
					<tr>
						<td>活动摘要</td>
						<td><textarea id="digest" msg="请输入活动摘要" datatype="Require" cols="70" rows="4" name="digest" ><c:out value="${news.digest}" /></textarea></td>
					</tr>
					
					<tr>
						<td>活动内容</td>
						<td><script id="text" type="text/plain">
				<c:if test="${empty news.text}">活动内容</c:if>
				<c:if test="${not empty news}"><c:out escapeXml="false" value="${news.text}" /></c:if>
			</script></td>
					</tr>
					<tr>
						<td>开始时间</td>
						<td><input id="startTime" name="startTime" type="text"  msg="请选择时间"
						<c:if test="${news.startTime ne def }">
							value="<fmt:formatDate value="${news.startTime}" pattern= "yyyy-MM-dd HH:mm:ss" type="time" timeStyle="full"/>" readonly="readonly"
							onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'2008-03-08 11:30:00',maxDate:'2100-03-10 20:59:30'})"
						</c:if>
						<c:if test="${news.startTime eq def }">
							value="" readonly="readonly"
							onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'2008-03-08 11:30:00',maxDate:'2100-03-10 20:59:30'})"
						</c:if>
					></td>
					</tr>
					<tr>
						<td>结束时间</td>
						<td><input id="endTime" name="endTime" type="text"   msg="请选择时间"
						<c:if test="${news.endTime ne def }">
							value="<fmt:formatDate value="${news.endTime}" pattern= "yyyy-MM-dd HH:mm:ss" type="time" timeStyle="full"/>" readonly="readonly"
							onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'2008-03-08 11:30:00',maxDate:'2100-03-10 20:59:30'})"
					    </c:if>
						<c:if test="${news.endTime eq def }">
							value="" readonly="readonly"
							onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'2008-03-08 11:30:00',maxDate:'2100-03-10 20:59:30'})"
					    </c:if>
					    ></td>
					</tr>


					<tr>
						<td colspan="2"><input type="submit" value="提交" /></td>
					</tr>
				</table>
			</form>

			<!-- 	
			<div class="cLine">              
				 <div class="pageNavigator right">       
				 	<span><a class="prePage textDisable" href="#">上一页</a></span>
				 	<span class="pageNum">&nbsp;&nbsp;1&nbsp;/&nbsp;4&nbsp;&nbsp;</span>
				 	<span><a class="nextPage" href="#">下一页</a></span>
				 </div>      
			</div>
			 -->
		</div>
		<div class="sideBar">
			<div class="catalogList">
				<ul>

					<!--<li><a
						href="<c:url value="/manager?command=ListCate&page=1"/>">活动分类</a></li>-->
					<li><a
						href="<c:url value="/manager?command=ListNews&page=1"/>">活动列表</a></li>
					<li class="selected"><a
						href="<c:url value="/manager?command=AddNews&id=0"/>">增加活动</a></li>

				</ul>
			</div>
		</div>
		<div class="clr"></div>
	</div>
</div>
<script type="text/javascript">
	var option = {
		initialContent : '编写活动内容...',//初始化编辑器的内容 
		textarea : 'text',//设置提交时编辑器内容的名字 
	}	
	var editor = new baidu.editor.ui.Editor(option);//new一个对象，通过对象创建编辑器 
	editor.render("text");
</script>

<%@ include file="/views/common/footer.jsp"%>