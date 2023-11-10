package funkin.gameplay;

import funkin.components.Conductor;
import openfl.events.KeyboardEvent;
import flixel.input.keyboard.FlxKey;
import flixel.group.FlxSpriteGroup.FlxTypedSpriteGroup;
import funkin.utils.FNFSprite;

class Strum extends FNFSprite {
    public function new(direction:Int) {
        super(154 * 0.7 * direction);
        loadImage("aaa"); // THE FRAME BULLSHIT
    }

    override public function playAnimation(animToPlay:String, forcePlay:Bool = true, backwards:Bool = false, frame:Int = 0) {
        super.playAnimation(animToPlay, forcePlay, backwards, frame);
        centerOffsets();
        centerOrigin();
    }
}

class StrumLine extends FlxTypedSpriteGroup<Strum> {
    var strums:Array<Strum> = [];
    var notes:Array<Note> = [];

    var keybinds:Array<Array<Int>> = [[FlxKey.LEFT], [FlxKey.DOWN], [FlxKey.UP], [FlxKey.RIGHT]];

    public function new() {
        super();
        for (i in 0...4) {
            makeStrum(i);
        }

        addInputs();
    }

    public function makeStrum(direction:Int) {
        final strum = new Strum(direction);
        add(strum);
    }

    private function addInputs() {
        FlxG.stage.addEventListener(KeyboardEvent.KEY_DOWN, input);
		FlxG.stage.addEventListener(KeyboardEvent.KEY_UP, release);
    }

    inline function input(event:KeyboardEvent) {
        for (note in notes) {
            var judge = Judgements.getJudgement(Math.abs(note.time - Conductor.time));
            if (judge != UNDEFINED) {
                note.kill();
                notes.remove(note);
                break;
            }
        }
    }

    inline function release(event:KeyboardEvent) {

    }
}