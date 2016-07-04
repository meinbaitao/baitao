package com.thinkgem.jeesite.common.utils;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESKeySpec;
import javax.crypto.spec.IvParameterSpec;
import java.io.IOException;


/**
 * author fanjinyuan.
 */
public class DESEncryptionUtil {

    public static final String ENCODING = "UTF-8";
    public static final String DES_CBC_PKCS5_PADDING = "DES/CBC/PKCS5Padding";


    /**
     * Description 根据键值进行加密
     * @param data
     * @param key  加密键byte数组
     * @return
     * @throws Exception
     */
    public static String encrypt(String data, String key) throws Exception {
        byte[] bt = desEncrypt(data, key);
        String strs = new BASE64Encoder().encode(bt);
        return strs;
    }

    public static byte[] desEncrypt(String message, String key) throws Exception {
        Cipher cipher = Cipher.getInstance(DES_CBC_PKCS5_PADDING);

        DESKeySpec desKeySpec = new DESKeySpec(key.getBytes(ENCODING));

        SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");
        SecretKey secretKey = keyFactory.generateSecret(desKeySpec);
        IvParameterSpec iv = new IvParameterSpec(key.getBytes(ENCODING));
        cipher.init(Cipher.ENCRYPT_MODE, secretKey, iv);

        return cipher.doFinal(message.getBytes(ENCODING));
    }


    /**
     * Description 根据键值进行解密
     * @param data
     * @param key  加密键byte数组
     * @return
     * @throws IOException
     * @throws Exception
     */
    public static String decrypt(String data, String key) throws IOException,
            Exception {
        if (data == null)
            return null;
        byte[] bt = desDecrypt(data, key);
        return new String(bt);
    }

    /**
     * Description 根据键值进行解密
     * @param data
     * @param key  加密键byte数组
     * @return
     * @throws Exception
     */
    private static byte[] desDecrypt(String data, String key) throws Exception {

        BASE64Decoder decoder = new BASE64Decoder();
        byte[] buf = decoder.decodeBuffer(data);

        byte[] keyArray = key.getBytes(ENCODING);


        // 从原始密钥数据创建DESKeySpec对象
        DESKeySpec dks = new DESKeySpec(keyArray);

        // 创建一个密钥工厂，然后用它把DESKeySpec转换成SecretKey对象
        SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");
        SecretKey securekey = keyFactory.generateSecret(dks);

        // Cipher对象实际完成解密操作
        Cipher cipher = Cipher.getInstance(DES_CBC_PKCS5_PADDING);
        IvParameterSpec iv = new IvParameterSpec(keyArray);

        // 用密钥初始化Cipher对象
        cipher.init(Cipher.DECRYPT_MODE, securekey, iv);

        return cipher.doFinal(buf);
    }


}
