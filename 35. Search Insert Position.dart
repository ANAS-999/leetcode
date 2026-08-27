class Solution {
  int searchInsert(List<int> nums, int target) {
    int targetIndex = nums.indexOf(target);
    if (targetIndex != -1) return targetIndex;

    for (var i = 0; i < nums.length; i++) {
      if (nums[i] > target) return i;
    }

    return nums.length;
  }
}

void main(List<String> args) {
  int target = 2;
  List<int> nums = [1, 3, 5, 6];

  print("Solution : " + Solution().searchInsert(nums, target).toString());
}
