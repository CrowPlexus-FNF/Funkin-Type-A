package funkin.utils;

class JsonUtil {

    /*
     * Auto completes null values of an object from a default
    **/
    public static function checkNull(defaults:Dynamic, ?input:Dynamic) {
        if (input == null) return Reflect.copy(defaults);

        for (i in Reflect.fields(defaults)) {
            if (!Reflect.hasField(input, i) || Reflect.field(input, i) == null) {
                Reflect.setField(input, i, Reflect.field(defaults, i));
            }
        }

        return input;
    }
}