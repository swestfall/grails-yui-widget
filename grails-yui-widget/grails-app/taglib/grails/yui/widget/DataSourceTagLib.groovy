package grails.yui.widget

import grails.converters.JSON

class DataSourceTagLib {

    static namespace = "yuiWidget"

    def util = GrailsYuiWidgetUtil.getInstance();

    //pull the config properties and set defaults
    def yuiLocalDataSource = { attrs, body ->

        //pull config items from scope
        def dataSourceID = pageScope.dataSourceID

        //pull the config properties and set defaults
        def data = attrs.remove('data')
        def events = attrs.remove('events') ?: []
        def config = attrs.remove('config') ?: [:]
        def props = attrs.remove('props') ?: []

        out << """
        ${dataSourceID} = new YAHOO.util.LocalDataSource(${data as JSON}, ${util.toJSON(config)});
        grails.yui.util.applyConfig(${dataSourceID}, ${util.toJSON(props)});
        ${util.buildEventStrings(dataSourceID, events).join()}
        """
    }

    def yuiXHRDataSource = { attrs, body ->

        //pull the config items from scope
        def dataSourceID = pageScope.dataSourceID

        //pull the config properties and set defaults
        def url = attrs.remove('url')
        def events = attrs.remove('events') ?: []
        def config = attrs.remove('config') ?: [:]
        def props = attrs.remove('props') ?: []

        out << """
        ${dataSourceID} = new YAHOO.util.XHRDataSource("${url}", ${util.toJSON(config)});
        grails.yui.util.applyConfig(${dataSourceID}, ${util.toJSON(props)});
        ${util.buildEventStrings(dataSourceID, events).join()}
        """
    }
}


