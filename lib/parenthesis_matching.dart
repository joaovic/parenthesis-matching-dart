import 'package:parenthesis_matching_dart/bracket.dart';

class ParenthesisMatching {
  var _stack = List<Bracket>();

  bool check(String sample) {
    RegExp regExp = RegExp(
      "\\(|\\)|\\{|\\}|\\[|\\]",
      caseSensitive: false,
      multiLine: false,
    );

    var b = regExp.allMatches(sample);

    try {
      b.forEach((m) {
        _processCharacter(m.group(0));
      });

      if (_stack.isNotEmpty) {
        throw NotBalancedException();
      }

      return true;
    } on Exception {
      return false;
    } finally {
      _stack.clear(); //reset stack for next check
    }
  }

  void _processCharacter(String c) {
    Bracket b = BracketFactory().parse(c);

    if (b is OpenningBracket) {
      _stack.add(b);
    } else if (b is ClosingBracket) {
      _pop(b);
    } else {
      //Ignore NonBracket
    }
  }

  void _pop(ClosingBracket currentBracket) {
    if (_stack.isEmpty) {
      throw NotBalancedException();
    }

    OpenningBracket stackBracket = _stack.removeLast();

    if (!stackBracket.matchClosing(currentBracket)) {
      throw NotBalancedException();
    }
  }
}

class BracketFactory {
  Bracket parse(String c) {
    Bracket bracket;
    switch (c) {
      case '{':
        bracket = CurlyOpenning();
        break;
      case '[':
        bracket = BoxOpenning();
        break;
      case '(':
        bracket = RoundOpenning();
        break;
      case '}':
        bracket = CurlyClosing();
        break;
      case ']':
        bracket = BoxClosing();
        break;
      case ')':
        bracket = RoundClosing();
        break;
      default:
        throw InvalidCharacterException();
    }

    return bracket;
  }
}
