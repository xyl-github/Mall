import org.junit.Test;
import redis.clients.jedis.Jedis;
import top.lin.utils.RedisUtil;

/**
 * Created by IntelliJ IDEA.
 * User: Jungle Lin
 * Date: 2019/6/25
 * Time: 15:47
 */
public class RedisTest {

    @Test
    public void test(){

        Jedis jedis = RedisUtil.getJedis();
        System.out.println(jedis.get("name"));
    }
}
