package funkin.states.menus;

class FreeplayMenu extends flixel.FlxState {
    override function create() {
        super.create();

        add(new flixel.text.FlxText(0,0,0,"FREEPLAY MENU BITCH"));
    }

    override function update(elapsed:Float) {
        super.update(elapsed);
    }
}