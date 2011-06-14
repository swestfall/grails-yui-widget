package grails.yui.widget

class AutoCompleteTagLib {

    static namespace = "yuiWidget";

    def util = GrailsYuiWidgetUtil.getInstance();

    def yuiAutoComplete = { attrs, body ->

        def id = attrs.remove('id')
        def events = attrs.remove('events') ?: []
        def namespace = attrs.remove('namespace') ?: 'window'
        def config = attrs.remove('config') ?: [:] //TODO: can we use a config

        def elementID = "grailsYuiAutoCompleteEl_${id}"
        def inputID = "grailsYuiAutoCompleteInputEl_${id}"
        def containerID = "grailsYuiAutoCompleteContainerEl_${id}"
        def autoCompleteID = "${namespace}.grailsYuiAutoComplete_${id}"
        def dataSourceID = "${namespace}.grailsYuiDataSource_${id}"

        pageScope.dataSourceID = dataSourceID

        def eventStrings = util.buildEventStrings(autoCompleteID, events)

        out << """

<div id="${elementID}">
	<input id="${inputID}" type="text" value="">
	<div id="${containerID}"></div>
</div>

<script type="text/javascript">
    YAHOO.util.Event.onDOMReady(function(){
        ${body()}
        ${autoCompleteID} = new YAHOO.widget.AutoComplete("${inputID}", "${containerID}", ${dataSourceID});
        //attach any events created
        ${eventStrings.join()}
     });
</script>
        """
    }
}
