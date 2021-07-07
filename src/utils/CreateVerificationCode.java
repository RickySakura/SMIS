package utils;

import java.util.Arrays;
//生成验证码字符串
public class CreateVerificationCode {
    /**
     * 验证码难度级别
     */
    public enum SecurityCodeLevel {
        Simple,
        Medium,
        Hard
    }

    public static String getSecurityCode() {
        return (String) getSecurityCode(4, SecurityCodeLevel.Medium, false);
    }

    public static String getSecurityCode(int length, SecurityCodeLevel level, boolean isCanRepeat) {
        int len = length;
        //除去容易混淆的0和o，1和l
        char[] codes = {
                '1', '2', '3', '4', '5', '6', '7', '8', '9',
                'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i',
                'j', 'm', 'n', 'p', 'q', 'r', 's', 't','u',
                'v', 'w', 'x', 'y', 'z','A','B','C','D','E',
                'F','G','H','J','K','L','M','N','P','Q','R','S',
                'T','U','V','W','X','Y','Z'};
        if(level==SecurityCodeLevel.Simple){
            codes= Arrays.copyOfRange(codes,0,9);
        }else if (level==SecurityCodeLevel.Medium){
            codes= Arrays.copyOfRange(codes,0,33);
        }
        int n=codes.length;
        //抛出运行时异常
        if (len>n&&isCanRepeat==false){
            throw new RuntimeException(
                    String.format("调用securitycode.getSecurityCode(%1$s,len,level,isCanRepeat,n)"));}
        char[] result=new char[len];
        //判断能否出现重复的字符
        if (isCanRepeat){
            for(int i=0;i<result.length;i++){
                //索引0 and n-1
                int r=(int)(Math.random()*n);
                //将result中的第i个元素设为codes[r]存放的数值
                result[i]=codes[r];
            }
        }else {
            for (int i=0;i<result.length;i++){
                int r=(int)(Math.random()*n);
                //将result中的第i个元素设为codes[r]存放的数值
                result[i]=codes[r];
                codes[r]=codes[n-1];
                n--;
            }
        }
        return String.valueOf(result);
    }
}
