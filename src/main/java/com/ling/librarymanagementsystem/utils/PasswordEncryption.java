package com.ling.librarymanagementsystem.utils;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import java.util.Base64;

public class PasswordEncryption {
    private static final String ALGORITHM = "DESede";
    private static final int KEY_SIZE = 168;

    /**
     * 加密密码
     *
     * @return
     * @throws Exception
     */
    public static String generateKey() throws Exception {
        KeyGenerator keyGenerator = KeyGenerator.getInstance(ALGORITHM);
        keyGenerator.init(KEY_SIZE);
        SecretKey secretKey = keyGenerator.generateKey();
        return Base64.getEncoder().encodeToString(secretKey.getEncoded());
    }

    /**
     * 加密数据
     *
     * @param data 要加密的数据
     * @param key  密钥
     * @return
     * @throws Exception
     */
    public static String encrypt(String data, String key) throws Exception {
        SecretKeySpec secretKeySpec = new SecretKeySpec(Base64.getDecoder().decode(key), ALGORITHM);
        Cipher cipher = Cipher.getInstance(ALGORITHM);
        cipher.init(Cipher.ENCRYPT_MODE, secretKeySpec);
        byte[] encryptedBytes = cipher.doFinal(data.getBytes());
        return Base64.getEncoder().encodeToString(encryptedBytes);
    }

    /**
     * 解密数据
     *
     * @param encryptedData 要解密的数据
     * @param key           密钥
     * @return
     * @throws Exception
     */
    public static boolean decrypt(String encryptedData, String key, String data) throws Exception {
        SecretKeySpec secretKeySpec = new SecretKeySpec(Base64.getDecoder().decode(key), ALGORITHM);
        Cipher cipher = Cipher.getInstance(ALGORITHM);
        cipher.init(Cipher.DECRYPT_MODE, secretKeySpec);
        byte[] decryptedBytes = cipher.doFinal(Base64.getDecoder().decode(encryptedData));
        String decrypt_pwd = new String(decryptedBytes);
        if (decrypt_pwd.equals(data)) {
            return true;
        }
        return false;
    }

    public static void main(String[] args) {
        try {
            String key = generateKey();
            String data = "Hello World!";

            String encryptedData = encrypt(data, key);
            System.out.println("Encrypted Data: " + encryptedData);

            boolean decryptedData = decrypt(encryptedData, key, data);
            System.out.println("Decrypted Data: " + decryptedData);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

