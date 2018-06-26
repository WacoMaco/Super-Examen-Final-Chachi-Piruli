<%--
 * 
 *
 * Copyright (C) 2017 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the 
 * TDG Licence, a copy of which you may download from 
 * http://www.tdg-seville.info/License.html
 --%>


<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<table class="displayStyle" >

<tr>
<td class ="left-display"> <strong> <spring:message code="controlCheckAudit.title" /> : </strong> </td>
<td class="right-display">  <jstl:out value = "${controlCheckAudit.controlTitle}"/> &nbsp;  </td>
</tr>



<tr>
<td class ="left-display"> <strong> <spring:message code="controlCheckAudit.description" /> : </strong> </td>
<td class="right-display">  <jstl:out value = "${controlCheckAudit.controlDescription}"/> &nbsp;  </td>
</tr>

<tr>
<td class ="left-display"> <strong> <spring:message code="controlCheckAudit.moment" /> : </strong> </td>
<td class="right-display">  <jstl:out value = "${controlCheckAudit.controlMoment}"/> &nbsp;  </td>
</tr>


	<jstl:if test="${controlCheckAudit.gauge == 1 }"> <jstl:set var="color" value="lightyellow"/> </jstl:if>
		<jstl:if test="${controlCheckAudit.gauge == 2 }"> <jstl:set var="color" value="Moccasin"/> </jstl:if>
		<jstl:if test="${controlCheckAudit.gauge == 3 }"> <jstl:set var="color" value="Blue"/> </jstl:if>

<tr>
<td class ="left-display"> <strong> <spring:message code="controlCheckAudit.gauge" /> : </strong> </td>
<td style="background:${color}" class="right-display">  ${controlCheckAudit.gauge } </td>
</tr>


<tr>
<td class ="left-display"> <strong> <spring:message code="controlCheckAudit.creator" /> : </strong> </td>
<td class="right-display">  <jstl:out value="${controlCheckAudit.creator.name}" /> &nbsp; </td>
</tr>


</table>

