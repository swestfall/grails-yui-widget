package grails.yui.widget

class CalendarTagLib {

    static namespace = "yuiWidget";

    def util = GrailsYuiWidgetUtil.getInstance();

    def yuiCalendar = { attrs, body ->

        //pull the config properties and set defaults
        def id = attrs.remove('id')
        def container = attrs.remove('container')
        def events = attrs.remove('events') ?: []
        def config = attrs.remove('config') ?: [:]
        def namespace = attrs.remove('namespace') ?: 'grails.yui.components'
        def props = attrs.remove('props') ?: []
        def methods = attrs.remove('methods') ?: []

        //set ids
        def calendarID = "${namespace}.grailsYuiCalendar_${id}"

        out << """
<script type="text/javascript">
    YAHOO.util.Event.onDOMReady(function(){
        ${calendarID} = new YAHOO.widget.Calendar("${container}", ${util.toJSON(config)});
        grails.yui.util.applyConfig(${calendarID}, ${util.toJSON(props)});
        ${util.buildEventStrings(calendarID, events).join()}
        ${util.buildMethodStrings(calendarID, methods).join()}
     });
</script>
        """
    }
}
