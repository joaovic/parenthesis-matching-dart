abstract class Bracket {}

abstract class OpenningBracket extends Bracket {
  bool matchClosing(ClosingBracket cb);
}

class CurlyOpenning extends OpenningBracket {
  @override
  bool matchClosing(ClosingBracket cb) {
    return cb is CurlyClosing;
  }
}

class BoxOpenning extends OpenningBracket {
  @override
  bool matchClosing(ClosingBracket cb) {
    return cb is BoxClosing;
  }
}

class RoundOpenning extends OpenningBracket {
  @override
  bool matchClosing(ClosingBracket cb) {
    return cb is RoundClosing;
  }
}

abstract class ClosingBracket extends Bracket {}

class CurlyClosing extends ClosingBracket {}

class BoxClosing extends ClosingBracket {}

class RoundClosing extends ClosingBracket {}

class InvalidCharacterException implements Exception {}

class NotBalancedException implements Exception {}
