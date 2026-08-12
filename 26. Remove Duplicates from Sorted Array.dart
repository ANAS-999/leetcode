class Solution {
  int removeDuplicates(List<int> nums) {
    for (var i = 1; i < nums.length; i++) {
      int num = nums[i];
      int lastNum = nums[i - 1];

      if (num == lastNum) {
        nums.removeAt(i);
        i--;
      }
    }

    return nums.length;
  }
}

void main(List<String> args) {
  List<int> nums = [0, 0, 1, 1, 1, 2, 2, 3, 3, 4];

  print(Solution().removeDuplicates(nums));
}
