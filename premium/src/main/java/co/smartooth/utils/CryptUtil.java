package co.smartooth.utils;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import org.apache.commons.codec.binary.Hex;

@Component
@Slf4j
public class CryptUtil {
    private static String secret_key="smartoothkorea";

    // 암호화
    public String generateEncryptedKey(String passKey) {
        String strKey = getSHA512();
        try {

            final Cipher encryptCipher = Cipher.getInstance("AES");
            encryptCipher.init(Cipher.ENCRYPT_MODE, generateMySQLAESKey(strKey, "UTF-8"));
            return new String(Hex.encodeHex(encryptCipher.doFinal(passKey.getBytes("UTF-8")))).toUpperCase();
        } catch (Exception e) {
            //log.error("Encrypted Key Error", e);
            return null;
        }
    }

    // 복호화
    public static String generateKeyDecrypt(String passwordhex) {
        String strKey = getSHA512();
        try {
            final Cipher decryptCipher = Cipher.getInstance("AES");
            decryptCipher.init(Cipher.DECRYPT_MODE, generateMySQLAESKey(strKey, "UTF-8"));
            return new String(decryptCipher.doFinal(Hex.decodeHex(passwordhex.toCharArray())));
        } catch (Exception e) {
            //log.error("Key Decrypted Error", e);
            return null;
        }
    }

    private static SecretKeySpec generateMySQLAESKey(final String key, final String encoding) {
        try {
            final byte[] finalKey = new byte[16];
            int i = 0;
            for(byte b : key.getBytes(encoding))
                finalKey[i++%16] ^= b;
            return new SecretKeySpec(finalKey, "AES");
        } catch(UnsupportedEncodingException e) {
            throw new RuntimeException(e);
        }
    }

    // SHA512
    private static String getSHA512() {
        String toReturn = null;
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-512");
            digest.reset();
            digest.update(secret_key.getBytes("utf8"));
            toReturn = String.format("%0128x", new BigInteger(1, digest.digest()));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return toReturn;
    }
}