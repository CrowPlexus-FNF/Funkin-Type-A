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
	@:optional function onBar(bar:Int):Void;
}

class Conductor {
	// -- GLOBAL VARIABLES -- //

	public static var bpm:Float = 100.0;
    public static var time:Float = 0.0;

	public static var step(get, never):Int;
	public static var beat(get, never):Int;
	public static var bar(get, never):Int;

	public static var stepf:Float = 0.0;
	public static var beatf:Float = 0.0;
	public static var barf:Float = 0.0;

	public static var beatDelta(get, never):Float;
	public static var stepDelta(get, never):Float;

	// -- INTERNAL VARIABLES -- //

    private static var _dt:Float = 0.0;

	private static var _lastTime:Float = 0.0;
	private static var _lastStep:Int = -1;
	private static var _lastBeat:Int = -1;
	private static var _lastBar:Int = -1;

	// -- FUNCTIONS (AWESOME) -- //

	public static function init():Void {
		_dt = time = beatf = stepf = 0.0;
		_lastStep = _lastBeat = _lastBar = -1;
        _lastTime = -1.0;
	}

    public static function update(elapsed:Float):Void {
        _dt = time - _lastTime;

        if (time >= 0) {
			final _beatDelta:Float = beatDelta * _dt;

			stepf += _beatDelta * 4.0;
			beatf += _beatDelta;
			barf += _beatDelta / 4.0;

			// if the state is active and is eligable to be used by the conductor
            if (FlxG.state != null && Std.isOfType(FlxG.state, IBeatContainer)) {
                final container:IBeatContainer = cast(FlxG.state, IBeatContainer);
				if (step > _lastStep) {
                	container.onStep(step);
					_lastStep = step;
				}
				if (beat > _lastBeat) {
					container.onBeat(beat);
					_lastBeat = beat;
				}
				if (bar > _lastBar) {
					container.onBar(bar);
					_lastBar = bar;
				}
            }
            _lastTime = time;
        }
    }

	static inline function get_beatDelta():Float return (60.0 / Conductor.bpm);
	static inline function get_stepDelta():Float return beatDelta * 0.25;

	static inline function get_step():Int return Math.floor(stepf);
	static inline function get_beat():Int return Math.floor(beatf);
	static inline function get_bar():Int return Math.floor(barf);
}
