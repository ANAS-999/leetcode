/* import 'dart:math';

class IndexValue {
  int index;
  int value;

  IndexValue({required this.index, required this.value});

  @override
  String toString() {
    return "IndexValue(index=$index, value=$value)";
  }
}

class Solution {
  int listSum(List<int> nums) {
    int sum = 0;
    for (var num in nums) sum += num;

    return sum;
  }

  IndexValue listMinWithIndex(List<int> nums) {
    int minIndex = 0;
    int minNum = nums[0];

    for (var i = 1; i < nums.length; i++) {
      if (minNum > nums[i]) {
        minIndex = i;
        minNum = nums[i];
      }
    }

    return IndexValue(index: minIndex, value: minNum);
  }

  int listMin(List<int> nums) {
    int minNum = 0;
    for (var num in nums) minNum = min(minNum, num);

    return minNum;
  }

  int minimumTotal(List<List<int>> triangle) {
    int i = 0;
    int sum = 0;

    for (var row = 0; row < triangle.length; row++) {
      List<int> nums = triangle[row];

      // if first row
      if (row == 0) {
        sum = nums[i];
      }
      // if last row
      else if (row == triangle.length - 1) {
        // if last number
        if (i == nums.length - 1)
          sum += nums[i];
        // if not
        else
          sum += min(nums[i], nums[i + 1]);
      }
      // if row = 1,2,...,n-1
      else {
        List<int> listSum = [];
        List<int> nextNums = triangle[row + 1];

        listSum.add(nums[i] + nextNums[i]);
        listSum.add(nums[i] + nextNums[i + 1]);
        listSum.add(nums[i + 1] + nextNums[i + 1]);
        listSum.add(nums[i + 1] + nextNums[i + 2]);

        int minNum = listMinWithIndex(listSum).index;

        print(
          "\t> " +
              listSum.toString() +
              " - " +
              listMinWithIndex(listSum).value.toString(),
        );

        i += minNum == 0 || minNum == 1 ? 0 : 1;

        sum += nums[i];
      }

      print("i=$i, sum=$sum");
    }

    return sum;
  }

  int minimumPositiveTotal(List<List<int>> triangle) {
    int sum = 0;

    for (var nums in triangle) {
      int minNum = nums[0];

      for (var num in nums) {
        minNum = min(minNum, num);
      }
      sum += minNum;
    }

    return sum;
  }
}

void main(List<String> args) {
  List<List<int>> triangle = [
    [1],
    [-5, -2],
    [3, 6, 1],
    [-1, 2, 4, -3],
  ];

  print("Solution : " + Solution().minimumTotal(triangle).toString());
}
 */