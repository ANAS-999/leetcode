class Solution {
  int strStr(String haystack, String needle) {
    return haystack.indexOf(needle);
  }
}

void main(List<String> args) {
  String needle = "leeto";
  String haystack = "leetcode";

  print("Solution : " + Solution().strStr(haystack, needle).toString());
}
