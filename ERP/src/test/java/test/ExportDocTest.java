//  package test;
//   
//   import java.io.ByteArrayInputStream;
//   import java.io.ByteArrayOutputStream;
//   import java.io.File;
//   import java.io.FileInputStream;
//   import java.io.FileOutputStream;
//   import java.io.IOException;
//   import java.io.OutputStream;
//   import java.util.HashMap;
//   import java.util.Map;
//  
//  import org.apache.poi.hwpf.HWPFDocument;
//  import org.apache.poi.hwpf.usermodel.Range;
//  import org.apache.poi.poifs.filesystem.DirectoryEntry;
//  import org.apache.poi.poifs.filesystem.POIFSFileSystem;
//  
//  
//   public class ExportDocTest {
//       
//       public static void main(String[] args) {
//           String destFile="D:\\123.doc";
//          //#####################根据自定义内容导出Word文档#################################################
//          StringBuffer fileCon=new StringBuffer();
//          fileCon.append("123");
//           
//           new ExportDocTest().exportDoc(destFile, fileCon.toString());
//           
//          //##################根据Word模板导出单个Word文档###################################################
//          Map<String, String> map=new HashMap<String, String>();
//          
//          map.put("name", "zz");
//          map.put("sex", "cc");
//          map.put("idCard", "vv");
//           map.put("year ", "vv");
//           map.put("month ", "bb");
//           map.put("year ", "nn");
//           map.put("month ", "是否");
//           map.put("gap", "跳舞任务");
//           map.put("zhuanye", "我让我任务");
//          map.put("type", "天天");
//          map.put("bianhao", "2日让");
//          map.put("nowy", "2日3人");
//          map.put("nowm", "2日日2 ");
//           map.put("nowd", "2日3日3日3人");
//           //注意biyezheng_moban.doc文档位置,此例中为应用根目录
//           HWPFDocument document=new ExportDocTest().replaceDoc("D:\\biyezheng_moban.doc", map);
//           ByteArrayOutputStream ostream = new ByteArrayOutputStream();
//           try {
//               document.write(ostream);
//               //输出word文件
//              OutputStream outs=new FileOutputStream(destFile);
//              outs.write(ostream.toByteArray());
//              outs.close();
//           } catch (IOException e) {
//               e.printStackTrace();
//           }
//           
//       }
//       
//       
//       /**
//       * 
//       * @param destFile
//        * @param fileCon
//        */
//       public void exportDoc(String destFile,String fileCon){
//           try {
//               //doc content
//               ByteArrayInputStream bais = new ByteArrayInputStream(fileCon.getBytes());
//               POIFSFileSystem fs = new POIFSFileSystem();
//               DirectoryEntry directory = fs.getRoot(); 
//               directory.createDocument("WordDocument", bais);
//              FileOutputStream ostream = new FileOutputStream(destFile);
//               fs.writeFilesystem(ostream);
//               bais.close();
//               ostream.close();
//               
//           } catch (IOException e) {
//               e.printStackTrace();
//           }
//       }
//       
//       
//       /**
//         * 读取word模板并替换变量
//         * @param srcPath
//         * @param map
//         * @return
//         */
//        public HWPFDocument replaceDoc(String srcPath, Map<String, String> map) {
//            try {
//                // 读取word模板
//                FileInputStream fis = new FileInputStream(new File(srcPath));
//                HWPFDocument doc = new HWPFDocument(fis);
//                // 读取word文本内容
//                Range bodyRange = doc.getRange();
//                // 替换文本内容
//                for (Map.Entry<String, String> entry : map.entrySet()) {
//                    bodyRange.replaceText("${" + entry.getKey() + "}", entry
//                            .getValue());
//                }
//                return doc;
//            } catch (Exception e) {
//                e.printStackTrace();
//                return null;
//            }
//        }
//    
//    }
