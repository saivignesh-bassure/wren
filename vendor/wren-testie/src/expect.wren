import "../vendor/colors" for Colors as Color

class Expect {
    construct new(value) {
        _value = value
    }
    static that(v) { Expect.new(v) }
    toEqual(v) { toBe(v) }
    equalMaps_(v) {
        if (_value.count != v.count) return false
        for (k in _value.keys) {
            if (_value[k] != v[k]) return false
        }
        return true
    }
    toIncludeSameItemsAs(v) {
        if (_value.count != v.count) return false
        for (item in _value) {
            if (!v.contains(item)) return false
        }
        return true
    }
    equalLists_(v) {
        if (_value.count != v.count) return false
        for (i in 0...v.count) {

            if (_value[i] != v[i]) {
                return false
            }
        }
        return true
    }
    abortsWith(err) {
        var f = Fiber.new { _value.call() }
        var result = f.try()
        if (result!=err) {
            Fiber.abort("Expected error '%(err)' but got none")
        }
    }
    toBeGreaterThanOrEqual(v) {
        if (_value >= v) return
        Fiber.abort("Expected %(v) to be greater than or equal to %(_value)")
    }
    toBeLessThanOrEqual(v) {
        if (_value <= v) return
        Fiber.abort("Expected %(v) to be less than or equal to %(_value)")
    }
    printValue(v) {
        if (v is String) {
            return "`%(v)`"
        } else if (v is List) {
            return "[" + v.map {|x| printValue(x) }.join(", ") +  "]"
        } else {
            return "%(v)"
        }
    }
    toBe(v) {
        if (_value is String || v is String) {
            if (_value == v) return

            var fade = "%(Color.BLACK + Color.BOLD)"
            var err="%(fade)expect(%(Color.RESET + Color.RED)received%(fade)).toEqual(%(Color.RESET + Color.GREEN)expected%(fade)) // deep equality\n\n"
            err = err + "%(Color.WHITE + Color.BOLD)Expected:%(Color.RESET) "
            err = err + Color.GREEN + printValue(v) + Color.RESET + "\n"
            err = err + "%(Color.WHITE + Color.BOLD)Received:%(Color.RESET) "
            err = err + Color.RED + printValue(_value) + Color.RESET
            Fiber.abort("%(err)")
        }
        if (_value is List && v is List) {
            if (!equalLists_(v)) {
                Fiber.abort("Expected list %(printValue(_value)) to be %(printValue(v))")
            }
            return
        }
        if (v is Map && _value is Map) {
            if (!equalMaps_(v)) {
                Fiber.abort("Expected %(_value) to be %(v)")
            }
            return
        }
        if (_value != v) {
            Fiber.abort("Expected %(_value) to be %(v)")
        }
    }
}
