class Solution {
  int missingInteger(List<int> nums) {
    if (nums.length == 0) return 0;

    int i;
    int sum = nums.first;
    for (i = 1; i < nums.length; i++) {
      int diff = nums[i] - nums[i - 1];
      if (diff != 1) break;
      sum += nums[i];
    }

    while (nums.contains(sum)) sum++;

    return sum;
  }
}

void main(List<String> args) {
  List<int> nums = [29, 30, 31, 32, 33, 34, 35, 36, 37];

  print(Solution().missingInteger(nums));
}
