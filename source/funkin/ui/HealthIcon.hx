package funkin.ui;

import flixel.math.FlxMath;
import haxe.ds.IntMap;
import funkin.utils.FNFSprite;

class HealthIcon extends FNFSprite {
    public var isPlayer:Bool = false;
    public var animationMap:IntMap<Int> = [0 => 0, 20 => 1];
    
    public function new(char:String = 'bf', isPlayer:Bool = false) {
        this.isPlayer = isPlayer;
        loadIcon(char);
        super();
    }

    public function loadIcon(char:String = 'bf'):Void {
        var iconGraphic = Paths.image('healthIcons/${char}');
        if (iconGraphic == null) iconGraphic = Paths.image('healthIcons/face');

        var image = FlxG.bitmap.add(graphic, unique, key); 

        // * 0.5 is the same as / 2 (although a bit faster :3)
        loadGraphic(image, true, Math.floor(image.width * 0.5), Math.floor(image.height));
        
        // prevents issues with icons that have more than 2 frames
        animation.add(char, [for (i in 0...frames.frames.length) i], 0, false, isPlayer);
    }

    // FUCK YEAHHHHHHH

    override function update(elapsed:Float):Void {
        if (scale.x != 1.0) bumpIcon(true);
        super.update(elapsed);
    }

    // this is a dynamic because i want people to be able to
    // do stuff with it in hscript :3 -Crow
    public dynamic function bumpIcon(lerping:Bool):Void {
        // bumpIcon = function() {};
        if (!lerping) {
            scale.set(1.25, 1.25);
            updateHitbox();
        }
        else {
            final scaleMult:Float = FlxMath.lerp(scale.x, 1.0, 0.85);
            scale.set(scaleMult, scaleMult);
            updateHitbox();
        }
        scale.set(1.25, 1.25);
        updateHitbox();
    }
}