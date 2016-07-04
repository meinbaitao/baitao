/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.contract.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import org.apache.commons.io.FileUtils;
import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.hwpf.usermodel.Range;
import org.aspectj.apache.bcel.generic.SwitchBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bt.modules.contract.dao.ContractPrintDao;
import com.bt.modules.contract.dao.PurchasingContractBaseDao;
import com.bt.modules.contract.entity.ManufContractBase;
import com.bt.modules.contract.entity.PurchasingContractBase;
import com.thinkgem.jeesite.common.service.CrudService;

/**
 * 合同台账Service
 * @author yhh
 * @version 2015-12-01
 */
@Service
@Transactional(readOnly = true)
public class ContractPrintService extends CrudService<ContractPrintDao, ManufContractBase> {

	
	@Autowired
	private ContractPrintDao contractAccountDao;
	
	@Autowired
	private PurchasingContractBaseDao purchasingContractBaseDao;
	
	/**
	 * 
	 * @param parentId
	 * @return
	 */
	public ManufContractBase findTestData(String id){
		return contractAccountDao.findTestData(id);
	}
	
	/**
	 * 
	 * @param parentId
	 * @return
	 */
	public PurchasingContractBase getPurchaseContractById(PurchasingContractBase pcb){
		return purchasingContractBaseDao.getByContractId(pcb);
	}
	
	public  void writeWord(String sourcepath,String destpath,PurchasingContractBase data) throws FileNotFoundException, IOException {
		InputStream is = new FileInputStream(sourcepath);  
	    HWPFDocument doc = new HWPFDocument(is);  
	  
		String contractNo = "{XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX}";
		char[] ch = contractNo.toCharArray();
		String str2 =  "编号："+data.getContractNo();
		char[] chars = str2.toCharArray();
		
		for(int i = ch.length ,j= chars.length;i > 0 ;i--,j--){
			if(ch.length<=chars.length){
				ch[i] = chars[j];
			}else{
				if(i <= ch.length-chars.length){
					ch[i-1] = '\u0000';
				}else {
					ch[i-1] = chars[j-1];
				}
			}
		}
		
		Range headerrange= doc.getHeaderStoryRange();
		headerrange.replaceText(contractNo,String.valueOf(ch));
		  
		Range range = doc.getRange();  
		//把range范围内的${reportDate}替换为当前的日期  
		range.replaceText("{jiafang}", data.getContractJiafang()==null?"":data.getContractJiafang());  
		range.replaceText("{contractNo}", data.getContractNo()==null?"":data.getContractNo());
		range.replaceText("{partyBName}", data.getPartyBName()==null?"":data.getPartyBName());
		range.replaceText("{isIncludeCarriage}", data.getIsIncludeCarriage()==null?"":"1".equals(data.getIsIncludeCarriage())?"乙":"甲");
		
		String invoiceType = data.getInvoiceType();
		if( invoiceType != null ){
			if("不可开票".equals(invoiceType)){
				invoiceType = "不可开票";
			}else {
				invoiceType = invoiceType.replace("发票", "");
			}
		}
		range.replaceText("{invoiceType}", data.getInvoiceType()==null?"":invoiceType);
		range.replaceText("{taxRate}", data.getTaxRate()==null?"":data.getTaxRate());
		
		String settlementType = data.getSettlementType();
		if( settlementType != null && "月结".equals(settlementType)){
			settlementType = "30";
		}
		range.replaceText("{settlementType}", data.getSettlementType()==null?"":settlementType);
		
		
		String paymentType = data.getPaymentType();
		if( paymentType != null ){
			if("承兑汇票".equals(paymentType)||"银行承兑".equals(paymentType)){
				range.replaceText("{paymentType}", "0");
				range.replaceText("{paymentType2}", "100");
			}else if("转账".equals(paymentType)||"银行转账".equals(paymentType)){
				range.replaceText("{paymentType}", "100");
				range.replaceText("{paymentType2}", "0");
			}else if("转账,承兑汇票".equals(paymentType)||"承兑汇票,转账".equals(paymentType)){
				range.replaceText("{paymentType}", "30");
				range.replaceText("{paymentType2}", "70");
			}else{
				range.replaceText("{paymentType}", "0");
				range.replaceText("{paymentType2}", "0");
			}
		}
		range.replaceText("{qualityGuaranteePrice}", data.getQualityGuaranteePrice()==null?"":data.getQualityGuaranteePrice());
		range.replaceText("{endTime}", data.getEndTime()==null?"":data.getEndTime());
		range.replaceText("{startTime}", data.getStartTime()==null?"":data.getStartTime());
	      
		OutputStream os = new FileOutputStream(destpath);  
		//把doc输出到输出流中  
		doc.write(os);  
		closeStream(os);  
		closeStream(is);
	}  
	
	  private static void closeStream(OutputStream is) {  
	     if (is != null) {  
	        try {  
	           is.close();  
	        } catch (IOException e) {  
	           e.printStackTrace();  
	        }  
	     }  
	  }  
	  /** 
	   * 关闭输入流 
	   * @param is 
	   */  
	  private static void closeStream(InputStream is) {  
	     if (is != null) {  
	        try {  
	           is.close();  
	        } catch (IOException e) {  
	           e.printStackTrace();  
	        }  
	     }  
	  } 
	/**
	 * 复制文件到指定目录
	 * @param child
	 * @param parent
	 * @param srcFile
	 * @param destDir
	 */
	  
	public void copyfiletodir(String parent, String child, File srcFile, File destDir) {
		File file = new File(parent,child);
		if(!file.exists()){
			try {
				FileUtils.copyFileToDirectory(srcFile, destDir);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
}

