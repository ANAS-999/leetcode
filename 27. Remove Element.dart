class Solution {
  int removeElement(List<int> nums, int val) {
    for (var i = 0; i < nums.length; i++)
      if (nums[i] == val) nums.removeAt(i--);

    return nums.length;
  }
}

void main(List<String> args) {
  int val = 2;
  List<int> nums = [0, 1, 2, 2, 3, 0, 4, 2];

  print("Solution : " + Solution().removeElement(nums, val).toString());
}
