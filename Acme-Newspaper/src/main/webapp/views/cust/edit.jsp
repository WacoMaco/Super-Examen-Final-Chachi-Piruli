
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib prefix="acme" tagdir="/WEB-INF/tags" %>

<form:form action="cust/admin/edit.do" modelAttribute="custForm" >


	<form:hidden path="id"/>
	<form:hidden path="version"/>

	
	<acme:textbox code="cust.title" path="title"/>
	<br />
	
	<acme:textarea code="cust.description" path="description"/>
	<br />
	
	<acme:textbox code="cust.moment" path="moment"/>
	<br />
	
	<acme:textbox code="cust.gauge" path="gauge"/>
	<br />
	
	<acme:select items="${newspapers}" itemLabel="title" code="cust.newspaper" path="newspaper"/>
	
	<spring:message code="cust.isDraft"/>
	<form:checkbox path="isDraft"/> 
	<form:errors path="isDraft"/>
	<br />
	
	<input type="submit" name="save" id="save"
		value="<spring:message code="cust.save" />" />&nbsp; 
	<jstl:if test="${custForm.id != 0 }">
	<input type="submit" name="delete" id="delete"
		value="<spring:message code="cust.delete" />" />&nbsp; 
	</jstl:if>
	<input type="button" name="cancel"
		value="<spring:message code="cust.cancel" />"
		onclick="javascript: relativeRedir('');" />
	<br />
<jstl:out value="${message}"/>
</form:form>






