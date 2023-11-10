package;

import funkin.states.menus.MainMenuState;
import flixel.FlxGame;
import openfl.display.Sprite;

class Main extends Sprite {
	public function new() {
		super();
		addChild(new FlxGame(1280, 720, MainMenuState));
	}
}
