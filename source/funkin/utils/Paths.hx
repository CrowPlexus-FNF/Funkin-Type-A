package funkin.utils;

import flixel.graphics.FlxGraphic;
import flixel.graphics.frames.FlxAtlasFrames;

import openfl.utils.Assets as OpenFLAssets;

/**
 * Helper Class for grabbing assets from the main game folder or from mods
 * its also written with the purpose of easily caching assets and managing them from within the cache.
 * 
 * @author crowplexus
**/
class Paths {
    public static inline function fileExists(file:String):Bool {
        return OpenFLAssets.exists(file);
    }

    public static inline function getText(file:String):String {
        return OpenFLAssets.getText(file);
    }

    public static inline function getPath(directory:String):String {
        return 'assets/funkin/${directory}';
    }

    public static function image(path:String):String {
        return getPath('${path}.png');
    }

    public static inline function xml(file:String):String {
        return getPath('${file}.xml');
    }

    public static inline function getPackerAtlas(path:String):FlxAtlasFrames {
        return FlxAtlasFrames.fromSparrow(Paths.image(path), Paths.getPath('${path}.txt'));
    }

    public static inline function getSparrowAtlas(path:String):FlxAtlasFrames {
        return FlxAtlasFrames.fromSparrow(Paths.image(path), Paths.xml('${path}'));
    }

    /**
     * `getSparrowAtlas` and `getPackerAtlas` combnined into a single function
     * 
     * @param path      Path to get your ass asset from.
     * @return FlxAtlasFrames
    **/
    public static inline function getAtlas(path:String):FlxAtlasFrames {
        return null;
    }
}