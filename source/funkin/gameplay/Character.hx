package funkin.gameplay;

import funkin.utils.FNFSprite;
using StringTools;

typedef CharacterData = {
    var image:String;
    var anims:Array<{
        var name:String;
        var prefix:String;
        var frameRate:Int;
        var looped:Bool;
        var indices:Array<Int>;
    }>;
}

class Character extends FNFSprite {
    public static final laneAnims:Array<String> = ["singLEFT", "singDOWN", "singUP", "singRIGHT"];

    public function new(char:String) {
        super();
        loadImage('characters/$char'); // temp
        
        // add loadDataInput here when the format is decided, idk if it gonna be json or xml or whatever lol
    }

    public function loadDataInput(data:CharacterData) {
        loadImage(data.image.startsWith("characters/") ? data.image : "characters/" + data.image);
        for (anim in data.anims) {
            addAnim(anim.name, anim.prefix, anim.frameRate, anim.looped, anim.indices);
        }
    }

    public function miss(lane:Int) {
        sing(lane, "-miss");
    }

    public function sing(lane:Int, altAnim:String = "") {
        playAnimation(laneAnims[lane] + altAnim, true);
    }

    public var danced:Bool = false;
    public function dance() {
        if (animOffsets.exists("danceLeft")) {
            danced = !danced;
            playAnimation(danced ? "danceLeft" : "danceRight", true);
        }
        else
            playAnimation("idle");
    }
}