/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.viewcontractprogress.entity;

import java.util.List;

import org.hibernate.validator.constraints.Length;

import com.bt.modules.project.entity.Subproject;
import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 报表Entity
 * @author lky
 * @version 2015-11-30
 */
public class ViewContractProgress extends DataEntity<ViewContractProgress> {
	
	private static final long serialVersionUID = 1L;
	private String pid;		// 项目编号
	private String pname;		// 项目名称
	private String pcode;		// 项目简称
	private String plocation;		// 苑区
	private String pareaName;		// 名称
	private String pprovince;		// 省_市_区名称
	private String pcity;		// 省_市_区名称
	private String ptown;		// 省_市_区名称
	private String pbusinessline;		// 标签名
	private String pstatus;		// 状态
	private String starttime;		// 计划开工时间
	private String endtime;		// 计划完工时间
	private String prmanagername;		// 姓名
	private String pcmanagername;		// 姓名
	private String psmaterialname;		// 姓名
	private String pcconstructname;		// 姓名
	private String prflag;		// 是否需要周报
	private String pcompy;		// 项目公司名称
	private String pjmanagername;		// 姓名
	private String generalManagerMobile;		// 甲方项目总经理联系方式
	private String pjamanagername;		// 姓名
	private String regionalManagerMobile;		// 甲方项目区域总联系方式
	private String pjfmanagername;		// 姓名
	private String localManagerMobile;		// 甲方现场跟进人联系方式
	private String preport;		// preport
	private String pisreport;		// pisreport
	private String pisattachunit;		// pisattachunit
	private String pdesignmanager;		// pdesignmanager
	
	private String pdesignerbname;		// 姓名
	private String pcostmanagername;		// 姓名
	private String pcostmanagermobile;		// 成本负责人联系方式
	private String pcostgrouper;		// 姓名
	private String pcostleader;		// 姓名
	private String pzbpercent;		// pzbpercent
	private String contractid;		// 合同编号
	private String contractname;		// 合同名称
	private String contractcost;		// 合同造价
	private String contractastone;		// 石材总面积
	private String contractecost;		// 估算造价
	private String contractearea;		// 预算面积
	private String contractprepayratio;		// 预付款比例
	private String signedcounterparty;		// 签约对方
	private String operationunit;		// 施工/外包单位
	private String contractattachunit;		// 挂靠单位
	private String attachfeeratio;		// 挂靠费比例
	private String signeddate;		// 签约日期
	private String completiondate;		// 竣工验收日期
	private String paycollectionratio;		// 收款条款比例
	private String contractsettlearea;		// 结算面积
	private String contractsettleamount;		// 结算金额
	private String contractsettledate;		// 结算日期
	private String stamptaxapplied;		// 印花税申购
	private String certapplied;		// 外经证办理
	private String certexpirydate;		// 外经证到期日
	private String taxratio;		// 当地综合税率
	private String contractremark;		// 备注信息
	private String workflowid;		// 工作流
	private String workflowstatus;		// 工作流状态
	private String attachunit;		// 挂靠单位
    private String paddress;     //项目地址
    private List<ViewSubprojectProgress> subList;
	public ViewContractProgress() {
		super();
	}

	public ViewContractProgress(String id){
		super(id);
	}

	@Length(min=1, max=64, message="项目编号长度必须介于 1 和 64 之间")
	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}
	
	@Length(min=1, max=200, message="项目名称长度必须介于 1 和 200 之间")
	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}
	
	@Length(min=0, max=64, message="项目简称长度必须介于 0 和 64 之间")
	public String getPcode() {
		return pcode;
	}

	public void setPcode(String pcode) {
		this.pcode = pcode;
	}
	
	@Length(min=0, max=50, message="苑区长度必须介于 0 和 50 之间")
	public String getPlocation() {
		return plocation;
	}

	public void setPlocation(String plocation) {
		this.plocation = plocation;
	}
	
	@Length(min=0, max=100, message="名称长度必须介于 0 和 100 之间")
	public String getPareaName() {
		return pareaName;
	}

	public void setPareaName(String pareaName) {
		this.pareaName = pareaName;
	}
	
	@Length(min=0, max=50, message="省_市_区名称长度必须介于 0 和 50 之间")
	public String getPprovince() {
		return pprovince;
	}

	public void setPprovince(String pprovince) {
		this.pprovince = pprovince;
	}
	
	@Length(min=0, max=50, message="省_市_区名称长度必须介于 0 和 50 之间")
	public String getPcity() {
		return pcity;
	}

	public void setPcity(String pcity) {
		this.pcity = pcity;
	}
	
	@Length(min=0, max=50, message="省_市_区名称长度必须介于 0 和 50 之间")
	public String getPtown() {
		return ptown;
	}

	public void setPtown(String ptown) {
		this.ptown = ptown;
	}
	
	@Length(min=0, max=100, message="标签名长度必须介于 0 和 100 之间")
	public String getPbusinessline() {
		return pbusinessline;
	}

	public void setPbusinessline(String pbusinessline) {
		this.pbusinessline = pbusinessline;
	}
	
	@Length(min=0, max=1, message="状态长度必须介于 0 和 1 之间")
	public String getPstatus() {
		return pstatus;
	}

	public void setPstatus(String pstatus) {
		this.pstatus = pstatus;
	}
	
	@Length(min=0, max=64, message="计划开工时间长度必须介于 0 和 64 之间")
	public String getStarttime() {
		return starttime;
	}

	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	
	@Length(min=0, max=64, message="计划完工时间长度必须介于 0 和 64 之间")
	public String getEndtime() {
		return endtime;
	}

	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}
	
	@Length(min=0, max=100, message="姓名长度必须介于 0 和 100 之间")
	public String getPrmanagername() {
		return prmanagername;
	}

	public void setPrmanagername(String prmanagername) {
		this.prmanagername = prmanagername;
	}
	
	@Length(min=0, max=100, message="姓名长度必须介于 0 和 100 之间")
	public String getPcmanagername() {
		return pcmanagername;
	}

	public void setPcmanagername(String pcmanagername) {
		this.pcmanagername = pcmanagername;
	}
	
	@Length(min=0, max=100, message="姓名长度必须介于 0 和 100 之间")
	public String getPsmaterialname() {
		return psmaterialname;
	}

	public void setPsmaterialname(String psmaterialname) {
		this.psmaterialname = psmaterialname;
	}
	
	@Length(min=0, max=100, message="姓名长度必须介于 0 和 100 之间")
	public String getPcconstructname() {
		return pcconstructname;
	}

	public void setPcconstructname(String pcconstructname) {
		this.pcconstructname = pcconstructname;
	}
	
	@Length(min=0, max=1, message="是否需要周报长度必须介于 0 和 1 之间")
	public String getPrflag() {
		return prflag;
	}

	public void setPrflag(String prflag) {
		this.prflag = prflag;
	}
	
	@Length(min=0, max=100, message="项目公司名称长度必须介于 0 和 100 之间")
	public String getPcompy() {
		return pcompy;
	}

	public void setPcompy(String pcompy) {
		this.pcompy = pcompy;
	}
	
	@Length(min=0, max=100, message="姓名长度必须介于 0 和 100 之间")
	public String getPjmanagername() {
		return pjmanagername;
	}

	public void setPjmanagername(String pjmanagername) {
		this.pjmanagername = pjmanagername;
	}
	
	@Length(min=0, max=50, message="甲方项目总经理联系方式长度必须介于 0 和 50 之间")
	public String getGeneralManagerMobile() {
		return generalManagerMobile;
	}

	public void setGeneralManagerMobile(String generalManagerMobile) {
		this.generalManagerMobile = generalManagerMobile;
	}
	
	@Length(min=0, max=100, message="姓名长度必须介于 0 和 100 之间")
	public String getPjamanagername() {
		return pjamanagername;
	}

	public void setPjamanagername(String pjamanagername) {
		this.pjamanagername = pjamanagername;
	}
	
	@Length(min=0, max=50, message="甲方项目区域总联系方式长度必须介于 0 和 50 之间")
	public String getRegionalManagerMobile() {
		return regionalManagerMobile;
	}

	public void setRegionalManagerMobile(String regionalManagerMobile) {
		this.regionalManagerMobile = regionalManagerMobile;
	}
	
	@Length(min=0, max=100, message="姓名长度必须介于 0 和 100 之间")
	public String getPjfmanagername() {
		return pjfmanagername;
	}

	public void setPjfmanagername(String pjfmanagername) {
		this.pjfmanagername = pjfmanagername;
	}
	
	@Length(min=0, max=50, message="甲方现场跟进人联系方式长度必须介于 0 和 50 之间")
	public String getLocalManagerMobile() {
		return localManagerMobile;
	}

	public void setLocalManagerMobile(String localManagerMobile) {
		this.localManagerMobile = localManagerMobile;
	}
	
	@Length(min=0, max=1, message="preport长度必须介于 0 和 1 之间")
	public String getPreport() {
		return preport;
	}

	public void setPreport(String preport) {
		this.preport = preport;
	}
	
	@Length(min=0, max=1, message="pisreport长度必须介于 0 和 1 之间")
	public String getPisreport() {
		return pisreport;
	}

	public void setPisreport(String pisreport) {
		this.pisreport = pisreport;
	}
	
	@Length(min=0, max=1, message="pisattachunit长度必须介于 0 和 1 之间")
	public String getPisattachunit() {
		return pisattachunit;
	}

	public void setPisattachunit(String pisattachunit) {
		this.pisattachunit = pisattachunit;
	}
	
	public String getPdesignmanager() {
		return pdesignmanager;
	}

	public void setPdesignmanager(String pdesignmanager) {
		this.pdesignmanager = pdesignmanager;
	}
	
	@Length(min=0, max=100, message="姓名长度必须介于 0 和 100 之间")
	public String getPdesignerbname() {
		return pdesignerbname;
	}

	public void setPdesignerbname(String pdesignerbname) {
		this.pdesignerbname = pdesignerbname;
	}
	
	@Length(min=0, max=100, message="姓名长度必须介于 0 和 100 之间")
	public String getPcostmanagername() {
		return pcostmanagername;
	}

	public void setPcostmanagername(String pcostmanagername) {
		this.pcostmanagername = pcostmanagername;
	}
	
	@Length(min=0, max=50, message="成本负责人联系方式长度必须介于 0 和 50 之间")
	public String getPcostmanagermobile() {
		return pcostmanagermobile;
	}

	public void setPcostmanagermobile(String pcostmanagermobile) {
		this.pcostmanagermobile = pcostmanagermobile;
	}
	
	@Length(min=0, max=100, message="姓名长度必须介于 0 和 100 之间")
	public String getPcostgrouper() {
		return pcostgrouper;
	}

	public void setPcostgrouper(String pcostgrouper) {
		this.pcostgrouper = pcostgrouper;
	}
	
	@Length(min=0, max=100, message="姓名长度必须介于 0 和 100 之间")
	public String getPcostleader() {
		return pcostleader;
	}

	public void setPcostleader(String pcostleader) {
		this.pcostleader = pcostleader;
	}
	
	@Length(min=1, max=2, message="pzbpercent长度必须介于 1 和 2 之间")
	public String getPzbpercent() {
		return pzbpercent;
	}

	public void setPzbpercent(String pzbpercent) {
		this.pzbpercent = pzbpercent;
	}
	
	@Length(min=0, max=200, message="合同编号长度必须介于 0 和 200 之间")
	public String getContractid() {
		return contractid;
	}

	public void setContractid(String contractid) {
		this.contractid = contractid;
	}
	
	@Length(min=0, max=100, message="合同名称长度必须介于 0 和 100 之间")
	public String getContractname() {
		return contractname;
	}

	public void setContractname(String contractname) {
		this.contractname = contractname;
	}
	
	@Length(min=0, max=20, message="合同造价长度必须介于 0 和 20 之间")
	public String getContractcost() {
		return contractcost;
	}

	public void setContractcost(String contractcost) {
		this.contractcost = contractcost;
	}
	
	@Length(min=0, max=20, message="石材总面积长度必须介于 0 和 20 之间")
	public String getContractastone() {
		return contractastone;
	}

	public void setContractastone(String contractastone) {
		this.contractastone = contractastone;
	}
	
	@Length(min=0, max=20, message="估算造价长度必须介于 0 和 20 之间")
	public String getContractecost() {
		return contractecost;
	}

	public void setContractecost(String contractecost) {
		this.contractecost = contractecost;
	}
	
	@Length(min=0, max=20, message="预算面积长度必须介于 0 和 20 之间")
	public String getContractearea() {
		return contractearea;
	}

	public void setContractearea(String contractearea) {
		this.contractearea = contractearea;
	}
	
	@Length(min=0, max=20, message="预付款比例长度必须介于 0 和 20 之间")
	public String getContractprepayratio() {
		return contractprepayratio;
	}

	public void setContractprepayratio(String contractprepayratio) {
		this.contractprepayratio = contractprepayratio;
	}
	
	@Length(min=0, max=100, message="签约对方长度必须介于 0 和 100 之间")
	public String getSignedcounterparty() {
		return signedcounterparty;
	}

	public void setSignedcounterparty(String signedcounterparty) {
		this.signedcounterparty = signedcounterparty;
	}
	
	@Length(min=0, max=100, message="施工/外包单位长度必须介于 0 和 100 之间")
	public String getOperationunit() {
		return operationunit;
	}

	public void setOperationunit(String operationunit) {
		this.operationunit = operationunit;
	}
	
	@Length(min=0, max=200, message="挂靠单位长度必须介于 0 和 200 之间")
	public String getContractattachunit() {
		return contractattachunit;
	}

	public void setContractattachunit(String contractattachunit) {
		this.contractattachunit = contractattachunit;
	}
	
	@Length(min=0, max=20, message="挂靠费比例长度必须介于 0 和 20 之间")
	public String getAttachfeeratio() {
		return attachfeeratio;
	}

	public void setAttachfeeratio(String attachfeeratio) {
		this.attachfeeratio = attachfeeratio;
	}
	
	@Length(min=0, max=20, message="签约日期长度必须介于 0 和 20 之间")
	public String getSigneddate() {
		return signeddate;
	}

	public void setSigneddate(String signeddate) {
		this.signeddate = signeddate;
	}
	
	@Length(min=0, max=20, message="竣工验收日期长度必须介于 0 和 20 之间")
	public String getCompletiondate() {
		return completiondate;
	}

	public void setCompletiondate(String completiondate) {
		this.completiondate = completiondate;
	}
	
	@Length(min=0, max=20, message="收款条款比例长度必须介于 0 和 20 之间")
	public String getPaycollectionratio() {
		return paycollectionratio;
	}

	public void setPaycollectionratio(String paycollectionratio) {
		this.paycollectionratio = paycollectionratio;
	}
	
	@Length(min=0, max=20, message="结算面积长度必须介于 0 和 20 之间")
	public String getContractsettlearea() {
		return contractsettlearea;
	}

	public void setContractsettlearea(String contractsettlearea) {
		this.contractsettlearea = contractsettlearea;
	}
	
	@Length(min=0, max=20, message="结算金额长度必须介于 0 和 20 之间")
	public String getContractsettleamount() {
		return contractsettleamount;
	}

	public void setContractsettleamount(String contractsettleamount) {
		this.contractsettleamount = contractsettleamount;
	}
	
	@Length(min=0, max=20, message="结算日期长度必须介于 0 和 20 之间")
	public String getContractsettledate() {
		return contractsettledate;
	}

	public void setContractsettledate(String contractsettledate) {
		this.contractsettledate = contractsettledate;
	}
	
	@Length(min=0, max=50, message="印花税申购长度必须介于 0 和 50 之间")
	public String getStamptaxapplied() {
		return stamptaxapplied;
	}

	public void setStamptaxapplied(String stamptaxapplied) {
		this.stamptaxapplied = stamptaxapplied;
	}
	
	@Length(min=0, max=50, message="外经证办理长度必须介于 0 和 50 之间")
	public String getCertapplied() {
		return certapplied;
	}

	public void setCertapplied(String certapplied) {
		this.certapplied = certapplied;
	}
	
	@Length(min=0, max=20, message="外经证到期日长度必须介于 0 和 20 之间")
	public String getCertexpirydate() {
		return certexpirydate;
	}

	public void setCertexpirydate(String certexpirydate) {
		this.certexpirydate = certexpirydate;
	}
	
	@Length(min=0, max=20, message="当地综合税率长度必须介于 0 和 20 之间")
	public String getTaxratio() {
		return taxratio;
	}

	public void setTaxratio(String taxratio) {
		this.taxratio = taxratio;
	}
	
	@Length(min=0, max=255, message="备注信息长度必须介于 0 和 255 之间")
	public String getContractremark() {
		return contractremark;
	}

	public void setContractremark(String contractremark) {
		this.contractremark = contractremark;
	}
	
	@Length(min=0, max=64, message="工作流长度必须介于 0 和 64 之间")
	public String getWorkflowid() {
		return workflowid;
	}

	public void setWorkflowid(String workflowid) {
		this.workflowid = workflowid;
	}
	
	@Length(min=0, max=1, message="工作流状态长度必须介于 0 和 1 之间")
	public String getWorkflowstatus() {
		return workflowstatus;
	}

	public void setWorkflowstatus(String workflowstatus) {
		this.workflowstatus = workflowstatus;
	}
	
	@Length(min=0, max=200, message="挂靠单位长度必须介于 0 和 200 之间")
	public String getAttachunit() {
		return attachunit;
	}

	public void setAttachunit(String attachunit) {
		this.attachunit = attachunit;
	}
	@Length(min=0, max=200, message="地址长度必须介于 0 和 200 之间")
	public String getpaddress()
	{
	  return paddress;	
	}
	public void setpaddress(String paddress)
	{
	  this.paddress=paddress;	
	}
	
	//二级项目集合
	public List<ViewSubprojectProgress> getSubList() {
		return subList;
	}

	public void setSubList(List<ViewSubprojectProgress> SubList) {
		this.subList = SubList;
	}
}