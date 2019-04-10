import 'package:parenthesis_matching_dart/parenthesis_matching.dart';
import 'package:test/test.dart';

void main() {
  ParenthesisMatching pm = ParenthesisMatching();

  test('check balanced "(a[0]+b[2c[6]]){24 + 53}"', () {
    expect(pm.check("(a[0]+b[2c[6]]){24 + 53}"), true);
  });
  test('check balanced "f(e(d))"', () {
    expect(pm.check("f(e(d))"), true);
  });
  test('check balanced "[()]{}([])"', () {
    expect(pm.check("[()]{}([])"), true);
  });
  test('check unbalanced "((b)"', () {
    expect(pm.check("((b)"), false);
  });
  test('check unbalanced "(c]"', () {
    expect(pm.check("(c]"), false);
  });
  test('check unbalanced "{(a[]))}"', () {
    expect(pm.check("{(a[]))}"), false);
  });
  test('check unbalanced "([)]"', () {
    expect(pm.check("([)]"), false);
  });
  test('check unbalanced ")("', () {
    expect(pm.check(")("), false);
  });
  test('check "empty"', () {
    expect(pm.check("empty"), true);
  });
  test('check "performance 3.000.000 brackets"', () {
    var ini = DateTime.now();
    var buffer = StringBuffer();

    for (var i = 0; i < 500000; i++) {
      buffer.write("{[(");
    }
    for (var i = 0; i < 500000; i++) {
      buffer.write(")]}");
    }

    var sample = buffer.toString();
    var end = DateTime.now();
    var gap = end.difference(ini);
    print("Build Sample String Time: ${gap.inMilliseconds} ms");

    ini = DateTime.now();
    expect(pm.check(sample), true);
    end = DateTime.now();
    gap = end.difference(ini);
    print("Sample computation Time: ${gap.inMilliseconds} ms");
  });
}
