package funkin.gameplay;

// in order from highest to lowest judgement TIER4 -> sick TIER1 -> shit
enum abstract JudgeTier(Int) from Int to Int {
    var TIER4 = 4;
    var TIER3 = 3;
    var TIER2 = 2;
    var TIER1 = 1;
    var UNDEFINED = 0;

    public inline function toString():String {
        return switch(this) {
			case TIER4: "sick";
			case TIER3: 'good';
            case TIER2: 'bad';
            case TIER1: 'shit';
            case _: 'undefined';
		}
    }
}

typedef JudgeData = {
    var healthGain:Float;
    var hitWindow:Float;
    var score:Int;
}

/*
 * Class that manages things related to judgements
 * @author Zyflx (& Crow ig)
**/
class Judgements {
    public static var judgeMap:Map<JudgeTier, JudgeData> = [
        // base fnf is  erm 0.023 exactly
        TIER4 => {healthGain: 0.023, score: 350, hitWindow: 45},
        TIER3 => {healthGain: 0, score: 200, hitWindow: 90},
        TIER2 => {healthGain: 0, score: 100, hitWindow: 135},
        TIER1 => {healthGain: 0, score: 50, hitWindow: 166}
    ];

    static final hittableJudges:Array<JudgeTier> = [TIER4, TIER3, TIER2, TIER1];

    public static function getJudgement(diff:Float):JudgeTier {
        for (i in hittableJudges)
            if (getJudgeWindow(i) <= diff)
                return i;
        return UNDEFINED;
    }

    static function getJudgeWindow(judgement:JudgeTier):Float {
        return judgeMap.get(judgement).hitWindow;
    }
}