package funkin.ui;

import funkin.utils.FNFSprite;
import flixel.group.FlxSpriteGroup.FlxTypedSpriteGroup;

class Alphabet extends FlxTypedSpriteGroup<Dynamic> {
    public var text(default, set):String = "";

    public function set_text(value:String) {
        // regen characters shit
        regenText(value);
        return text = value;
    }

    // i was doin it
    function regenText(text:String) {
        for (i in this) i.kill();
        this.clear();
        
        for (i in text.split("")) {
            switch (i) {
                case " ": // SPACE BITCH
                case "\n": // NEW LINE BITCH
                default: // LETTER BITCH
                    final char = this.recycle(AlphabetCharacter);
                    add(char);
            }
        }
    }
}

class AlphabetCharacter extends FNFSprite {
    public static final letters:Map<String, {?prefix:String}> = [
        "a"=> null
    ];
}