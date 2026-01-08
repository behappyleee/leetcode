import java.math.BigInteger;

class Solution {
    public String addBinary(String a, String b) {
        BigInteger aBigInteger = new BigInteger(a, 2);
        BigInteger bBigInteger = new BigInteger(b, 2);
        return aBigInteger.add(bBigInteger).toString(2);
    }
}