<%@ page contentType="text/html; charset=UTF-8" language="java"
	pageEncoding="UTF-8" session="true"%>
<%@ include file="/views/common/header.jsp"%>
<%@ include file="/views/common/banner.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/SingImageUpload.js"></script>
<style type="text/css">
<!--
tr{width:100%}
-->
</style>
<div class="container" id="main">
	<div class="containerBox">
		<div class="boxHeader">
			<h2>用户管理</h2>
		</div>
		<div class="content">
			<div class="newTips"></div>

			<div class="cLine">
				<h3 class="left">
					<!-- <a
						href="<c:url value="/manager"/>?command=Subject&exam=<c:out value="${exam.id}" />">活动：<c:out
							value="${exam.name}" /></a><span
						style="color: #979797; font-weight: normal;"></span> -->
						<p style="color:#4C7E05">账户：<br></p>
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
				action="<c:url value="/manager"/>?command=SaveAccount&id=<c:out value="${accountv.id}"/>"
				name="ware<c:out value="${status.count}" />" onSubmit="return Validator.Validate(this,3)" 
				method="post">
				<table>
					<tr>
						<td>用户名<br></td>
						<td><input name="email" id="email"
							value="<c:out value="${accountv.email}" />" size="40" type="text" 
							dataType="Require" msg="请输入邮箱"/>
							
						</td>
					</tr>
					<tr>
						<td>姓名</td>
						<td><input name="nickname" id="nickname"
							value="<c:out value="${accountv.nickname}" />" size="40" type="text" />
						</td>
					</tr>
					<tr>
						<td>密码</td>
						<td><input name="password" id="password"
							value="<c:out value="${accountv.password}" />" size="40" type="password" 
							dataType="Require" msg="请输入密码"/>
							</td>
					</tr>	
					<tr>
						<td>权限</td>
						<td><select id="purview" name="purview">
							<option value="0">普通</option>
							<option value="99">管理员</option>
						</select>
					</tr>	
					<tr>
						<td>电话</td>
						<td><input name="tel" id="tel"
							value="<c:out value="${accountv.tel}" />" size="40" type="text" />
					</tr>	
					<!-- <tr>
						<td>email</td>
						<td><input name="email" id="email"
							value="<c:out value="${accountv.email}" />" size="40" type="text" 
							dataType="Email" msg="格式错误"/>
						</td> 
					</tr> -->
					<tr>
						<td>头像</td>
						<td><input name="image" id="image"
							value="<c:out value="${accountv.image}" />" size="60" type="text" />
							<input id="imageUpload" name="imageUpload" onclick="upImage();" value="上传图片" type="button"/>
					</tr>
					<tr>
						<td>城市</td>
						<td><input name="city" id="city"
							value="<c:out value="${accountv.city }" />" size="80" type="text" />
							<!-- <input name="id" id="id" value="<c:out value="${ware.id}" />"
							type="hidden" /></td> -->
					</tr>	
					<tr>
						<td>住址</td>
						<td><input name="address" id="address"
							value="<c:out value="${accountv.address }" />" size="80" type="text" />
					</tr>
					<tr>
						<td>性别</td>
						<td><select id="sex" name="sex">
								<option value="0">男</option>
								<option value="1">女</option>
							</select>
							</td>
					</tr>
					<tr>
						<td>生日</td>
						<td><input id="birthDay" name="birthDay" type="text" value="${accountv.birthDay}" 
						readonly="readonly" onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm',minDate:'2008-03-08 11:30',maxDate:'2100-03-10 20:59'})"></td>
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
				<ul><li><a href="<c:url value="/manager?command=ListAccount"/>">用户列表</a></li>       
					<li class="selected"><a href="<c:url value="/manager?command=AddAccount"/>">添加用户</a></li>
				</ul>       
			</div>     
		</div> 
		<div class="clr"></div>
	</div>
</div>
<script type="text/javascript">
	var sexCode=<c:out value="${accountv.sex}"/>;
	$("#sex option").each(function(){
		if($(this).val()==sexCode){
			$(this).attr("selected","selected");
		}
	});
</script>
<script type="text/javascript">
	var statusCode=<c:out value="${accountv.status}"/>;
	$("#status option").each(function(){
		if($(this).val()==statusCode){
			$(this).attr("selected","selected");
		}
	});
</script>
<script type="text/javascript">
	var purivewCode=<c:out value="${accountv.purview}"/>
	$("#purview option").each(function(){
		if(purivewCode==$(this).val()){
		$(this).attr("selected","selected");
		}
	});
</script>
<%@ include file="/views/common/footer.jsp"%>