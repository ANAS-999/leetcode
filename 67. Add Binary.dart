import 'dart:math';

class Solution {
  String addBinary(String a, String b) {
    int rest = 0;
    List<int> result = [];
    final int size = min(a.length, b.length);

    for (var counter = 0; counter < size; counter++) {
      int? x;
      int indexA = a.length - counter - 1;
      int indexB = b.length - counter - 1;
      int sum = int.parse(a[indexA]) + int.parse(b[indexB]) + rest;

      print("${a[indexA]} + ${b[indexB]} + $rest = $sum");

      switch (sum) {
        case 0:
          rest = 0;
          result.add(0);
          x = 0;
          break;
        case 1:
          rest = 0;
          result.add(1);
          x = 1;
          break;
        case 2:
          rest = 1;
          result.add(0);
          x = 0;
          break;
        case 3:
          rest = 1;
          result.add(1);
          x = 1;
          break;
      }

      print("result=$x, rest=$rest");
      print("");
    }

    if (a.length != b.length) {
      String bigger = a.length > b.length ? a : b;
      String over = bigger.substring(0, bigger.length - size);
      String binaryRest = rest == 2 ? "10" : rest.toString();
      String binaryResult = result.reversed.join("");

      print("======================");
      print(
        "result = $binaryResult, rest = $binaryRest \t ($over, $binaryRest)",
      );
      print("======================\n");

      return (addBinary(over, binaryRest) + binaryResult);
    }

    if (rest == 1) result.add(1);

    return result.reversed.join("");
  }

  //! Recursive
  String addBinary2(String a, String b) {
    int size = max(a.length, b.length);

    return addBinaryAdvanced(fixBinary(a, size), fixBinary(b, size));
  }

  String fixBinary(String x, int size) {
    if (size - x.length < 0) return x;
    String prefix = List.generate(size - x.length, (int index) => "0").join("");
    return prefix + x;
  }

  String toBinary(List<int> x) {
    return x.reversed.join("");
  }

  List<int> toList(String binary) {
    return binary.split("").reversed.map((item) => int.parse(item)).toList();
  }

  String addBinaryAdvanced(String a, String b, {String rest = "0"}) {
    if (a.length != 0 && b.length != 0) {
      int newRest = 0;
      int? currentBit;
      List<int> listA = toList(a);
      List<int> listB = toList(b);
      List<int> listRest = toList(rest);

      int sum = listA.first + listB.first + listRest.first;

      print(Solution().toList(a));
      print(Solution().toList(b));

      switch (sum) {
        case 0:
          newRest = 0;
          currentBit = 0;
          break;
        case 1:
          newRest = 0;
          currentBit = 1;
          break;
        case 2:
          newRest = 1;
          currentBit = 0;
          break;
        case 3:
          newRest = 1;
          currentBit = 1;
          break;
      }

      print("b=$currentBit, r=$newRest\n");
      String nextBit = addBinaryAdvanced(
        a.substring(0, a.length - 1),
        b.substring(0, b.length - 1),
        rest: newRest == 2 ? "10" : newRest.toString(),
      );

      return nextBit + currentBit.toString();
    }

    return rest != "0" ? rest : "";
  }
}

void main(List<String> args) {
  final String a = "10";
  final String b = "0";

  print(a + " + " + b + "\n");
  print(Solution().addBinary2(a, b));
}
