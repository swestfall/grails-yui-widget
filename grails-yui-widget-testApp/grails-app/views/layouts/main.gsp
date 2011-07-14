<!DOCTYPE html>

<html>
    <head>
        <title>
            <g:layoutTitle default="Grails"/>
        </title>

        %{--<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">--}%
        %{--<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-STORE">--}%

        <g:layoutHead/>

        <!-- yui2 global resources -->
        <link type="text/css" rel="stylesheet" href="${createLinkTo(dir: 'js/yui-2.9.0/reset-fonts-grids', file: 'reset-fonts-grids.css')}"/>
        <link type="text/css" rel="stylesheet" href="${createLinkTo(dir: 'js/yui-2.9.0/assets/skins/sam', file: 'skin.css')}">
        <script type="text/javascript" src="${createLinkTo(dir: 'js/yui-2.9.0/yahoo-dom-event', file: 'yahoo-dom-event.js')}"></script>
        <script type="text/javascript" src="${createLinkTo(dir: 'js/yui-2.9.0/element', file: 'element-min.js')}"></script>
        <script type="text/javascript" src="${createLinkTo(dir: 'js/yui-2.9.0/utilities', file: 'utilities.js')}"></script>
        <script type="text/javascript" src="${resource(dir: 'js/yui-2.9.0/animation', file: 'animation.js')}"></script>
        <script type="text/javascript" src="${resource(dir: 'js/yui-2.9.0/dragdrop', file: 'dragdrop.js')}"></script>

        <!-- yui2 datasource resources -->
        <script type="text/javascript" src="${createLinkTo(dir: 'js/yui-2.9.0/datasource', file: 'datasource.js')}"></script>

        <!-- yui2 datatable resources -->
        <link type="text/css" rel="stylesheet" href="${resource(dir: 'js/yui-2.9.0/datatable/assets/skins/sam', file: 'datatable.css')}"/>
        <script type="text/javascript" src="${createLinkTo(dir: 'js/yui-2.9.0/datatable', file: 'datatable-min.js')}"></script>
        <script type="text/javascript" src="${createLinkTo(dir: 'js/yui-2.9.0/container', file: 'container_core-min.js')}"></script>
        <script type="text/javascript" src="${createLinkTo(dir: 'js/yui-2.9.0/menu', file: 'menu-min.js')}"></script>

        <!-- yui2 autocomplete resources -->
        <link type="text/css" rel="stylesheet" href="${resource(dir: 'js/yui-2.9.0/autocomplete/assets/skins/sam', file: 'autocomplete.css')}"/>
        <script type="text/javascript" src="${resource(dir: 'js/yui-2.9.0/autocomplete', file: 'autocomplete.js')}"></script>

        <!-- yui2 paginator resources -->
        <link type="text/css" rel="stylesheet" href="${resource(dir: 'js/yui-2.9.0/paginator/assets/skins/sam', file: 'paginator.css')}"/>
        <script type="text/javascript" src="${resource(dir: 'js/yui-2.9.0/paginator', file: 'paginator-min.js')}"></script>

        <!-- yui2 container resources -->
        <link type="text/css" rel="stylesheet" href="${resource(dir: 'js/yui-2.9.0/container/assets/skins/sam', file: 'container.css')}"/>
        <script type="text/javascript" src="${resource(dir: 'js/yui-2.9.0/container', file: 'container-min.js')}"></script>

        <!-- yui2 button resources -->
        <link type="text/css" rel="stylesheet" href="${resource(dir: 'js/yui-2.9.0/button/assets/skins/sam', file: 'button.css')}"/>
        <script type="text/javascript" src="${resource(dir: 'js/yui-2.9.0/button', file: 'button-min.js')}"></script>

        <!-- yui2 calendar resources -->
        <link type="text/css" rel="stylesheet" href="${resource(dir: 'js/yui-2.9.0/calendar/assets/skins/sam', file: 'calendar.css')}"/>
        <script type="text/javascript" src="${resource(dir: 'js/yui-2.9.0/calendar', file: 'calendar-min.js')}"></script>

        <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}"/>
        <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon"/>

        <yuiWidget:javascript/>

    </head>
    <body class="yui-skin-sam">
        <div id="spinner" class="spinner" style="display:none;">
            <img src="${resource(dir: 'images', file: 'spinner.gif')}" alt="${message(code: 'spinner.alt', default: 'Loading...')}"/>
        </div>
        <div id="grailsLogo"><a href="http://grails.org"><img src="${resource(dir: 'images', file: 'grails_logo.png')}" alt="Grails" border="0"/></a></div>
        <g:layoutBody/>
    </body>
</html>