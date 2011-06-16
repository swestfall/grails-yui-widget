package grails.yui.widget

class DialogTagLib {

    static namespace = "yuiWidget";

    def util = GrailsYuiWidgetUtil.getInstance();

    def yuiToolTip = { attrs, body ->

        //pull the config properties and set defaults
        def id = attrs.remove('id')
        def events = attrs.remove('events') ?: []
        def config = attrs.remove('config') ?: [:]
        def namespace = attrs.remove('namespace') ?: 'grails.yui.components'
        def props = attrs.remove('props') ?: []

        //set ids
        def elementID = "grailsYuiToolTipEl_${id}"
        def toolTipID = "${namespace}.grailsYuiToolTip_${id}"

        out << """
<script type="text/javascript">
    YAHOO.util.Event.onDOMReady(function(){
        ${toolTipID} = new YAHOO.widget.Tooltip("${elementID}", ${util.toJSON(config)});
        grails.yui.util.applyConfig(${toolTipID}, ${util.toJSON(props)});
        ${util.buildEventStrings(toolTipID, events).join()}
     });
</script>
        """
    }

    def yuiSimpleDialog = { attrs, body ->

    }
}
