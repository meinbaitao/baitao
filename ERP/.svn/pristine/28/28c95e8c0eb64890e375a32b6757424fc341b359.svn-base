package com.bt.modules.contract.service;
import com.jacob.activeX.ActiveXComponent;
import com.jacob.com.Dispatch;
import com.jacob.com.Variant;
import com.jacob.com.ComThread;

public class Jacob4word {

 public Jacob4word() {
 }

 // 声明一个静态的类实例化对象
 private static Jacob4word instance;
 // 声明word文档对象
 private Dispatch doc = null;
 // 声明word文档当前活动视窗对象
 private Dispatch activeWindow = null;
 // 声明word文档选定区域或插入点对象
 private Dispatch docSelection = null;
 // 声明所有word文档集合对象
 private Dispatch wrdDocs = null;
 // 声明word文档名称对象
 private String fileName;
 // 选定的范围或插入点  
 private Dispatch selection; 
 
 // 声明ActiveX组件对象：word.Application,Excel.Application,Powerpoint.Application等等
 private ActiveXComponent wrdCom;

 /**
  * 获取Word操作静态实例对象
  * 
  * @return 报表汇总业务操作
  */
 public final static synchronized Jacob4word getInstance() {
  if (instance == null)
   instance = new Jacob4word();
  return instance;
 }

 /**
  * 初始化Word对象
  * 
  * @return 是否初始化成功
  */
 public boolean initWordObj() {
  boolean retFlag = false;
  ComThread.InitSTA();// 初始化com的线程，非常重要！！使用结束后要调用 realease方法
  wrdCom = new ActiveXComponent("Word.Application");// 实例化ActiveX组件对象：对word进行操作
  try {
   /*
    * 返回wrdCom.Documents的Dispatch
    * 获取Dispatch的Documents对象，可以把每个Dispatch对象看成是对Activex控件的一个操作
    * 这一步是获得该ActiveX控件的控制权。
    */
   wrdDocs = wrdCom.getProperty("Documents").toDispatch();
   // 设置打开的word应用程序是否可见
   wrdCom.setProperty("Visible", new Variant(false));
   
   retFlag = true;
  } catch (Exception e) {
   retFlag = false;
   e.printStackTrace();
  }
  return retFlag;
 }

 /**
  * 创建一个新的word文档
  * 
  */
 public void createNewDocument() {
  // 创建一个新的文档
  doc = Dispatch.call(wrdDocs, "Add").toDispatch();
  // 获得当前word文档文本
  docSelection = Dispatch.get(wrdCom, "Selection").toDispatch();
 }

 /**
  * 取得活动窗体对象
  * 
  */
 public void getActiveWindow() {
  // 获得活动窗体对象
  activeWindow = wrdCom.getProperty("ActiveWindow").toDispatch();
 }

 /**
  * 打开一个已存在的文档
  * 
  * @param docPath
  */
 public void openDocument(String docPath) {
  if (this.doc != null) {
   this.closeDocument();
  }
  this.doc = Dispatch.call(wrdDocs, "Open", docPath).toDispatch();
  this.docSelection = Dispatch.get(wrdCom, "Selection").toDispatch();
 }

 /**
  * 关闭当前word文档
  * 
  */
 public void closeDocument() {
  if (this.doc != null) {
   Dispatch.call(this.doc, "Save");
   Dispatch.call(this.doc, "Close", new Variant(true));
   this.doc = null;
  }
 }
  /**
  * 文档设置图片水印
  * 
  * @param waterMarkPath
  *            水印路径  */
 public void setWaterMark(String waterMarkPath) {
  // 取得活动窗格对象
  Dispatch activePan = Dispatch.get(this.activeWindow, "ActivePane")
    .toDispatch();
  // 取得视窗对象
  Dispatch view = Dispatch.get(activePan, "View").toDispatch();
  // 打开页眉，值为9，页脚为10
  Dispatch.put(view, "SeekView", new Variant(9));
  //获取页眉和页脚
  Dispatch headfooter = Dispatch.get(this.docSelection, "HeaderFooter")
    .toDispatch();
  // 获取水印图形对象
  Dispatch shapes = Dispatch.get(headfooter, "Shapes").toDispatch();
  // 给文档全部加上水印,设置了水印效果，内容，字体，大小，是否加粗，是否斜体，左边距，上边距。
    //调用shapes对象的AddPicture方法将全路径为picname的图片插入当前文档
     Dispatch picture = Dispatch.call(shapes, "AddPicture", waterMarkPath).toDispatch();
  //选择当前word文档的水印
  Dispatch.call(picture, "Select");
  Dispatch.put(picture, "Left", new Variant(0));
  Dispatch.put(picture, "Top", new Variant(150));
  Dispatch.put(picture, "Width", new Variant(350));
  Dispatch.put(picture, "Height", new Variant(350));
 
 //关闭页眉
  Dispatch.put(view, "SeekView", new Variant(0));
 }

 /**
  * 关闭Word资源
  * 
  * 
  */
 public void closeWordObj() {
  // 关闭word文件
  wrdCom.invoke("Quit", new Variant[] {});
  // 释放com线程。根据jacob的帮助文档，com的线程回收不由java的垃圾回收器处理
  ComThread.Release();
 }

 /**
  * 得到文件名
  * 
  * @return .
  */
 public String getFileName() {
  return fileName;
 }

 /**
  * 设置文件名
  * 
  * @param fileName .
  */
 public void setFileName(String fileName) {
  this.fileName = fileName;
 }

 /**
  * 开始为word文档添加水印
  * 
  * @param wordPath
  *            word文档的路径
  * @param waterMarkPath
  *            添加的水印图片路径
  * @return 是否成功添加
  */
 public boolean addWaterMark(String wordPath, String waterMarkPath) {
  try {
   if (initWordObj()) {
    openDocument(wordPath);
    getActiveWindow();
    setHeaderContent("XX");
    setWaterMark(waterMarkPath);
    closeDocument();
    closeWordObj();
    return true;

   } else
    return false;
  } catch (Exception e) {
      e.printStackTrace();
      closeDocument();
      closeWordObj();
      return false;
  }
 }
 
 
 /** 
  * 设置页眉文字 
  *  
  * @param cont 
  * @return 
  *  
  *         Sub AddHeaderText() '设置页眉或页脚中的文字 '由 Headers、Footers 和 
  *         HeaderFooter 属性返回 HeaderFooter 对象。下列示例更改当前页眉中的文字。 With 
  *         ActiveDocument.ActiveWindow.View .SeekView = 
  *         wdSeekCurrentPageHeader Selection.HeaderFooter.Range.Text = 
  *         "Header text" .SeekView = wdSeekMainDocument End With End Sub 
  */  
 public void setHeaderContent(String cont) {  
     Dispatch view = Dispatch.get(this.activeWindow, "View").toDispatch();  
     // Dispatch seekView = Dispatch.get(view, "SeekView").toDispatch();  
     Dispatch.put(view, "SeekView", new Variant(9)); // wdSeekCurrentPageHeader-9  
     
     selection = Dispatch.get(this.wrdCom, "Selection").toDispatch(); 
     
     Dispatch headerFooter = Dispatch.get(selection, "HeaderFooter")  
             .toDispatch();  
     Dispatch range = Dispatch.get(headerFooter, "Range").toDispatch();  
     String content = Dispatch.get(range, "Text").toString();  
//     Dispatch.put(range, "Text", content);  
     
     Dispatch font = Dispatch.get(range, "Font").toDispatch();  

//     Dispatch.put(font, "Name", new Variant("宋体 (中文正文)"));  
     Dispatch.put(font, "Bold", new Variant(false));  
//     Dispatch.put(font, "Italic", new Variant(true));  
//      Dispatch.put(font, "Underline", new Variant(true));  
//     Dispatch.put(font, "Size", 9);  

     Dispatch.put(view, "SeekView", new Variant(0)); // wdSeekMainDocument-0恢复视图;  
 }  
 
 /** 
  * 打印当前word文档 
  *  
  */  
 public void printFile() {  
     if (doc != null) {  
         Dispatch.call(doc, "PrintOut");  
     }  
 }
 
 /**
  * 开始为word文档添加水印
  * 
  * @param wordPath
  *            word文档的路径
  * @param waterMarkPath
  *            添加的水印图片路径
  * @return 是否成功添加
  */
 public boolean printCurrentFile(String wordPath) {
  try {
   if (initWordObj()) {
    openDocument(wordPath);
    printFile();
    closeDocument();
    closeWordObj();
    return true;

   } else
    return false;
  } catch (Exception e) {
      e.printStackTrace();
      closeDocument();
      closeWordObj();
      return false;
  }
 }
 
 
 public boolean insertImage(String wordPath,String imagePath)
 {
      try {
           if (initWordObj()) {
            openDocument(wordPath);
            getActiveWindow();
            // 用于指定位置MoveRight以及MoveDown
            Dispatch selection = Dispatch.get(wrdCom, "Selection").toDispatch();    
            for(int i = 0; i < 10; i++){
                Dispatch.call(selection, "MoveRight");
            }
            for(int i = 0; i < 10; i++){
                Dispatch.call(selection, "MoveDown");
            }
            Dispatch image = Dispatch.get(selection, "InlineShapes").toDispatch();
            Dispatch dv = Dispatch.call(image, "AddPicture", imagePath).toDispatch();            
            Dispatch.call(dv, "Select");
            
            //Dispatch Left = Dispatch.get(position, "Left").toDispatch();
            selection = Dispatch.get(wrdCom, "Selection").toDispatch();
            Dispatch shaperange   = Dispatch.get(selection, "ShapeRange").toDispatch();
            Dispatch wf = Dispatch.get(shaperange, "WrapFormat").toDispatch();
            Dispatch.put(wf, "Type", "6");
            int pcnt = Integer.parseInt(Dispatch.call(selection,"information",4).toString());
            for(int p = 1; p < pcnt; p++){
                Dispatch.invoke(selection, "Goto", Dispatch.Method, new Object[] {1, 2, String.valueOf(p)}, new int[1]);
                for(int i = 0; i < 10; i++){
                    Dispatch.call(selection, "MoveRight");
                }
                for(int i = 0; i < 10; i++){
                    Dispatch.call(selection, "MoveDown");
                }
                Dispatch imagef = Dispatch.get(selection, "InlineShapes").toDispatch();
                Dispatch dvf = Dispatch.call(imagef, "AddPicture", imagePath).toDispatch();            
                Dispatch.call(dvf, "Select");
                
                //Dispatch Left = Dispatch.get(position, "Left").toDispatch();
                selection = Dispatch.get(wrdCom, "Selection").toDispatch();
                Dispatch shaperangef   = Dispatch.get(selection, "ShapeRange").toDispatch();
                Dispatch wff = Dispatch.get(shaperangef, "WrapFormat").toDispatch();
                Dispatch.put(wff, "Type", "6");
                
                Dispatch.put(selection, "Start", 0); // 回到页首
            }
             
            closeDocument();
            closeWordObj();
            return true;
           } else
            return false;
          } catch (Exception e) {
              e.printStackTrace();
              closeDocument();
              closeWordObj();
              return false;
          }
 }
 
 /** 
  * 保护当前档,如果不存在, 使用expression.Protect(Type, NoReset, Password) 
  *  
  * @param pwd 
  *            WdProtectionType 可以是下列 WdProtectionType 常量之一： 
  *            1-wdAllowOnlyComments, 2-wdAllowOnlyFormFields, 
  *            0-wdAllowOnlyRevisions, -1-wdNoProtection, 
  *            3-wdAllowOnlyReading 
  *  
  *            使用参照 main1() 
  */  
 public void protectedWord(String pwd) {  
     String protectionType = Dispatch.get(doc, "ProtectionType").toString();  
     if (protectionType.equals("-1")) {  
         Dispatch.call(doc, "Protect", new Variant(3), new Variant(true),  
                 pwd);  
     }  
 } 

 /**
  * 写保护
  */
 public boolean protectFile(String wordPath,String pwd) {
  try {
   if (initWordObj()) {
    openDocument(wordPath);
    protectedWord(pwd);
    closeDocument();
    closeWordObj();
    return true;

   } else
    return false;
  } catch (Exception e) {
      e.printStackTrace();
      closeDocument();
      closeWordObj();
      return false;
  }
 }
 
 /**
  * 测试功能
  * 
  */
 public static void main(String[] argv) {
  Jacob4word wordObj = Jacob4word.getInstance();
//System.out.println(wordObj.getDocPages());
//  wordObj.insertImage("d://dy//word2.doc", "d://dy//waterprint.png");
  wordObj.addWaterMark("f://dy//word2.doc", "f://dy//waterprint.png");
  
  System.out.println("done");
 }
}