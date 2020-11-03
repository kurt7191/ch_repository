<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ include file="include.jsp"%>
<!DOCTYPE html>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:insertAttribute name="title"/></title>
</head>
<body style="width:1000px; margin:0 auto;">
<div><tiles:insertAttribute name="header" /></div>
<hr>
<div><tiles:insertAttribute name="menu" /></div>
<hr><hr>
<div align="center" style="overflow-y:auto;overflow-x:hidden;height:500px;"><tiles:insertAttribute name="body" /></div>
<hr><hr>
<div id="foot"><tiles:insertAttribute name="footer" /></div>
</body>
</html>