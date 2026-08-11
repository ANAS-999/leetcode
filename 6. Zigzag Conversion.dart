class Solution {
  String convert(String s, int numRows) {
    if (numRows == 1) return s;

    List<String> list = s.split("");
    int maxSkip = (2 * numRows) - 3;
    int step = maxSkip + 2;
    String result = "";

    for (var c = 0; c < numRows; c++) {
      step -= 2;
      result += log(list, numRows, c, step);
      if (step == 1) step = maxSkip + 2;
    }

    print("");
    return result;
  }

  String log(List<String> list, int numRow, int startIndex, int initSkip) {
    String result = "";

    int i = startIndex;
    int totalSkip = initSkip;
    int skipStep = 0;

    while (i < list.length) {
      if (skipStep == totalSkip || i == startIndex) {
        print(list[i] + " - " + skipStep.toString());

        result += (list[i]);
        skipStep = 0;

        if (startIndex != 0 && startIndex != (numRow - 1) && i != startIndex) {
          int newSkip = (2 * (startIndex + 1)) - 3;
          totalSkip = totalSkip == initSkip ? newSkip : initSkip;

          print(totalSkip);
        }
      } else {
        skipStep++;
      }

      i++;
    }

    print(result);

    return (result);
  }
}

void main(List<String> args) {
  int n = 1;
  String s = "AB";

  print(Solution().convert(s, n));
}
