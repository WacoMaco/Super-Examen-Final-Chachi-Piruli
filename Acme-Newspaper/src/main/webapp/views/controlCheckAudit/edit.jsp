
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

<form:form action="controlCheckAudit/admin/edit.do" modelAttribute="controlCheckAuditForm" >


	<form:hidden path="id"/>
	<form:hidden path="version"/>

	
	<acme:textbox code="controlCheckAudit.title" path="controlTitle"/>
	<br />
	
	<acme:textarea code="controlCheckAudit.description" path="controlDescription"/>
	<br />
	
	<acme:textbox code="controlCheckAudit.moment" path="controlMoment"/>
	<br />
	
	<acme:textbox code="controlCheckAudit.gauge" path="gauge"/>
	<br />
	
	<acme:select items="${newspapers}" itemLabel="title" code="controlCheckAudit.newspaper" path="newspaper"/>
	
	<spring:message code="controlCheckAudit.isDraft"/>
	<form:checkbox path="isDraft"/> 
	<form:errors path="isDraft"/>
	<br />
	
	<input type="submit" name="save" id="save"
		value="<spring:message code="controlCheckAudit.save" />" />&nbsp; 
	<jstl:if test="${controlCheckAuditForm.id != 0 }">
	<input type="submit" name="delete" id="delete"
		value="<spring:message code="controlCheckAudit.delete" />" />&nbsp; 
	</jstl:if>
	<input type="button" name="cancel"
		value="<spring:message code="controlCheckAudit.cancel" />"
		onclick="javascript: relativeRedir('');" />
	<br />
<jstl:out value="${message}"/>
</form:form>






