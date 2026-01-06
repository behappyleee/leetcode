class Solution {
    public int lengthOfLastWord(String s) {
        String[] stringArray = s.trim().split(" ");
        return stringArray[stringArray.length - 1].length();
    }
}