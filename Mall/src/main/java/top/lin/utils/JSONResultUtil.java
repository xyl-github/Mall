package top.lin.utils;

import com.alibaba.fastjson.JSONObject;

/**
 * Created by IntelliJ IDEA.
 * User: Jungle Lin
 * Date: 2019/6/24
 * Time: 10:52
 */
public class JSONResultUtil {

    private static JSONObject result = new JSONObject();

    public static void createResult() {
        result.put("status", null);
        result.put("responseResult", null);
        result.put("responseList", null);
    }

    public static void setStatus(String status) {
        result.put("status", status);
    }

    public static void setResponseResult(Object responseResult) {
        result.put("responseResult", responseResult);
    }

    public static void setResponseList(Object responseList) {
        result.put("responseList", responseList);
    }

    public static JSONObject getResult() {
        return result;
    }
}
