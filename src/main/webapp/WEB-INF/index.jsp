<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tacos</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
    <h1>This is a table!</h1>
    <table>
    	<tr>
    		<th>Expense</th>
    		<th>Vendor</th>
    		<th>Amount</th>
    	</tr>
		<c:forEach var="expense" items="${ allExpenses }">
			<tr>
				<td><c:out value="${ expense.name }"></c:out></td>
				<td><c:out value="${ expense.vendor }"></c:out></td>
				<td><c:out value="${ expense.amount }"></c:out></td>
			</tr>
		</c:forEach>
    </table>
    <form:form action="/expenses" method="post" modelAttribute="expense">
	    <p>
	        <form:label path="name">Expense Name:</form:label>
	        <form:input path="name"/>
	    </p>
	    <p>
	        <form:errors path="name"/>	    
	    </p>
	    <p>
	        <form:label path="vendor">Vendor:</form:label>
	        <form:textarea path="vendor"/>
	    </p>
	    <p>
	        <form:errors path="vendor"/>	    
	    </p>
	    <p>
	        <form:label path="amount">Amount</form:label>
	        <form:input type="double" path="amount"/>
	    </p>
	    <p>
	        <form:errors path="amount"/>	    
	    </p>
	    <p>
	        <form:label path="description">Description</form:label>
	        <form:input path="description"/>
	    </p>    
	    <p>	    
	        <form:errors path="description"/>
	    </p>
	    <input type="submit" value="Submit"/>
	</form:form>  
</body>
</html>