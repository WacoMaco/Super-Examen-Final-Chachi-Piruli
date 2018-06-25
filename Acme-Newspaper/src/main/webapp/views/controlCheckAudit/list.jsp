
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

<display:table class="displaytag" 
	name="controlCheckAudits" requestURI="controlCheckAudit/admin/list.do" id="row">


	<!-- title -->
	<spring:message code="controlCheckAudit.title"
		var="titleHeader" />
	<display:column property="controlTitle" title="${titleHeader}"
		 />


	<!-- description -->
	<spring:message code="controlCheckAudit.description"
		var="descriptionHeader" />
	<display:column property="controlDescription" title="${descriptionHeader}"
		 />
		
	
	<!-- moment --> <!-- format para internacionalizacion -->
 	<spring:message code="controlCheckAudit.format"
  	var="format" />
 	<spring:message code="controlCheckAudit.moment"
  	var="momentHeader" />
 	<display:column property="controlMoment" title="${momentHeader}"
  	 format = "${format}"/>
  	
  	<display:column>
  	<jstl:if test="${row.isDraft == true }">
  	<a href="controlCheckAudit/admin/edit.do?controlCheckAuditId=${row.id}">
			<spring:message code="article.edit" /> </a>
	</jstl:if>
  	</display:column>
  	
</display:table>

<spring:message code="datatables.locale.lang" var="tableLang"/>
<spring:message code="datatables.moment.format" var="tableFormatMoment"/>
<script>
$(document).ready( function () {	
	$.fn.dataTable.moment('${tableFormatMoment}');
	
    $('#row').dataTable( {
    	"language": {
        	"url": '${tableLang}'
    	},
		"lengthMenu": [ 5, 10, 25, 50, 100 ]
    } );
} );
</script>
