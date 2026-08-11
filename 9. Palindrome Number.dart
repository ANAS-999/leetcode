class Solution {
  bool isPalindrome(int x) {
    if (x < 0) return false;

    final list = x
        .toString()
        .split("")
        .map(((item) => int.parse(item)))
        .toList();

    final rList = list.reversed.toList();

    for (var i = 0; i < list.length; i++) {
      if (list[i] != rList[i]) return false;
    }

    return true;
  }
}

void main(List<String> args) {
  final int x = -121;
  print(Solution().isPalindrome(x));
}
