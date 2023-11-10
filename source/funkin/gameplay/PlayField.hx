package funkin.gameplay;

import haxe.ds.Vector;

import flixel.text.FlxText;

import funkin.components.Chart;
import funkin.ui.HealthIcon;

import openfl.events.KeyboardEvent;

class PlayField extends flixel.group.FlxGroup {
    public var scoreBar:FlxText;

    public var noteList:Vector<Note>;
    public var strums:Array<StrumLine> = [];

    public var playerIcon:HealthIcon;
    public var opponentIcon:HealthIcon;

    public function new() {
        super();

        // noteList = new Vector<Note>(0);

        for (i in 0...2) {
            final strumLine = new StrumLine();
            strums.push(strumLine);
            add(strumLine);
        }
    }

    public override function destroy():Void {
        super.destroy();
    }

    public function loadSong(song:String, difficulty:String) {
        final chart = Chart.load(song, difficulty); // hiii
    }
}