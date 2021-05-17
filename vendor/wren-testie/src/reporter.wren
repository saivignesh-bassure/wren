import "random" for Random
import "../vendor/colors" for Colors as Color
var RND = Random.new()
var SAD_EMOJI = ["😡","👺","👿","🙀","💩","😰","😤","😬"]

class CuteReporter {
    construct new(name) {
        _name = name
        _fail = _skip = _success = 0
        _tests = []
        _fails = []
        _section = name.trim()
    }
    start() { System.print(_name) }
    skip(name) {
        _skip = _skip + 1
        System.print("  🌀 [skip] %(name)")
    }
    section(name) {
        _section = name.trim()
        System.print("\n  %(name)\n")
    }
    fail(name, error) {
        _fail = _fail + 1
        // System.print("  ❌ %(name) \n     %(error)\n")
        System.print("  ❌ %(name)")
        _fails.add([name,error])
    }
    success(name) {
        _success = _success + 1
        System.print("  ✅ %(name)")
    }
    sadEmotion { SAD_EMOJI[RND.int(SAD_EMOJI.count)] }
    printErrors() {
        System.print()
        for (fail in _fails) {
            var name = fail[0]
            var error = fail[1]
            System.print(Color.RED + Color.BOLD + "● %(_section) -> %(name)" + Color.RESET + "\n")
            System.print(error)
            System.print()
        }
    }
    done() {
        printErrors()
        var overall = "💯"
        if (_fail > 0) overall = "%(sadEmotion)"
        _groups = []
        if (_fail > 0) _groups.add("%(Color.RED)✕ %(_fail) failed%(Color.RESET)")
        if (_skip > 0) _groups.add("☐ %(_skip) skipped")
        if (_success>0) {
            _groups.add("%(Color.GREEN)✓ %(_success) passed%(Color.RESET)")
        } else {
            _groups.add("✓ %(_success) passed")
        }

        System.print("Tests:  %(overall) %(_groups.join(", "))\n")
    }
}