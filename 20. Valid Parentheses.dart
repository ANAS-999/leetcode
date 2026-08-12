class Solution {
  bool isOpen(String item) {
    return item == "(" || item == "[" || item == "{";
  }

  bool isCorrectClose(String open, String close) {
    switch (open) {
      case "(":
        return close == ")";
      case "[":
        return close == "]";
      case "{":
        return close == "}";
      default:
        return false;
    }
  }

  bool isValid(String s) {
    List<String> list = [];

    for (var item in s.split("")) {
      if (isOpen(item))
        list.add(item);
      else {
        if (list.isEmpty) return false;

        if (isCorrectClose(list.last, item))
          list.removeLast();
        else
          return false;
      }
    }

    return list.isEmpty;
  }
}

void main(List<String> args) {
  String s = "([])";
  print(Solution().isValid(s));
}
