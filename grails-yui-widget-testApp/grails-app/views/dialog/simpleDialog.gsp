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
        <title>Example of YUI Simple Dialog</title>
        <meta name="layout" content="main"/>

        <style>
        #container {
            height: 12em;
        }
        </style>

        <script type="text/javascript">

            window.handleYes = function() {
                alert("You clicked yes!");
                this.hide();
            };

            window.handleNo = function() {
                this.hide();
            };

            window.showDialog = function() {
                grails.yui.components.grailsYuiSimpleDialog_simpleDialog1.show()
            }

            window.hideDialog = function() {
                grails.yui.components.grailsYuiSimpleDialog_simpleDialog1.show()
            }

        </script>

    </head>
    <body>

        <div>Example of a YUI Simple Dialog</div>
        <a href="http://developer.yahoo.com/yui/examples/container/simpledialog-quickstart.html">YUI Simple Dialog Sample Page</a>

        <div id="container">
            <button id="show" onclick="window.showDialog(event)">Show simpledialog1</button>
            <button id="hide" onclick="window.hideDialog(event)">Hide simpledialog1</button>
        </div>

        <yuiWidget:yuiSimpleDialog
                id="simpleDialog1"
                config="${[
                        width: '300px',
                        fixedCenter: true,
                        draggable: true,
                        close: true,
                        visible: false,
                        text: 'Do you want to continue',
                        icon: '@YAHOO.widget.SimpleDialog.ICON_HELP',
                        contraintoviewport: true,
                        buttons: [
                                [text: 'Yes', handler: '@window.handleYes', isDefault: true],
                                [text: 'No', handler: '@window.handleNo']
                        ]]}"
                methods="${['setHeader(\'Are you sure?\')', 'render(\'container\')']}"/>

    </body>
</html>