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
                grails.yui.components.grailsYuiDialog_dialog1.render('container')
                grails.yui.components.grailsYuiDialog_dialog1.show();
            }

            window.hideDialog = function() {
                grails.yui.components.grailsYuiDialog_dialog1.hide();
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

        <yuiWidget:yuiDialog
                id="dialog1"
                config="${[
                        width : '30em',
					    fixedcenter : true,
					    visible : false,
					    draggable: true,
					    close: true,
					    fixedCenter: true,
						constraintoviewport : true,
                        buttons: [
                                [text: 'Yes', handler: '@window.handleYes', isDefault: true],
                                [text: 'No', handler: '@window.handleNo']
                        ]]}"
                methods="${['setHeader(\'This is the modal\')']}"/>


        <div id="dialog1">
            <div class="hd">Please enter your information</div>
                <div class="bd">
                <form method="POST" action="assets/post.php">
                    <label for="firstname">First Name:</label><input type="textbox" name="firstname"/>
                    <label for="lastname">Last Name:</label><input type="textbox" name="lastname"/>
                    <label for="email">E-mail:</label><input type="textbox" name="email"/>

                    <label for="state[]">State:</label>
                    <select multiple name="state[]">
                        <option value="California">California</option>
                        <option value="New Jersey">New Jersey</option>
                        <option value="New York">New York</option>
                    </select>

                    <div class="clear"></div>

                    <label for="radiobuttons">Radio buttons:</label>
                    <input type="radio" name="radiobuttons[]" value="1" checked/> 1
                    <input type="radio" name="radiobuttons[]" value="2"/> 2

                    <div class="clear"></div>

                    <label for="check">Single checkbox:</label><input type="checkbox" name="check" value="1"/> 1

                    <div class="clear"></div>

                    <label for="textarea">Text area:</label><textarea name="textarea"></textarea>

                    <div class="clear"></div>

                    <label for="cbarray">Multi checkbox:</label>
                    <input type="checkbox" name="cbarray[]" value="1"/> 1
                    <input type="checkbox" name="cbarray[]" value="2"/> 2
                </form>
            </div>
        </div>

    </body>
</html>