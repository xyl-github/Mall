package top.lin.utils;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * Created by IntelliJ IDEA.
 * User: Jungle Lin
 * Date: 2019/6/25
 * Time: 12:57
 */
public class FileUtil {

    public static final String TMP = "tmp";
    public static final String IMAGE = "image";
    public static final String EXCEL = "excel";

    public static String getPath(String key) throws Exception {
        InputStream is = null;
        try {
            Properties prop = new Properties();
            is = FileUtil.class.getClassLoader().getResourceAsStream("fileConfig.properties");
            prop.load(is);
            return prop.getProperty(key);

        } finally {
            if (is != null)
                is.close();
        }
    }

    public static void deleteFile(String filename) {
        try {
            File file = new File(filename);
            if (file.exists())
                file.delete();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
