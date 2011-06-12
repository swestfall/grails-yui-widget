package grails.yui.widget

class UtilTagLib {

    static namespace = "yuiWidget"

    def javascript = { attrs, body ->

        out << """
            <script type="text/javascript" src="${resource(plugin: 'grails-yui-widget', dir: 'js', file: 'pluginResources.js')}"></script>
        """
    }
}
