
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
	name="custs" requestURI="cust/admin/list.do" id="row">
	
	
		<!-- Symbol -->
	<spring:message code="cust.symbol"
		var="symbol" />
	<display:column property="symbol" title="${symbol}"
		 />


	<!-- title -->
	<spring:message code="cust.title"
		var="titleHeader" />
	<display:column property="title" title="${titleHeader}"
		 />


	<!-- description -->
	<spring:message code="cust.description"
		var="descriptionHeader" />
	<display:column property="description" title="${descriptionHeader}"
		 />
		 
	
	<!-- gauge -->
	<spring:message code="cust.gauge"
		var="gauge" />
		<jstl:if test="${row.gauge == 1 }"> <jstl:set var="color" value="lightyellow"/> </jstl:if>
		<jstl:if test="${row.gauge == 2 }"> <jstl:set var="color" value="Moccasin"/> </jstl:if>
		<jstl:if test="${row.gauge == 3 }"> <jstl:set var="color" value="Blue"/> </jstl:if>
		
	<display:column style="background:${color}" property="gauge" title="${gauge}"
		 />
		
	
	<!-- moment --> <!-- format para internacionalizacion -->
 	<spring:message code="cust.format"
  	var="format" />
 	<spring:message code="cust.moment"
  	var="momentHeader" />
 	<display:column property="moment" title="${momentHeader}"
  	 format = "${format}"/>
  	
  	<display:column>
  	<jstl:if test="${row.isDraft == true }">
  	<a href="cust/admin/edit.do?custId=${row.id}">
			<spring:message code="article.edit" /> </a>
	</jstl:if>
  	</display:column>
  	
</display:table>
			
<a href="cust/admin/create.do">
			<spring:message code="cust.create" /> </a>
			
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
