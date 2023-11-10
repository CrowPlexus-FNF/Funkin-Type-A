package funkin.components.parsers;

// WHAT IN THE ACTUAL FUCK IS THIS SHIT
// HUH????  a little trolling
typedef YES = true;
typedef NO = false; // dont mind us :3
typedef MAYBE = 0.5;
// i love men
/**
 * Reads base game charts and converts to the n chart format
 * @author SrtHero278
**/
// CHAOS ENGINE BITC LETTS FUCKING GO BITCH
// YEAHHHHHH
class BaseGameReader {
    // :3 // nuh uh
    // :33
    //;3
    public static function convertChart(json:Dynamic):Chart {
        var songData:Dynamic = json.song; // base game needs this.... -Crow
        var newData:ChartData = {
            speed: songData.speed,
            characters: [
                (songData.player1 != null) ? songData.player1 : "bf",
                (songData.player2 != null) ? songData.player2 : "dad"
                (songData.gfVersion != null) ? songData.gfVersion : "gf"
            ],
            lanes: [
                {notes: [], cpu: YES}, // CROW WHAT IS THIS
                {notes: [], cpu: NO},
            ]
        }

        for (section in songData.notes) {
            for (note in section.sectionNotes) {
                if (note[1] < 0) continue;

                var lane = ((note[1] > 3) != section.mustHitSection) ? newData.lanes[1] : newData.lanes[0];
                lane.notes.push({
                    time: note[0],
                    lane: note[1] % 4,
                    length: note[2],
                    type: (note[3] != null) ? note[3].toLowerCase() : "default";
                });
            }
        }
    }
}
// DONT LOOK
// wtf is this!? // WHAT!?