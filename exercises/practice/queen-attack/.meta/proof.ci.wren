var BOARD = 0...8
var STARTING = { "black": [0, 3], "white": [7, 3] }

class QueenAttack {
  static new() { QueenAttack.new({}) }
  construct new(pieces) {
    _white = pieces["white"] || STARTING["white"]
    _black = pieces["black"] || STARTING["black"]
    validate()
  }
  white { _white }
  black { _black }
  validate() {
    validatePiece(_white)
    validatePiece(_black)
    if (_white.join(",") == _black.join(",")) { Fiber.abort("Queens cannot share the same space") }
  }
  validatePiece(piece) {
    var x = piece[0]
    var y = piece[1]
    if (BOARD.contains(x) && BOARD.contains(y)) return
    Fiber.abort("Queen must be placed on the board")
  }
  pieceAt(y,x) {
    if (white[0] == y && white[1] == x) return "W"
    if (black[0] == y && black[1] == x) return "B"
    return "_"
  }
  toString {
    var s = ""
    for (y in BOARD) {
      for (x in BOARD) {
        s = s + pieceAt(y,x) + " "
      }
      s = s.trim() + "\n"
    }
    return s.trim()
  }

  sameRow { _white[0] == _black[0] }
  sameColumn { _white[1] == _black[1] }
  sameDiagonal { (_black[0] - _white[0]).abs == (_black[1] - _white[1]).abs }
  canAttack { sameRow || sameColumn || sameDiagonal }
}
