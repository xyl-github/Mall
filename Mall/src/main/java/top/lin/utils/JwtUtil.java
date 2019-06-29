package top.lin.utils;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.interfaces.DecodedJWT;

import java.io.UnsupportedEncodingException;
import java.util.Date;

/**
 * Created by IntelliJ IDEA.
 * User: Jungle Lin
 * Date: 2019/6/24
 * Time: 10:44
 */
public class JwtUtil {
    private static final long EXPIRE_TIME = 30L * 24L * 60L * 60L * 1000L;
    private static final String pass = "asd235trt75we333rgg";
    private static final String auth0 = "Linjy";
    public static final String USER = "username";
    public static final String ID = "id";


    public static String sign(String username, Integer id) {
        Date date = new Date(System.currentTimeMillis() + EXPIRE_TIME);
        Algorithm algorithm = Algorithm.HMAC256(pass);
        return JWT.create().withIssuer(auth0).withClaim(USER, username).withClaim(ID, id).withExpiresAt(date).sign(algorithm);
    }

    public static DecodedJWT verify(String token) {
        try {
            Algorithm algorithm = Algorithm.HMAC256(pass);
            JWTVerifier jwtVerifier = JWT.require(algorithm).build();
            DecodedJWT jwt = jwtVerifier.verify(token);
            return jwt;
        } catch (Exception e) {
            return null;
        }
    }

    public static String getClaim(String claim, String token) {
        try {
            DecodedJWT jwt = JWT.decode(token);
            return jwt.getClaim(claim).asString();
        } catch (Exception e) {
            return null;
        }
    }
}
