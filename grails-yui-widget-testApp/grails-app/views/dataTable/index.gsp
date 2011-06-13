<%--
  Created by IntelliJ IDEA.
  User: swestfall
  Date: 6/9/11
  Time: 5:38 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <title>Collection of DataTable Example Pages</title>
        <meta name="layout" content="main"/>
    </head>
    <body>
        <a href="${createLink(controller: 'dataTable', action: 'localData')}">Local Data Example</a>
        <br/>
        <a href="${createLink(controller: 'dataTable', action: 'scrollingGrid')}">Scrolling Grid Example</a>
        <br/>
        <a href="${createLink(controller: 'dataTable', action: 'editableGrid')}">Editable Grid Example</a>
        <br/>
        <a href="${createLink(controller: 'dataTable', action: 'remoteJSONData')}">Remote JSON Example</a>
        <br/>
        <a href="${createLink(controller: 'dataTable', action: 'remoteJSONDataWithSorting')}">Remote JSON With Sorting Example</a>
        <br/>
        <a href="${createLink(controller: 'dataTable', action: 'remoteJSONDataWithPaging')}">Remote JSON With Paging Example</a>
    </body>
</html>