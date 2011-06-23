

<%@ page import="grails.yui.widget.testApp.Stock" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'stock.label', default: 'Stock')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${stockInstance}">
            <div class="errors">
                <g:renderErrors bean="${stockInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${stockInstance?.id}" />
                <g:hiddenField name="version" value="${stockInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="change"><g:message code="stock.change.label" default="Change" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: stockInstance, field: 'change', 'errors')}">
                                    <g:textField name="change" value="${fieldValue(bean: stockInstance, field: 'change')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="company"><g:message code="stock.company.label" default="Company" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: stockInstance, field: 'company', 'errors')}">
                                    <g:textField name="company" value="${stockInstance?.company}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="lastChange"><g:message code="stock.lastChange.label" default="Last Change" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: stockInstance, field: 'lastChange', 'errors')}">
                                    <g:datePicker name="lastChange" precision="day" value="${stockInstance?.lastChange}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="percentChange"><g:message code="stock.percentChange.label" default="Percent Change" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: stockInstance, field: 'percentChange', 'errors')}">
                                    <g:textField name="percentChange" value="${fieldValue(bean: stockInstance, field: 'percentChange')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="price"><g:message code="stock.price.label" default="Price" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: stockInstance, field: 'price', 'errors')}">
                                    <g:textField name="price" value="${fieldValue(bean: stockInstance, field: 'price')}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
