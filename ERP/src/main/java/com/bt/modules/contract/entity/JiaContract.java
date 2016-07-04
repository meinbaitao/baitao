/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.contract.entity;

import java.util.List;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.utils.excel.annotation.ExcelField;

/**
 * 甲方合同Entity
 * @author yhh
 * @version 2015-08-01
 */
public class JiaContract extends ConContainDetail<JiaContract,BtgConJiaContractDetail> {
	
	private static final long serialVersionUID = 1L;
	private String cid;		// 合同编号
	private String projectId;		//项目
	private String buildings;		//楼栋
	private String name;		// 合同名称
	private String status;		// 合同状态
	private String cost;		// 合同造价
	private String areaofstone;		// 石材总面积
	private String estimatedcost;		// 估算造价
	private String estimatedarea;		// 预算面积
	private String prepayratio;		// 预付款比例
	private String signedcounterparty;		// 签约对方
	private String operationunit;		// 施工/外包单位
	private String attachfeeratio;		// 挂靠费比例
	private String signeddate;		// 签约日期
	private String completiondate;		// 竣工验收日期
	private String paycollectionratio;		// 收款条款比例
	private String qualityratio;			//质保金比例
	private String settlearea;		// 结算面积
	private String settleamount;		// 结算金额
	private String settledate;		// 结算日期
	private String stamptaxapplied;		// 印花税申购
	private String certapplied;		// 外经证办理
	private String certexpirydate;		// 外经证到期日
	private String taxratio;		// 当地综合税率
	private String attachunit;		// 挂靠单位
	//private String workflowId;	//工作流
	//private String workflowStatus;	//工作流状态
	private String projectName;		//项目名
	private List<BtgConJiaContractDetail> detailList;       //甲方合同明细
	public JiaContract() {
		super();
	}

	public JiaContract(String id){
		super(id);
	}

	@Length(min=1, max=200, message="合同编号长度必须介于 1 和 200 之间")
	@ExcelField(title="合同编号", type=0, align=2, sort=1)
	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}
	
	public String getProjectId() {
		return projectId;
	}

	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}

	@Length(min=0, max=100, message="合同名称长度必须介于 0 和 100 之间")
	@ExcelField(title="合同名称", type=0, align=2, sort=2)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=10, message="合同状态长度必须介于 0 和 10 之间")
	@ExcelField(title="合同状态", type=0, align=2, sort=3)
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	@ExcelField(title="合同造价", type=0, align=2, sort=4)
	public String getCost() {
		return cost;
	}

	public void setCost(String cost) {
		this.cost = cost;
	}
	
	@ExcelField(title="石材总面积", type=0, align=2, sort=5)
	public String getAreaofstone() {
		return areaofstone;
	}

	public void setAreaofstone(String areaofstone) {
		this.areaofstone = areaofstone;
	}
	
	@ExcelField(title="估算造价", type=0, align=2, sort=6)
	public String getEstimatedcost() {
		return estimatedcost;
	}

	public void setEstimatedcost(String estimatedcost) {
		this.estimatedcost = estimatedcost;
	}
	
	@ExcelField(title="预算面积", type=0, align=2, sort=7)
	public String getEstimatedarea() {
		return estimatedarea;
	}

	public void setEstimatedarea(String estimatedarea) {
		this.estimatedarea = estimatedarea;
	}
	
	@ExcelField(title="预付款比例", type=0, align=2, sort=8)
	public String getPrepayratio() {
		return prepayratio;
	}

	public void setPrepayratio(String prepayratio) {
		this.prepayratio = prepayratio;
	}
	
	@Length(min=0, max=100, message="签约对方长度必须介于 0 和 100 之间")
	@ExcelField(title="签约对方", type=0, align=2, sort=9)
	public String getSignedcounterparty() {
		return signedcounterparty;
	}

	public void setSignedcounterparty(String signedcounterparty) {
		this.signedcounterparty = signedcounterparty;
	}
	
	@Length(min=0, max=100, message="施工/外包单位长度必须介于 0 和 100 之间")
	@ExcelField(title="施工/外包单位", type=0, align=2, sort=10)
	public String getOperationunit() {
		return operationunit;
	}

	public void setOperationunit(String operationunit) {
		this.operationunit = operationunit;
	}
	
	@ExcelField(title="挂靠费比例", type=0, align=2, sort=11)
	public String getAttachfeeratio() {
		return attachfeeratio;
	}

	public void setAttachfeeratio(String attachfeeratio) {
		this.attachfeeratio = attachfeeratio;
	}
	
	@ExcelField(title="签约日期yyyy-MM-dd", type=0, align=2, sort=12)
	@Length(min=0, max=20, message="签约日期长度必须介于 0 和 20 之间")
	public String getSigneddate() {
		return signeddate;
	}

	public void setSigneddate(String signeddate) {
		this.signeddate = signeddate;
	}
	
	@ExcelField(title="竣工验收日期yyyy-MM-dd", type=0, align=2, sort=13)
	@Length(min=0, max=20, message="竣工验收日期长度必须介于 0 和 20 之间")
	public String getCompletiondate() {
		return completiondate;
	}

	public void setCompletiondate(String completiondate) {
		this.completiondate = completiondate;
	}
	
	@ExcelField(title="收款条款比例", type=0, align=2, sort=14)
	public String getPaycollectionratio() {
		return paycollectionratio;
	}

	public void setPaycollectionratio(String paycollectionratio) {
		this.paycollectionratio = paycollectionratio;
	}
	
	@ExcelField(title="结算面积", type=0, align=2, sort=15)
	public String getSettlearea() {
		return settlearea;
	}

	public void setSettlearea(String settlearea) {
		this.settlearea = settlearea;
	}
	
	@ExcelField(title="结算金额", type=0, align=2, sort=16)
	public String getSettleamount() {
		return settleamount;
	}

	public void setSettleamount(String settleamount) {
		this.settleamount = settleamount;
	}
	
	@ExcelField(title="结算日期yyyy-MM-dd", type=0, align=2, sort=17)
	@Length(min=0, max=20, message="结算日期长度必须介于 0 和 20 之间")
	public String getSettledate() {
		return settledate;
	}

	public void setSettledate(String settledate) {
		this.settledate = settledate;
	}
	
	@ExcelField(title="印花税申购", type=0, align=2, sort=18)
	@Length(min=0, max=50, message="印花税申购长度必须介于 0 和 50 之间")
	public String getStamptaxapplied() {
		return stamptaxapplied;
	}

	public void setStamptaxapplied(String stamptaxapplied) {
		this.stamptaxapplied = stamptaxapplied;
	}
	
	@ExcelField(title="外经证办理", type=0, align=2, sort=20)
	@Length(min=0, max=50, message="外经证办理长度必须介于 0 和 50 之间")
	public String getCertapplied() {
		return certapplied;
	}

	public void setCertapplied(String certapplied) {
		this.certapplied = certapplied;
	}
	
	@ExcelField(title="外经证到日期yyyy-MM-dd", type=0, align=2, sort=21)
	@Length(min=0, max=20, message="外经证到期日长度必须介于 0 和 20 之间")
	public String getCertexpirydate() {
		return certexpirydate;
	}

	public void setCertexpirydate(String certexpirydate) {
		this.certexpirydate = certexpirydate;
	}

	@ExcelField(title="当地综合税率", type=0, align=2, sort=22)
	public String getTaxratio() {
		return taxratio;
	}

	@ExcelField(title="质保金比例", type=0, align=2, sort=23)
	public String getQualityratio() {
		return qualityratio;
	}

	public void setQualityratio(String qualityratio) {
		this.qualityratio = qualityratio;
	}

	public void setTaxratio(String taxratio) {
		this.taxratio = taxratio;
	}
	
	@ExcelField(title="挂靠单位", type=0, align=2, sort=24)
	@Length(min=0, max=200, message="挂靠单位长度必须介于 0 和 200 之间")
	public String getAttachunit() {
		return attachunit;
	}

	public void setAttachunit(String attachunit) {
		this.attachunit = attachunit;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getBuildings() {
		return buildings;
	}

	public void setBuildings(String buildings) {
		this.buildings = buildings;
	}
	public void setDetailList(List<BtgConJiaContractDetail> detailList) {
		this.detailList = detailList;
	}

	public List<BtgConJiaContractDetail> getDetailList() {
		return detailList;
	}
}