package funkin.states;

import flixel.FlxCamera;
import flixel.FlxState;
import funkin.gameplay.*;
import funkin.gameplay.ui.HealthIcon;
import funkin.components.Conductor.IBeatContainer;

class PlayState extends FlxState implements IBeatContainer {
    public var playField:PlayField;

    public var bf:Character;
    public var dad:Character;
    public var gf:Character;

    public var playerIcon:HealthIcon;
    public var opponentIcon:HealthIcon;

    public var gameCam:FlxCamera;
    public var hudCam:FlxCamera;

    // wonderful rapper
    // great work rapper
    public static var diff:String = "hard";
    public static var song:String = "sex";

    override function create() {
        // true...
        add(bf = new Character("bf"));
        add(dad = new Character("dad"));
        add(gf = new Character("gf"));
        
        add(playField = new PlayField());
        playField.loadSong(song, diff);
        
        // this would go in playfield i think, its the hud class
        

        gameCam = FlxG.camera;
        gameCam.bgColor.alpha = 0;

        hudCam = new FlxCamera();
        hudCam.bgColor = FlxColor.TRANSPARENT;

        playField.camera = hudCam;

        super.create(); // typically you call create after
    }

    override function update(elapsed:Float) {
        super.update(elapsed);
    }

    function danceCharacters() {
        for (i in [bf,dad,gf])
            i.dance();
    }

    public function onBeat(beat:Int):Void {
        danceCharacters();
    }

    public function onStep(step:Int):Void {}
}