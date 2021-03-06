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
        <title>Example of Simple Tag Encapsulation</title>
        <meta name="layout" content="main"/>
    </head>
    <body>

        <%
            def columns = [
                    [key: "id", sortable: true, resizeable: true],
                    [key: "company", sortable: true, resizeable: true],
                    [key: "price", sortable: true, resizeable: true, formatter: 'currency'],
                    [key: "change", sortable: true, resizeable: true],
                    [key: "percentChange", sortable: true, resizeable: true],
                    [key: "lastChange", sortable: true, resizeable: true, formatter: '@grails.yui.formatters.formatDate']
            ]

        %>

        <div style="height: width: 100%; padding: 20px;">
            <local:liquidYuiDataTable
                    id="testTable"
                    columns="${columns}"
                    events="${[]}"
                    namespace="grails.yui.components"
                    config="${[caption: 'DataTable Caption']}">
                <yuiWidget:yuiLocalDataSource
                        data="${stocks}"
                        config="${[
                            responseType : '@YAHOO.util.DataSource.TYPE_JSARRAY',
                            responseSchema: [
                                    fields: ['id', 'company', 'price', 'change', 'percentChange', 'lastChange']
                            ]
                        ]}"/>
            </local:liquidYuiDataTable>
        </div>

    </body>
</html>