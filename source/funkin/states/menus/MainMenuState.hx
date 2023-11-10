package funkin.states.menus;

import funkin.components.Conductor.IBeatContainer;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;

enum MainMenuButton {
    MainMenuButton(name:String, callback:Void->Void);
}

class MainMenuState extends flixel.FlxState {
    final options:Array<MainMenuButton> = [
        MainMenuButton("story", function() FlxG.switchState(new StoryModeMenu())),
        MainMenuButton("freeplay", function() FlxG.switchState(new FreeplayMenu())),
        MainMenuButton("options", function() FlxG.switchState(new OptionsMenu()))
    ];

    var grpOptions:FlxTypedGroup<FlxSprite>;

    var curSelected:Int = 0;

    override function create():Void {
        final menuBG:FlxSprite = new FlxSprite().loadGraphic(Paths.image('funkin/menu/menuBG'));
        menuBG.screenCenter();
        add(menuBG);

        grpOptions = new FlxTypedGroup<FlxSprite>();
        add(grpOptions);

        for (i in 0...options.length) {
            final menuOption:FlxSprite = new FlxSprite(0, 50 + (250 * i));
            menuOption.frames = Paths.getSparrowAtlas('menu/${options[i]}');
            menuOption.animation.addByPrefix('idle', 'basic', 24, true);
            menuOption.animation.addByPrefix('select', 'white', 24, true);
            menuOption.animation.play('idle');
            menuOption.ID = i; // idk just putting this here if its ever used
            menuOption.screenCenter(X);
            grpOptions.add(menuOption);
        }

        changeOption();

        super.create();
    }

    override function update(elapsed:Float):Void {
        super.update(elapsed);

        if (FlxG.keys.pressed.UP || FlxG.keys.pressed.DOWN)
            changeOption(FlxG.keys.pressed.DOWN ? 1 : -1);
    }

    function changeOption(num:Int = 0) {
        curSelected = flixel.math.FlxMath.wrap(curSelected + num, 0, grpOptions.length - 1);

        for (i in 0...grpOptions.members.length) {
            grpOptions.members[i].animation.play(i == curSelected ? "selected" : "idle");
            grpOptions.members[i].centerOrigin();
        }
    }
}