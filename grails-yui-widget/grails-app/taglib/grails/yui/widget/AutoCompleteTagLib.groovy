package grails.yui.widget

class AutoCompleteTagLib {

    static namespace = "yuiWidget";

    def util = GrailsYuiWidgetUtil.getInstance();

    def yuiAutoComplete = { attrs, body ->

        //pull the config properties and set defaults
        def id = attrs.remove('id')
        def events = attrs.remove('events') ?: []
        def namespace = attrs.remove('namespace') ?: 'grails.yui.components'
        def props = attrs.remove('props') ?: []
        def methods = attrs.remove('methods') ?: []

        //set ids
        def elementID = "grailsYuiAutoCompleteEl_${id}"
        def inputID = "grailsYuiAutoCompleteInputEl_${id}"
        def containerID = "grailsYuiAutoCompleteContainerEl_${id}"
        def autoCompleteID = "${namespace}.grailsYuiAutoComplete_${id}"
        def dataSourceID = "${namespace}.grailsYuiDataSource_${id}"

        //attach scope for consuming code
        pageScope.dataSourceID = dataSourceID

        out << """

<div id="${elementID}">
	<input id="${inputID}" type="text" value="">
	<div id="${containerID}"></div>
</div>

<script type="text/javascript">
    YAHOO.util.Event.onDOMReady(function(){
        ${body()}
        ${autoCompleteID} = new YAHOO.widget.AutoComplete("${inputID}", "${containerID}", ${dataSourceID});
        grails.yui.util.applyConfig(${autoCompleteID}, ${util.toJSON(props)});
        ${util.buildEventStrings(autoCompleteID, events).join()}
        ${util.buildMethodStrings(autoCompleteID, methods).join()}
     });
</script>
        """
    }
}
