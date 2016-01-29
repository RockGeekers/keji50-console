<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="ueditor.Uploader" %>



<%
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");
	String path="upload";
    Uploader up = new Uploader(request);
    up.setSavePath(path); //保存路径
    String[] fileType = {".rar" ,".mp3" , ".doc" , ".docx" , ".zip" , ".pdf" , ".txt" , ".swf", ".wmv"};  //允许的文件类型
    up.setAllowFiles(fileType);
    up.setMaxSize(100000);        //允许的文件最大尺寸，单位KB
    up.upload();
    response.getWriter().print("{'url':'"+up.getUrl()+"','fileType':'"+up.getType()+"','state':'"+up.getState()+"','original':'"+up.getOriginalName()+"'}");

%>
