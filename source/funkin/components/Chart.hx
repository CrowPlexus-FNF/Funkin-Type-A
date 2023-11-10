package funkin.components;

import haxe.Json;
import funkin.utils.JsonUtil;

using StringTools;

/**
 * ...
**/
enum abstract Difficulty(String) from String to String {
    var EASY = "easy";
    var NORMAL = "normal";
    var HARD = "hard";

    public inline function toString():String{
        return switch (this) {
            case _: Std.string(this);
        }
    }
}

typedef ChartData = {
    var speed:Float;
    var characters:Array<String>;
    var lanes:Array<NoteLane>;
}

typedef NoteLane = {
    var notes:Array<NoteData>;
    var cpu:Bool;
}

// Sex created - RapperGF
@:struct
class NoteData { time:Float
    public var lane:Int;
    public var length:Float;
    public var time:Int;
    public var player:Int;
    public var x:Float; // precache the positions like a gamer.
    public var y:Float;

    public function new(data:Int, _time:Int, player:Int, length:Int) {
        this.x += 100;
        this.x +=  160 * 0.7 * data;
        this.y -= 2000;

        this.lane = data;
        this.time = _time;

        if(player == 1)
            this.x += FlxG.width / 2;
    }
}

class Chart {
	public static function load(song:String, difficulty:Difficulty) {
        final json = Json.parse(Paths.getText(Paths.json('songs/${song.toLowerCase()}/${difficulty.toLowerCase()}')));
formatSongTitle(song);
        // Swag null check for charts crap
        json = JsonUtil.checkNull({
            speed: 1.0,
            characters: ["bf", "dad", "gf"],
            lanes: []
        }, json);


        var daStrumTime:Float = Math.abs(Std.int(songNotes[0])); // Ensure daStrumTime is non-negative
        if (daStrumTime < 0)
            daStrumTime = 0;

                final gottaHitNote:Bool = (songNotes[1] > 3) ? !section.mustHitSection : section.mustHitSection;

        final tailLength:Float = ((songNotes[2])/2.0)*speed; // I HATE SUSTAINS
        final recData = new NoteData(data, Math.floor(strumTime), gottaHitNote? 1 : 0, Math.floor(tailLength));
                // so what we are doing here is to use a struct to save memory basically we cache the note data and recycle notes.
                // now all we have to do is FIGURE OUT HOW YALL FUCKING SPAWN SHIT!!!
                // I would use a circular buffer and make it recycle but like uh :skull:
        return json;
	}

    // FUCK YOU I LIKE IT THIS WAY
    public static function formatSongTitle(song:String) {
        var title:String = "";
        for (i in song.split("")) {
            switch(i) {
                case " ": title += "-";
                case ".": title += "";
                default: title += i.toLowerCase();
            }
        }
        return title;
    }
}