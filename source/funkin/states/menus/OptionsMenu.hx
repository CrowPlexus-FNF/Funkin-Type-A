package funkin.states.menus;

class OptionsMenu extends flixel.FlxState {
    override function create() {
        super.create();

        add(new flixel.text.FlxText(0,0,0,"OPTIONS MENU BITCH"));
    }

    override function update(elapsed:Float) {
        super.update(elapsed);
    }
}