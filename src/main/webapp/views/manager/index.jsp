<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" session="true"%>
<%@ include file="/views/common/header.jsp" %>
<%@ include file="/views/common/banner.jsp" %>
<div class="container" id="main">
	<div class="containerBox">                     
		<div class="boxHeader">         
			<h2></h2>       
		</div>   
		 
		<br/>
		<form name="login" action="<c:url value="/manager?command=Login"/>" method="post" onSubmit="return Validator.Validate(this,3)">
			<table align="center">
			<tr><td>账号：</td><td><input type="text" name="username"  dataType="LimitB" min="4" msg=""/></td></tr>
			<tr><td>密码：</td><td><input type="password" name="password" dataType="LimitB" min="4" msg=""/></td></tr>
			<tr><td colspan="2"><div align="center">
			  <input type="submit" value="登录"/>
			  </div></td></tr>
		  </table>
		  </form>
		   
		<br/>
		<div class="clr"></div>     
	</div>
</div>
<%@ include file="/views/common/footer.jsp"%>
