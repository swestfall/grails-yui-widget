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
        <title>Example of PopUp Calendar</title>
        <meta name="layout" content="main"/>

        <style type="text/css">
        /* Clear calendar's float, using dialog inbuilt form element */
        #container .bd form {
            clear: left;
        }

        /* Have calendar squeeze upto bd bounding box */
        #container .bd {
            padding: 0;
        }

        #container .hd {
            text-align: left;
        }

        /* Center buttons in the footer */
        #container .ft .button-group {
            text-align: center;
        }

        /* Prevent border-collapse:collapse from bleeding through in IE6, IE7 */
        #container_c.yui-overlay-hidden table {
            *display: none;
        }

        /* Remove calendar's border and set padding in ems instead of px, so we can specify an width in ems for the container */
        #cal {
            border: none;
            padding: 1em;
        }

        /* Datefield look/feel */
        .datefield {
            position: relative;
            top: 10px;
            left: 10px;
            white-space: nowrap;
            border: 1px solid black;
            background-color: #eee;
            width: 25em;
            padding: 5px;
        }

        .datefield input,
        .datefield button,
        .datefield label {
            vertical-align: middle;
        }

        .datefield label {
            font-weight: bold;
        }

        .datefield input {
            width: 15em;
        }

        .datefield button {
            padding: 0 5px 0 5px;
            margin-left: 2px;
        }

        .datefield button img {
            padding: 0;
            margin: 0;
            vertical-align: middle;
        }

        /* Example box */
        .box {
            position: relative;
            height: 30em;
        }
        </style>

    </head>
    <body>

        <div>Example of a PopUp Calendar</div>
        <a href="http://developer.yahoo.com/yui/examples/calendar/calcontainer.html">PopUp Calendar</a>

        <div class="box">
            <div class="datefield">
                <label for="date">Date:</label>
                <input type="text" id="date" name="date" value=""/>
                <!-- onclick="grails.yui.components.grailsYuiDialog_exDialog.show()" -->
                <button type="button" id="show" title="Show Calendar" onclick="grails.yui.components.grailsYuiDialog_exDialog.show()">
                    <img src="assets/calbtn.gif" width="18" height="18" alt="Calendar">
                </button>
            </div>
        </div>

        <%
            def dialogMethods = [
                    'setHeader(\'Pick a Date\')',
                    'setBody(\'<div id=\"cal\"></div><div style=\"clear: both;\"></div>\')',
                    'render(document.body)'
            ]

        %>

        <script type="text/javascript">
            window.handleCalendarSelect = function() {
                var newDate = grails.yui.components.grailsYuiCalendar_exCal.getSelectedDates()[0]
                var dateEl = document.getElementById('date')
                dateEl.value = newDate.toString()
                grails.yui.components.grailsYuiDialog_exDialog.hide()
            }
        </script>


        <yuiWidget:yuiDialog
                id="exDialog"
                config="${[
                        visible:false,
                        draggable:false,
                        close:true,
                        context:['show', 'tl', 'bl']
                ]}"
                methods="${dialogMethods}"/>

        <yuiWidget:yuiCalendar
                id="exCal"
                container="cal"
                config="${[
                        iframe: false,
                        hide_blank_weeks: true
                ]}"
                methods="${[
                        'selectEvent.subscribe(window.handleCalendarSelect)',
                        'render()']}"/>

    </body>
</html>