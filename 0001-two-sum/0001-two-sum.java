class Solution {
    public int[] twoSum(int[] nums, int target) {
        for (int i=0; i<nums.length; i++) {
            for (int j=(i+1); j<nums.length; j++) {
                int sumNum = nums[i] + nums[j];
                if (sumNum == target) {
                    return new int[]{i, j};
                }
            }
        }
        throw new RuntimeException("Invalid");
    }
}
