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
                grails.yui.components.grailsYuiPanel_panel1.render('container')
                grails.yui.components.grailsYuiPanel_panel1.show();
            }

            window.hideDialog = function() {
                grails.yui.components.grailsYuiPanel_panel1.hide();
            }

        </script>

    </head>
    <body>

        <div>Example of a YUI Simple Dialog</div>
        <a href="http://developer.yahoo.com/yui/examples/container/dialog-quickstart.html">YUI Dialog Sample Page</a>

        <div id="container">
            <button id="show" onclick="window.showDialog(event)">Show Dialog</button>
            <button id="hide" onclick="window.hideDialog(event)">Hide Dialog</button>
        </div>

        <yuiWidget:yuiPanel
                id="panel1"
                config="${[
                    width: '240px',
                    fixedcenter: true,
                    close: false,
                    draggable: true,
                    zindex: 4,
                    modal: false,
                    visible: false]}"
                methods="${[
                    'setHeader(\'Loading, please wait...\')']}"/>

        <div id="panel1">
            <div class="bd">
                <img src="http://l.yimg.com/a/i/us/per/gr/gp/rel_interstitial_loading.gif"/>
            </div>
        </div>

    </body>
</html>