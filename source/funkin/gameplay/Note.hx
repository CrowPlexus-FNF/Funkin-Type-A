package funkin.gameplay;

import funkin.utils.FNFSprite;
import funkin.gameplay.StrumLine.Strum;

// FUCK NOTES!!!!!!!!!!!!!!
// NOTES CANN SUCK MY pee pee

// SOMETHING I CAN WORK ON!?!?!?!?
// sure
// WOWO
// are we doing notes as both note data + sprite or recyclable with struct data seperated.
// uhhhh

// :3

class Note extends FNFSprite {
    public var time:Float = 0.0;
    public var strumLine:StrumLine;
    public var data:Int;
    public static var globalNoteScale = 160 * 0.7; // NUH UH
    //you have a lane var lmao.
    // wdym :3
    
    public function new(time:Float, dir:Int, lane:StrumLine) {
        super(-5000, 5000);

        this.time = time;
        this.data = dir;

        makeGraphic(154, 15); // we dont have paths yet :3
        // mmhh no i think we should not set the frames :troll:
        // i agree
        setPositions();
    }

    public override function draw():Void {
        // shhhh.... -Crow
    }

        /**
         * i was just thinking like
         * ```haxe // recycle btw. -Crow // if we are recycling then how do we load data is it on a seperated class?
         * while(queuedNotes.length < queuedIndex && queuedNotes[queuedIndex].time > Conductor.position - 2000) {
         *  var newNote = recycle(Note);
         * 
         *  notes.push(newNote); // yunno :3
         * }
         * ```
         */

        // sooooooooooooooooo when a note is like ya know collected for the chart at song start
        // is it just new sprite?
        // or are we gonna be smart and like not do that are we doing that?
}