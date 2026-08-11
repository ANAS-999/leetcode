class Solution {
  int romanToInt(String number) {
    int sum = 0;
    String? x;

    for (var s in number.split("")) {
      sum += getValue(s);

      if (x != null) {
        print("$x ; $s");
        if ((x == "I" && s == "V") || (x == "I" && s == "X")) sum -= 1 * 2;
        if ((x == "X" && s == "L") || (x == "X" && s == "C")) sum -= 10 * 2;
        if ((x == "C" && s == "D") || (x == "C" && s == "M")) sum -= 100 * 2;
      }

      x = s;
    }

    return sum;
  }

  int getValue(String symbol) {
    switch (symbol) {
      case "I":
        return 1;
      case "V":
        return 5;
      case "X":
        return 10;
      case "L":
        return 50;
      case "C":
        return 100;
      case "D":
        return 500;
      case "M":
        return 1000;
      default:
        return 0;
    }
  }
}

void main(List<String> args) {
  String s = "IV";
  print(Solution().romanToInt(s));
}
