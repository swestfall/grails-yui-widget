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
        <title>Example of YUI AutoComplete with Local Data</title>
        <meta name="layout" content="main"/>
        <script type="text/javascript">
            grails = {};
            grails.yui = {};
            grails.yui.components = {};
            grails.yui.formatters = {};
        </script>
    </head>
    <body>

        <div>Example of a local data source</div>
        <a href="http://developer.yahoo.com/yui/examples/autocomplete/ac_basic_xhr.html">YUI 2 Example</a>

        <div style="width: 150px">
            <yuiWidget:yuiAutoComplete
                    id="id"
                    namespace="grails.yui.components">
                <yuiWidget:yuiXHRDataSource
                        url="${createLink(controller: 'autoComplete', action: 'searchStockByCompanyXML')}"
                        config="${[
                            responseType : '@YAHOO.util.DataSource.TYPE_XML',
                            responseSchema: [
                                    resultNode: 'map',
                                    fields: ['entry']
                            ]
                        ]}"/>
            </yuiWidget:yuiAutoComplete>
        </div>

    </body>
</html>