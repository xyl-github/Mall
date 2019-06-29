package top.lin.utils;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import top.lin.entity.OptionStatus;

import java.io.*;
import java.lang.reflect.Field;
import java.util.*;

/**
 * Created by IntelliJ IDEA.
 * User: Jungle Lin
 * Date: 2019/6/25
 * Time: 11:45
 */
public class ExcelUtil<T> {

    /**
     * @param file
     * @param map  结构应为
     *             key(Excel表中的列名)：value(Entry:
     *             key(entity的属性名)：value(entity属性的类型，目前只有三种，"string", "int", "double")))
     * @return
     * @throws Exception
     */

    public List<T> parse(Class<T> c, File file, Map<String, Map.Entry<String, String>> map) throws Exception {
        List<T> list = new LinkedList<>();

        Workbook workbook = null;
        InputStream is = new FileInputStream(file);
        if (file.getName().endsWith("xls"))
            workbook = new HSSFWorkbook(is);
        else if (file.getName().endsWith("xlsx"))
            workbook = new XSSFWorkbook(is);
        List<String> name = new ArrayList<>();//列名

        if (workbook != null) {
            Sheet sheet = workbook.getSheetAt(0);
            int rownum = sheet.getPhysicalNumberOfRows();
            int colnum = sheet.getRow(0).getPhysicalNumberOfCells();

            for (int i = 0; i < colnum; i++) {//获取列名
                name.add(sheet.getRow(0).getCell(i).getStringCellValue());
            }

            for (int i = 1; i < rownum; i++) {
                T t = c.newInstance();
                Row row = sheet.getRow(i);
                for (int j = 0; j < row.getPhysicalNumberOfCells(); j++) {

                    Class aClass = t.getClass();
                    Map.Entry<String, String> e = map.get(name.get(j));
                    Field field = aClass.getDeclaredField(e.getKey());
                    field.setAccessible(true);
                    switch (e.getValue()) {
                        case "int":
                            field.set(t, (int) row.getCell(j).getNumericCellValue());
                            break;
                        case "string":
                            field.set(t, row.getCell(j).getStringCellValue());
                            break;
                        case "double":
                            field.set(t, row.getCell(j).getNumericCellValue());
                            break;
                        default:
                            break;
                    }
                }
                list.add(t);
            }
        }
        return list;
    }

    private static String title[] = {"pv", "uv", "游戏优惠券", "首页优惠券", "楼层优惠券", "停车次数", "评论数", "意见反馈数", "拼图PV", "拼图UV", "对对碰PV", "对对碰UV", "门店id", "时间"};

    public static File getExcelFile(List<OptionStatus> list, String start, String end) {
        File file = null;
        try {
            Workbook workbook = new HSSFWorkbook();
            Sheet sheet = workbook.createSheet("日志表");
            Row row = sheet.createRow(0);
            for (int i = 0; i < title.length; i++) {
                row.createCell(i).setCellValue(title[i]);
            }

            for (int i = 1; i <= list.size(); i++) {
                row = sheet.createRow(i);
                OptionStatus op = list.get(i - 1);
//                System.out.println(op);
                row.createCell(0).setCellValue(op.getPv());
                row.createCell(1).setCellValue(op.getUv());
                row.createCell(2).setCellValue(op.getGameCoupon());
                row.createCell(3).setCellValue(op.getHeanCoupon());
                row.createCell(4).setCellValue(op.getFloorCoupon());
                row.createCell(5).setCellValue(op.getParking());
                row.createCell(6).setCellValue(op.getComment());
                row.createCell(7).setCellValue(op.getOpinion());
                row.createCell(8).setCellValue(op.getFightfChartPV());
                row.createCell(9).setCellValue(op.getFightfChartUV());
                row.createCell(10).setCellValue(op.getYesYesTouchPV());
                row.createCell(11).setCellValue(op.getYesYesTouchUV());
                row.createCell(12).setCellValue(op.getShopId());
                row.createCell(13).setCellValue(op.getFormatDate());
            }

            file = new File(FileUtil.getPath(FileUtil.EXCEL) + start + "-" + end + ".xls");
            System.out.println(file.getPath());
            if (!file.exists()) {
                if (!file.getParentFile().exists())
                    file.getParentFile().mkdirs();
                file.createNewFile();
            }
            OutputStream out = new FileOutputStream(file);
            workbook.write(out);
            out.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return file;
    }
}
