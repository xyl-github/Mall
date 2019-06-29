package top.lin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import top.lin.utils.FileUtil;
import top.lin.utils.JSONResultUtil;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.UUID;

/**
 * Created by IntelliJ IDEA.
 * User: Jungle Lin
 * Date: 2019/6/26
 * Time: 10:28
 */
@Controller
public class FileController {

    @RequestMapping("/wxx/{image:.+\\..+}")
    public void getImage(@PathVariable String image, HttpServletResponse response) {
        InputStream is = null;
        OutputStream out = null;
        System.out.println(image);
        try {
            File file = new File(FileUtil.getPath(FileUtil.IMAGE) + image);
            System.out.println(file.getPath());
            if (file != null && file.exists()) {
                response.addHeader("Content-Disposition", "attachment;filename=" + file.getName());
                response.setContentType("multipart/form-data");
                is = new FileInputStream(file);
                out = response.getOutputStream();
                byte[] buffer = new byte[1024 * 1024];
                int len;
                while ((len = is.read(buffer)) > 0)
                    out.write(buffer, 0, len);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (is != null)
                    is.close();
                if (out != null)
                    out.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    @RequestMapping(value = "/file/uploadImage", produces = "application/json; charset=utf-8")
    @ResponseBody
    public String uploadImage(@RequestParam("oldImage") String oldImage, @RequestParam("file") MultipartFile file) {

        int index = file.getOriginalFilename().lastIndexOf(".");
        String extension = file.getOriginalFilename().substring(index);
        String filename = UUID.randomUUID().toString().replaceAll("-", "") + extension;
        JSONResultUtil.createResult();
        try {

            File file1 = new File(FileUtil.getPath(FileUtil.IMAGE) + filename);
            if (!file1.exists()) {
                if (!file1.getParentFile().exists()) {
                    file1.getParentFile().mkdirs();
                }
                file1.createNewFile();
            }
            file.transferTo(file1);
            JSONResultUtil.setStatus("Success");
            JSONResultUtil.setResponseResult("/wxx/" + filename);

            File oldImageFile = new File(FileUtil.getPath(FileUtil.IMAGE) + oldImage.replaceAll("/wxx/", ""));
            if (oldImageFile.exists())
                oldImageFile.delete();
            return JSONResultUtil.getResult().toJSONString();
        } catch (Exception e) {
            e.printStackTrace();
        }
        JSONResultUtil.setStatus("Fail");
        return JSONResultUtil.getResult().toJSONString();
    }

}
