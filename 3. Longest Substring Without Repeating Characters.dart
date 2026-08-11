import 'dart:math';

class TestData {
  final String word;
  final int expectedLen;

  TestData({required this.word, required this.expectedLen});
}

class Solution {
  void test(List<TestData> listData) {
    for (var data in listData) {
      int len = lengthOfLongestSubstring(data.word);

      print("===================================================");
      print(
        '${len == data.expectedLen},\t Word "${data.word}",\t\t len=$len == expectedLen=${data.expectedLen}',
      );
      print("===================================================");
    }
  }

  int lengthOfLongestSubstring(String s) {
    int maxLen = 0;
    List<int> listIndex = List.filled(256, -1);

    int i = 0;
    int j = 0;
    while (j < s.length) {
      int lastAscii = s.codeUnitAt(j);
      int firstAscii = s.codeUnitAt(i);

      print(s[j]);

      if (listIndex[lastAscii] != -1 && i != j) {
        maxLen = max(maxLen, j - i);
        print("#> Current len is " + (j - i).toString());

        listIndex[firstAscii] = -1;
        i++;
      } else {
        listIndex[lastAscii] = j;
        j++;
      }

      print("(i=$i, j=$j)\n");
    }

    return max(maxLen, j - i);
  }
}

void main(List<String> args) {
  Solution solution = Solution();

  List<TestData> listData = [
    TestData(word: "abcabcbb", expectedLen: 3),
    TestData(word: "bbbbb", expectedLen: 1),
    TestData(word: "pwwkew", expectedLen: 3),
    TestData(word: "mjvhmi", expectedLen: 5),
    TestData(word: "S", expectedLen: 1),
    TestData(word: "mq", expectedLen: 2),
    TestData(word: "bbba", expectedLen: 2),
  ];

  solution.test(listData);
}
