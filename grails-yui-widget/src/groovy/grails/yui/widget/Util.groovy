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

    public static String toJSON(Object obj) {
        if (obj instanceof Map) {
            return new org.json.JSONObject(((Map) obj)).toString();
        } else if (obj instanceof ArrayList) {
            return new org.json.JSONArray(((Collection) obj)).toString();
        }
    }
}
