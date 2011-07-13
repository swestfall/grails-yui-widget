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

        <div>Form DatePicker via Custom Tag</div>

        <script type="text/javascript">
            window.handleCalendarSelect = function(sEvent, aDate, oContext) {
                var newDate = oContext.calID.getSelectedDates()[0]
                var dateEl = document.getElementById(oContext.inputID)
                dateEl.value = YAHOO.util.Date.format(newDate, {format: "%m/%d/%Y"})
                oContext.dialogID.hide()
            }
            window.handleCalendarBeforeShow = function(sEvent, aDate, oContext) {
                //this is odd... taglib cant reference an js obj literal before its defined.  so, namespace & id are
                //passed in, and reference is manually built.  poor implementation - not happy w/ this.
                var oCal = oContext.namespace['grailsYuiCalendar_' + oContext.calID];
                var sDate = document.getElementById(oContext.inputID).value;
                var oDate = new Date(sDate)
                if (!isNan(oDate.getTime())) {
                    oCal.select(oDate)
                    oCal.render()
                }
            }
        </script>

        <local:formCalendar
                id="formCal"
                inputID="formCal"/>

    </body>
</html>