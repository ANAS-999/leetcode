class Solution {
  List<int> twoSum(List<int> nums, int target) {
    for (var i = 0; i < nums.length; i++) {
      for (var j = 0; j < nums.length; j++) {
        if (i != j) {
          int sum = nums[i] + nums[j];
          if (sum == target) {
            return [i, j];
          }
        }
      }
    }

    return [];
  }
}

void main(List<String> args) {
  int target = 6;
  List<int> nums = [3,3];

  print(Solution().twoSum(nums, target));
}
