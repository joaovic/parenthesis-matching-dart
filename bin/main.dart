import 'package:parenthesis_matching_dart/parenthesis_matching.dart';

main(List<String> arguments) {
  ParenthesisMatching pm = ParenthesisMatching();

  print(pm.check("OO[PP[]]"));
}
