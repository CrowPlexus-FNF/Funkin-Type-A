package funkin.components;

/**
 * Classes that implement this beat container can make use
 * of all music-related functions with ease
 * along with being able to use `beat` and `step`.
 * 
 * Usage:
 * ```haxe
 * class MyClass implements IBeatContainer {
 *      public function onBeat(beat:Int):Void {}
 *      public function onStep(step:Int):Void {}
 * }
 * ```
 * 
 * @author crowplexus
**/
interface IBeatContainer {
	function onBeat(beat:Int):Void;
	function onStep(step:Int):Void;
}

class Conductor {
	public static var bpm:Float = 100.0;
    public static var time:Float = 0.0;

    static var _timeLast:Float = 0.0;
    static var _dt:Float = 0.0;

	public static var step:Int = 0;
	public static var beat:Int = 0;

	public static var beatDelta(get, never):Float;
	public static var stepDelta(get, never):Float;

	public static function init():Void {
		step = beat = 0;
        _timeLast = -1.0;
        _dt = time = 0.0;
	}

    public function update(elapsed:Float):Void {
        _dt = time - _timeLast;

        if (time >= 0) {
            if (FlxG.state != null) {
                // cast(FlxG.state, IBeatContainer).onBeat(beat);
                // cast(FlxG.state, IBeatContainer).onStep(step);
            }
            _timeLast = time;
        }
    }

	static inline function get_beatDelta():Float {
		return (60.0 / Conductor.bpm) * _dt;
	}

	static inline function get_stepDelta():Float {
		return beatDelta * 0.25;
	}
}
