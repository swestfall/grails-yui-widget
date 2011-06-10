package grails.yui.widget

public class Util {

    public static List<String> buildEventStrings(String name, List events) {
        List<String> eventStrings = []
        events.each() { it ->
            String obj = it.obj ? it.obj : 'undefined'
            String scope = it.scope ? it.scope : 'undefined'
            eventStrings << "${name}.subscribe('${it.type}', ${it.fn}, ${obj}, ${scope}); "
        }
        return eventStrings;
    }
}
