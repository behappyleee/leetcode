class Solution {
    public int removeElement(int[] nums, int val) {
        int arrayIndex = 0;
        for (int i = 0; i < nums.length; i++) {
            if (nums[i] != val) {
                nums[arrayIndex++] = nums[i];
            }
        }
        return arrayIndex;
    }
}