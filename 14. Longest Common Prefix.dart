class Solution {
  String longestCommonPrefix(List<String> strs) {
    if (strs.length == 0) return "";

    int i = 0;
    for (i = 0; i < strs.first.length; i++) {
      String letter = strs.first[i];

      for (var str in strs.sublist(1)) {
        if (i >= str.length) {
          return strs.first.substring(0, i);
        }
        if (letter != str[i]) {
          return strs.first.substring(0, i);
        }
      }
    }

    return strs.first.substring(0, i);
  }
}

void main(List<String> args) {
  List<String> strs = ["flower", "flow", "flight"];

  print(Solution().longestCommonPrefix(strs));
}
