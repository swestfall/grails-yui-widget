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
        <title>Collection of Extensible Pages</title>
        <meta name="layout" content="main"/>
    </head>
    <body>
        <a href="${createLink(controller: 'local', action: 'liquidDataTable')}">Liquid Data Table Example</a>
        <br />
        <a href="${createLink(controller: 'local', action: 'preDefRemoteDataTable')}">Example of PreDefined DataTable</a>
        <br />
        <a href="${createLink(controller: 'local', action: 'formCalendar')}">Example of Form Calendar</a>
    </body>
</html>