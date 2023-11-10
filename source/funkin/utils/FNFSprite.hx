package funkin.utils;

import haxe.ds.StringMap;
import flixel.FlxSprite;

// hey mar hows it goign
// BAD IM AT 4 FPS WHAT IS TH
// is this how playing minecraft feels like

class FNFSprite extends FlxSprite {
    public var animOffsets:StringMap<Array<Float>>;
    
    public function new(?x:Float = 0, ?y:Float = 0):Void {
        super(x, y);
    }
    
    public function loadImage(path:String) {
        // frames and loadgraphic bullshit
    }

    public function playAnimation(animToPlay:String, forcePlay:Bool = false, backwards:Bool = false, frame:Int = 0):Void {
        animation.play(animToPlay, forcePlay, backwards, frame);

        offset.set(0, 0);
        if (animOffsets.exists(animToPlay)) {
            var off:Array<Float> = animOffsets.get(animToPlay);
            offset.set(off[0], off[1]);
        }
    }

    public function addAnim(anim:String, prefix:String, frameRate:Int = 24, looped:Bool = false, ?indices:Array<Int>) {
        indices != null ? animation.addByIndices(anim, prefix, indices, "", frameRate, looped) : animation.addByPrefix(anim, prefix, frameRate, looped);
    }

    public function addOffset(anim:String, x:Float = 0, y:Float = 0):Void {
        final offsets:Array<Float> = [x, y];
        animOffsets.set(anim, offsets);
    }
}