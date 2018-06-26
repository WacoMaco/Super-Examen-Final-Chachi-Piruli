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
<td class ="left-display"> <strong> <spring:message code="cust.symbol" /> : </strong> </td>
<td class="right-display">  <jstl:out value = "${cust.symbol}"/> &nbsp;  </td>
</tr>

<tr>
<td class ="left-display"> <strong> <spring:message code="cust.title" /> : </strong> </td>
<td class="right-display">  <jstl:out value = "${cust.title}"/> &nbsp;  </td>
</tr>



<tr>
<td class ="left-display"> <strong> <spring:message code="cust.description" /> : </strong> </td>
<td class="right-display">  <jstl:out value = "${cust.description}"/> &nbsp;  </td>
</tr>

<tr>
<spring:message code="cust.pattern" var="format" />
<td class ="left-display"> <strong> <spring:message code="cust.moment" /> : </strong> </td>
<td class="right-display">  <fmt:formatDate  value="${cust.moment}" pattern="${format}"/>   </td>
</tr>


	<jstl:if test="${cust.gauge == 1 }"> <jstl:set var="color" value="black"/> </jstl:if>
		<jstl:if test="${cust.gauge == 2 }"> <jstl:set var="color" value="greenyellow"/> </jstl:if>
		<jstl:if test="${cust.gauge == 3 }"> <jstl:set var="color" value="darkviolet"/> </jstl:if>

<tr>
<td class ="left-display"> <strong> <spring:message code="cust.gauge" /> : </strong> </td>
<td style="background:${color}" class="right-display">  ${cust.gauge } </td>
</tr>


<tr>
<td class ="left-display"> <strong> <spring:message code="cust.creator" /> : </strong> </td>
<td class="right-display">  <jstl:out value="${cust.creator.name}" /> &nbsp; </td>
</tr>


</table>

