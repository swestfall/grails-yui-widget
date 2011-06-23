
<%@ page import="grails.yui.widget.testApp.Stock" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'stock.label', default: 'Stock')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'stock.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="change" title="${message(code: 'stock.change.label', default: 'Change')}" />
                        
                            <g:sortableColumn property="company" title="${message(code: 'stock.company.label', default: 'Company')}" />
                        
                            <g:sortableColumn property="lastChange" title="${message(code: 'stock.lastChange.label', default: 'Last Change')}" />
                        
                            <g:sortableColumn property="percentChange" title="${message(code: 'stock.percentChange.label', default: 'Percent Change')}" />
                        
                            <g:sortableColumn property="price" title="${message(code: 'stock.price.label', default: 'Price')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${stockInstanceList}" status="i" var="stockInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${stockInstance.id}">${fieldValue(bean: stockInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: stockInstance, field: "change")}</td>
                        
                            <td>${fieldValue(bean: stockInstance, field: "company")}</td>
                        
                            <td><g:formatDate date="${stockInstance.lastChange}" /></td>
                        
                            <td>${fieldValue(bean: stockInstance, field: "percentChange")}</td>
                        
                            <td>${fieldValue(bean: stockInstance, field: "price")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${stockInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
