<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<link href="${path }/css/menuCss.css?ver=1" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery.js"></script>
<c:if test="${empty id }">
	<link href="${path }/css/logout.css?ver=1" type="text/css" rel="stylesheet" />
</c:if>
<c:if test="${not empty id }">
	<link href="${path }/css/login.css?ver=1" type="text/css" rel="stylesheet" />
</c:if>