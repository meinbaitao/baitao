/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.financereport.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 分项目财务报表Entity
 * @author lky
 * @version 2015-12-21
 */
public class BtgFinancereport extends DataEntity<BtgFinancereport> {
	
	private static final long serialVersionUID = 1L;
	private int fid;
	private String fyear ;        //年份
	private String fmonth;        //月份
	private String fareaname;		// 区域
	private String fprovince;		// 省份
	private String fcontractcompyno;		// 公司内部合同编号
	private String fbuildings;		// 楼栋号
	private String fcontractno;		// 合同号
	private String fprojectcode;		// 项目简称
	private String fbusinessline;		// 业务板块
	private String fcontractarea;		// 合同面积
	private String fcontractmoney;		// 合同造价
	private String fzbratio;		// 质保金比例
	private String fsettlearea;		// 结算面积
	private String fsettlemoney;		// 结算金额
	private String ffinishdate;		// 竣工日期
	private String fsettledate;		// 结算日期
	private String fpvaluelastyear;		// 以前年度产值
	private String fpvaluethisyear;		// 本年度产值
	private String fpvaluesum;		// 累计产值
	private String fpvaluethismonth;		// 当月产值
	private String fcvaluesum;		// 累计成本
	private String fprofitvalue;		// 毛利
	private String fprofitratio;		// 毛利率
	private String freceivemoney;		// 应收金额（不含质保金）
	private String fprovemoney;		// 质保金
	private String fdeclinemoney;		// 其中：已到期质保金
	private String fzktaxmoney;		// 暂扣税金
	private String fkmanagemoney;		// 扣管理费
	private String fkelsemoney;		// 其他扣款
	private String frreceivemoney;		// 实际应收（含暂扣税金）
	private String ficsummoney;		// 累计开发票金额（含当月）
	private String ficmonthmoney;		// 当月开发票金额
	private String fbacksummoney;		// 累计回款（含当月）
	private String fbackmonthmoney;		// 当月回款
	private String frealbackmoney;		// 应收未收
	private String ftime1money;		// 1个月内账龄
	private String ftime2money;		// 2-3个月账龄
	private String ftime3money;		// 4－6个月账龄
	private String ftime4money;		// 7－12月账龄
	private String ftime5money;		// 1年－2年账龄
	private String ftime6money;		// 2年以上
	private String fstonejgcostprefee;		// 石材加工费 成本预算（控价）
	private String fstonetscostprefee;		// 石材运费 成本预算（控价）
	private String fsteelcostprefee;		// 钢材费 成本预算（控价）
	private String fematerialcostprefee;		// 其他材料费 成本预算（控价）
	private String flabourcostprefee;		// 劳务费   成本预算（控价）
	private String fmachinecostprefee;		// 机械使用费 成本预算（控价）
	private String faffiliatedcostprefee;		// 挂靠费     成本预算（控价）
	private String felseprojectcostprefee;		// 其他项目费  成本预算（控价）
	private String fsynmanagecostprefee;		// 综合管理费  成本预算（控价）
	private String fdangercostprefee;		// 风险     成本预算（控价）
	private String ftaxcostprefee;		// 税费     成本预算（控价）
	private String fcostsumprefee;		// 预算控价成本小计
	private String fprofitcostprefee;		// 预计利润    成本预算（控价）
	private String fprofitcostpreradio;		// 预计利润率   成本预算（控价）
	private String fprepaystonefee;		// 石材费   预计应付
	private String fprepaystonetsfee;		// 石材运费   预计应付
	private String fprepaysteelfee;		// 钢材费     预计应付
	private String fprepayematerialfee;		// 其他材料费   预计应付
	private String fprepaylabourfee;		// 劳务费      预计应付
	private String fprepaytaxfee;		// 税费        预计应付
	private String fprepaysumfee;		// 预计应付小计
	private String fstonercostlyearfee;		// 石材费     以前年度累计实际发生信息
	private String fstonetsrcostlyearfee;		// 石材运费   以前年度累计实际发生信息
	private String fsteelrcostlyearfee;		// 钢材费      以前年度累计实际发生信息
	private String fematerialrcostlyearfee;		// 其他材料费   以前年度累计实际发生信息
	private String flabourrcostlyearfee;		// 劳务费   以前年度累计实际发生信息
	private String faffiliatedrcostlyearfee;		// 挂靠费   以前年度累计实际发生信息
	private String ftaxrcostlyearfee;		// 税费      以前年度累计实际发生信息
	private String fsumrcostlyearfee;		// 以前年度累计实际发生小计
	private String fstonercosttyearfee;		// 石材费     本年度实际发生信息
	private String fstonetsrcosttyearfee;		// 石材运费   本年度实际发生信息
	private String fsteelrcosttyearfee;		// 钢材费     本年度实际发生信息
	private String fematerialrcosttyearfee;		// 其他材料费   本年度实际发生信息
	private String flabourrcosttyearfee;		// 劳务费   本年度实际发生信息
	private String faffiliatedrcosttyearfee;		// 挂靠费   本年度实际发生信息
	private String ftaxrcosttyearfee;		// 税费   本年度实际发生信息
	private String fsumrcosttyearfee;		// 应付小计   本年度实际发生信息
	private String fstonerpaylyearfee;		// 石材费     以前年度实际支付信息
	private String fstonetsrpaylyearfee;		// 石材运费    以前年度实际支付信息
	private String fsteelrpaylyearfee;		// 钢材费     以前年度实际支付信息
	private String fematerialrpaylyearfee;		// 其他材料费   以前年度实际支付信息
	private String flabourrpaylyearfee;		// 劳务费   以前年度实际支付信息
	private String ftaxrpaylyearfee;		// 税费   以前年度实际支付信息
	private String fsumrpaylyearfee;		// 实付 小计  以前年度实际支付信息
	private String fstonerpaytyearfee;		// 石材费     本年度实际支付信息
	private String fstonetsrpaytyearfee;		// 石材运费    本年度实际支付信息
	private String fsteelrpaytyearfee;		// 钢材费     本年度实际支付信息
	private String fematerialrpaytyearfee;		// 其他材料费   本年度实际支付信息
	private String flabourrpaytyearfee;		// 劳务费   本年度实际支付信息
	private String ftaxrpaytyearfee;		// 税费   本年度实际支付信息
	private String fsumrpaytyearfee;		// 实付 小计  本年度实际支付信息
	private String fstonesubpayfee;		// 石材费      应付未付信息
	private String fstoentssubpayfee;		// 石材运费    应付未付信息
	private String fsteelsubpayfee;		// 钢材费     应付未付信息
	private String fematerialsubpayfee;		// 其他材料费   应付未付信息
	private String flaboursubpayfee;		// 劳务费    应付未付信息
	private String ftaxsubpayfee;		// 税费     应付未付信息
	private String fsumsubpayfee;		// 应付未付小计
	private String fstoneplanpayfee;		// 石材费    下月付款计划
	private String fstonetsplanpayfee;		// 石材运费   下月付款计划
	private String fsteelplanpayfee;		// 钢材费     下月付款计划
	private String fematerialplanpayfee;		// 其他材料费   下月付款计划
	private String flabourplanpayfee;		// 劳务费    下月付款计划
	private String ftaxplanpayfee;		// 税费  下月付款计划
	private String fsumplanpayfee;		// 下月付款计划小计
	
	public BtgFinancereport() {
		super();
	}

	public BtgFinancereport(String id){
		super(id);
	}
   
	@Length(min=0, max=100, message="区域长度必须介于 0 和 100 之间")
	public int getFid() {
		return fid;
	}
   
	public void setFid(int fid) {
		this.fid = fid;
	}
	@Length(min=0, max=100, message="区域长度必须介于 0 和 100 之间")
	public String getFyear() {
		return fyear;
	}
   
	public void setFyear(String fyear) {
		this.fyear = fyear;
	}
	
	@Length(min=0, max=100, message="区域长度必须介于 0 和 100 之间")
	public String getFmonth() {
		return fmonth;
	}
   
	public void setFmonth(String fmonth) {
		this.fmonth = fmonth;
	}
	
	
	
	
	@Length(min=0, max=100, message="区域长度必须介于 0 和 100 之间")
	public String getFareaname() {
		return fareaname;
	}

	
	public void setFareaname(String fareaname) {
		this.fareaname = fareaname;
	}
	
	@Length(min=0, max=100, message="省份长度必须介于 0 和 100 之间")
	public String getFprovince() {
		return fprovince;
	}

	public void setFprovince(String fprovince) {
		this.fprovince = fprovince;
	}
	
	@Length(min=0, max=100, message="公司内部合同编号长度必须介于 0 和 100 之间")
	public String getFcontractcompyno() {
		return fcontractcompyno;
	}

	public void setFcontractcompyno(String fcontractcompyno) {
		this.fcontractcompyno = fcontractcompyno;
	}
	
	@Length(min=0, max=100, message="楼栋号长度必须介于 0 和 100 之间")
	public String getFbuildings() {
		return fbuildings;
	}

	public void setFbuildings(String fbuildings) {
		this.fbuildings = fbuildings;
	}
	
	@Length(min=0, max=100, message="合同号长度必须介于 0 和 100 之间")
	public String getFcontractno() {
		return fcontractno;
	}

	public void setFcontractno(String fcontractno) {
		this.fcontractno = fcontractno;
	}
	
	@Length(min=0, max=100, message="项目简称长度必须介于 0 和 100 之间")
	public String getFprojectcode() {
		return fprojectcode;
	}

	public void setFprojectcode(String fprojectcode) {
		this.fprojectcode = fprojectcode;
	}
	
	@Length(min=0, max=100, message="业务板块长度必须介于 0 和 100 之间")
	public String getFbusinessline() {
		return fbusinessline;
	}

	public void setFbusinessline(String fbusinessline) {
		this.fbusinessline = fbusinessline;
	}
	
	public String getFcontractarea() {
		return fcontractarea;
	}

	public void setFcontractarea(String fcontractarea) {
		this.fcontractarea = fcontractarea;
	}
	
	public String getFcontractmoney() {
		return fcontractmoney;
	}

	public void setFcontractmoney(String fcontractmoney) {
		this.fcontractmoney = fcontractmoney;
	}
	
	public String getFzbratio() {
		return fzbratio;
	}

	public void setFzbratio(String fzbratio) {
		this.fzbratio = fzbratio;
	}
	
	public String getFsettlearea() {
		return fsettlearea;
	}

	public void setFsettlearea(String fsettlearea) {
		this.fsettlearea = fsettlearea;
	}
	
	public String getFsettlemoney() {
		return fsettlemoney;
	}

	public void setFsettlemoney(String fsettlemoney) {
		this.fsettlemoney = fsettlemoney;
	}
	
	
	public String getFfinishdate() {
		return ffinishdate;
	}

	public void setFfinishdate(String ffinishdate) {
		this.ffinishdate = ffinishdate;
	}
	
	
	public String getFsettledate() {
		return fsettledate;
	}

	public void setFsettledate(String fsettledate) {
		this.fsettledate = fsettledate;
	}
	
	public String getFpvaluelastyear() {
		return fpvaluelastyear;
	}

	public void setFpvaluelastyear(String fpvaluelastyear) {
		this.fpvaluelastyear = fpvaluelastyear;
	}
	
	public String getFpvaluethisyear() {
		return fpvaluethisyear;
	}

	public void setFpvaluethisyear(String fpvaluethisyear) {
		this.fpvaluethisyear = fpvaluethisyear;
	}
	
	public String getFpvaluesum() {
		return fpvaluesum;
	}

	public void setFpvaluesum(String fpvaluesum) {
		this.fpvaluesum = fpvaluesum;
	}
	
	public String getFpvaluethismonth() {
		return fpvaluethismonth;
	}

	public void setFpvaluethismonth(String fpvaluethismonth) {
		this.fpvaluethismonth = fpvaluethismonth;
	}
	
	public String getFcvaluesum() {
		return fcvaluesum;
	}

	public void setFcvaluesum(String fcvaluesum) {
		this.fcvaluesum = fcvaluesum;
	}
	
	public String getFprofitvalue() {
		return fprofitvalue;
	}

	public void setFprofitvalue(String fprofitvalue) {
		this.fprofitvalue = fprofitvalue;
	}
	
	public String getFprofitratio() {
		return fprofitratio;
	}

	public void setFprofitratio(String fprofitratio) {
		this.fprofitratio = fprofitratio;
	}
	
	public String getFreceivemoney() {
		return freceivemoney;
	}

	public void setFreceivemoney(String freceivemoney) {
		this.freceivemoney = freceivemoney;
	}
	
	public String getFprovemoney() {
		return fprovemoney;
	}

	public void setFprovemoney(String fprovemoney) {
		this.fprovemoney = fprovemoney;
	}
	
	public String getFdeclinemoney() {
		return fdeclinemoney;
	}

	public void setFdeclinemoney(String fdeclinemoney) {
		this.fdeclinemoney = fdeclinemoney;
	}
	
	public String getFzktaxmoney() {
		return fzktaxmoney;
	}

	public void setFzktaxmoney(String fzktaxmoney) {
		this.fzktaxmoney = fzktaxmoney;
	}
	
	public String getFkmanagemoney() {
		return fkmanagemoney;
	}

	public void setFkmanagemoney(String fkmanagemoney) {
		this.fkmanagemoney = fkmanagemoney;
	}
	
	public String getFkelsemoney() {
		return fkelsemoney;
	}

	public void setFkelsemoney(String fkelsemoney) {
		this.fkelsemoney = fkelsemoney;
	}
	
	public String getFrreceivemoney() {
		return frreceivemoney;
	}

	public void setFrreceivemoney(String frreceivemoney) {
		this.frreceivemoney = frreceivemoney;
	}
	
	public String getFicsummoney() {
		return ficsummoney;
	}

	public void setFicsummoney(String ficsummoney) {
		this.ficsummoney = ficsummoney;
	}
	
	public String getFicmonthmoney() {
		return ficmonthmoney;
	}

	public void setFicmonthmoney(String ficmonthmoney) {
		this.ficmonthmoney = ficmonthmoney;
	}
	
	public String getFbacksummoney() {
		return fbacksummoney;
	}

	public void setFbacksummoney(String fbacksummoney) {
		this.fbacksummoney = fbacksummoney;
	}
	
	public String getFbackmonthmoney() {
		return fbackmonthmoney;
	}

	public void setFbackmonthmoney(String fbackmonthmoney) {
		this.fbackmonthmoney = fbackmonthmoney;
	}
	
	public String getFrealbackmoney() {
		return frealbackmoney;
	}

	public void setFrealbackmoney(String frealbackmoney) {
		this.frealbackmoney = frealbackmoney;
	}
	
	public String getFtime1money() {
		return ftime1money;
	}

	public void setFtime1money(String ftime1money) {
		this.ftime1money = ftime1money;
	}
	
	public String getFtime2money() {
		return ftime2money;
	}

	public void setFtime2money(String ftime2money) {
		this.ftime2money = ftime2money;
	}
	
	public String getFtime3money() {
		return ftime3money;
	}

	public void setFtime3money(String ftime3money) {
		this.ftime3money = ftime3money;
	}
	
	public String getFtime4money() {
		return ftime4money;
	}

	public void setFtime4money(String ftime4money) {
		this.ftime4money = ftime4money;
	}
	
	public String getFtime5money() {
		return ftime5money;
	}

	public void setFtime5money(String ftime5money) {
		this.ftime5money = ftime5money;
	}
	
	public String getFtime6money() {
		return ftime6money;
	}

	public void setFtime6money(String ftime6money) {
		this.ftime6money = ftime6money;
	}
	
	public String getFstonejgcostprefee() {
		return fstonejgcostprefee;
	}

	public void setFstonejgcostprefee(String fstonejgcostprefee) {
		this.fstonejgcostprefee = fstonejgcostprefee;
	}
	
	public String getFstonetscostprefee() {
		return fstonetscostprefee;
	}

	public void setFstonetscostprefee(String fstonetscostprefee) {
		this.fstonetscostprefee = fstonetscostprefee;
	}
	
	public String getFsteelcostprefee() {
		return fsteelcostprefee;
	}

	public void setFsteelcostprefee(String fsteelcostprefee) {
		this.fsteelcostprefee = fsteelcostprefee;
	}
	
	public String getFematerialcostprefee() {
		return fematerialcostprefee;
	}

	public void setFematerialcostprefee(String fematerialcostprefee) {
		this.fematerialcostprefee = fematerialcostprefee;
	}
	
	public String getFlabourcostprefee() {
		return flabourcostprefee;
	}

	public void setFlabourcostprefee(String flabourcostprefee) {
		this.flabourcostprefee = flabourcostprefee;
	}
	
	public String getFmachinecostprefee() {
		return fmachinecostprefee;
	}

	public void setFmachinecostprefee(String fmachinecostprefee) {
		this.fmachinecostprefee = fmachinecostprefee;
	}
	
	public String getFaffiliatedcostprefee() {
		return faffiliatedcostprefee;
	}

	public void setFaffiliatedcostprefee(String faffiliatedcostprefee) {
		this.faffiliatedcostprefee = faffiliatedcostprefee;
	}
	
	public String getFelseprojectcostprefee() {
		return felseprojectcostprefee;
	}

	public void setFelseprojectcostprefee(String felseprojectcostprefee) {
		this.felseprojectcostprefee = felseprojectcostprefee;
	}
	
	public String getFsynmanagecostprefee() {
		return fsynmanagecostprefee;
	}

	public void setFsynmanagecostprefee(String fsynmanagecostprefee) {
		this.fsynmanagecostprefee = fsynmanagecostprefee;
	}
	
	public String getFdangercostprefee() {
		return fdangercostprefee;
	}

	public void setFdangercostprefee(String fdangercostprefee) {
		this.fdangercostprefee = fdangercostprefee;
	}
	
	public String getFtaxcostprefee() {
		return ftaxcostprefee;
	}

	public void setFtaxcostprefee(String ftaxcostprefee) {
		this.ftaxcostprefee = ftaxcostprefee;
	}
	
	public String getFcostsumprefee() {
		return fcostsumprefee;
	}

	public void setFcostsumprefee(String fcostsumprefee) {
		this.fcostsumprefee = fcostsumprefee;
	}
	
	public String getFprofitcostprefee() {
		return fprofitcostprefee;
	}

	public void setFprofitcostprefee(String fprofitcostprefee) {
		this.fprofitcostprefee = fprofitcostprefee;
	}
	
	public String getFprofitcostpreradio() {
		return fprofitcostpreradio;
	}

	public void setFprofitcostpreradio(String fprofitcostpreradio) {
		this.fprofitcostpreradio = fprofitcostpreradio;
	}
	
	public String getFprepaystonefee() {
		return fprepaystonefee;
	}

	public void setFprepaystonefee(String fprepaystonefee) {
		this.fprepaystonefee = fprepaystonefee;
	}
	
	public String getFprepaystonetsfee() {
		return fprepaystonetsfee;
	}

	public void setFprepaystonetsfee(String fprepaystonetsfee) {
		this.fprepaystonetsfee = fprepaystonetsfee;
	}
	
	public String getFprepaysteelfee() {
		return fprepaysteelfee;
	}

	public void setFprepaysteelfee(String fprepaysteelfee) {
		this.fprepaysteelfee = fprepaysteelfee;
	}
	
	public String getFprepayematerialfee() {
		return fprepayematerialfee;
	}

	public void setFprepayematerialfee(String fprepayematerialfee) {
		this.fprepayematerialfee = fprepayematerialfee;
	}
	
	public String getFprepaylabourfee() {
		return fprepaylabourfee;
	}

	public void setFprepaylabourfee(String fprepaylabourfee) {
		this.fprepaylabourfee = fprepaylabourfee;
	}
	
	public String getFprepaytaxfee() {
		return fprepaytaxfee;
	}

	public void setFprepaytaxfee(String fprepaytaxfee) {
		this.fprepaytaxfee = fprepaytaxfee;
	}
	
	public String getFprepaysumfee() {
		return fprepaysumfee;
	}

	public void setFprepaysumfee(String fprepaysumfee) {
		this.fprepaysumfee = fprepaysumfee;
	}
	
	public String getFstonercostlyearfee() {
		return fstonercostlyearfee;
	}

	public void setFstonercostlyearfee(String fstonercostlyearfee) {
		this.fstonercostlyearfee = fstonercostlyearfee;
	}
	
	public String getFstonetsrcostlyearfee() {
		return fstonetsrcostlyearfee;
	}

	public void setFstonetsrcostlyearfee(String fstonetsrcostlyearfee) {
		this.fstonetsrcostlyearfee = fstonetsrcostlyearfee;
	}
	
	public String getFsteelrcostlyearfee() {
		return fsteelrcostlyearfee;
	}

	public void setFsteelrcostlyearfee(String fsteelrcostlyearfee) {
		this.fsteelrcostlyearfee = fsteelrcostlyearfee;
	}
	
	public String getFematerialrcostlyearfee() {
		return fematerialrcostlyearfee;
	}

	public void setFematerialrcostlyearfee(String fematerialrcostlyearfee) {
		this.fematerialrcostlyearfee = fematerialrcostlyearfee;
	}
	
	public String getFlabourrcostlyearfee() {
		return flabourrcostlyearfee;
	}

	public void setFlabourrcostlyearfee(String flabourrcostlyearfee) {
		this.flabourrcostlyearfee = flabourrcostlyearfee;
	}
	
	public String getFaffiliatedrcostlyearfee() {
		return faffiliatedrcostlyearfee;
	}

	public void setFaffiliatedrcostlyearfee(String faffiliatedrcostlyearfee) {
		this.faffiliatedrcostlyearfee = faffiliatedrcostlyearfee;
	}
	
	public String getFtaxrcostlyearfee() {
		return ftaxrcostlyearfee;
	}

	public void setFtaxrcostlyearfee(String ftaxrcostlyearfee) {
		this.ftaxrcostlyearfee = ftaxrcostlyearfee;
	}
	
	public String getFsumrcostlyearfee() {
		return fsumrcostlyearfee;
	}

	public void setFsumrcostlyearfee(String fsumrcostlyearfee) {
		this.fsumrcostlyearfee = fsumrcostlyearfee;
	}
	
	public String getFstonercosttyearfee() {
		return fstonercosttyearfee;
	}

	public void setFstonercosttyearfee(String fstonercosttyearfee) {
		this.fstonercosttyearfee = fstonercosttyearfee;
	}
	
	public String getFstonetsrcosttyearfee() {
		return fstonetsrcosttyearfee;
	}

	public void setFstonetsrcosttyearfee(String fstonetsrcosttyearfee) {
		this.fstonetsrcosttyearfee = fstonetsrcosttyearfee;
	}
	
	public String getFsteelrcosttyearfee() {
		return fsteelrcosttyearfee;
	}

	public void setFsteelrcosttyearfee(String fsteelrcosttyearfee) {
		this.fsteelrcosttyearfee = fsteelrcosttyearfee;
	}
	
	public String getFematerialrcosttyearfee() {
		return fematerialrcosttyearfee;
	}

	public void setFematerialrcosttyearfee(String fematerialrcosttyearfee) {
		this.fematerialrcosttyearfee = fematerialrcosttyearfee;
	}
	
	public String getFlabourrcosttyearfee() {
		return flabourrcosttyearfee;
	}

	public void setFlabourrcosttyearfee(String flabourrcosttyearfee) {
		this.flabourrcosttyearfee = flabourrcosttyearfee;
	}
	
	public String getFaffiliatedrcosttyearfee() {
		return faffiliatedrcosttyearfee;
	}

	public void setFaffiliatedrcosttyearfee(String faffiliatedrcosttyearfee) {
		this.faffiliatedrcosttyearfee = faffiliatedrcosttyearfee;
	}
	
	public String getFtaxrcosttyearfee() {
		return ftaxrcosttyearfee;
	}

	public void setFtaxrcosttyearfee(String ftaxrcosttyearfee) {
		this.ftaxrcosttyearfee = ftaxrcosttyearfee;
	}
	
	public String getFsumrcosttyearfee() {
		return fsumrcosttyearfee;
	}

	public void setFsumrcosttyearfee(String fsumrcosttyearfee) {
		this.fsumrcosttyearfee = fsumrcosttyearfee;
	}
	
	public String getFstonerpaylyearfee() {
		return fstonerpaylyearfee;
	}

	public void setFstonerpaylyearfee(String fstonerpaylyearfee) {
		this.fstonerpaylyearfee = fstonerpaylyearfee;
	}
	
	public String getFstonetsrpaylyearfee() {
		return fstonetsrpaylyearfee;
	}

	public void setFstonetsrpaylyearfee(String fstonetsrpaylyearfee) {
		this.fstonetsrpaylyearfee = fstonetsrpaylyearfee;
	}
	
	public String getFsteelrpaylyearfee() {
		return fsteelrpaylyearfee;
	}

	public void setFsteelrpaylyearfee(String fsteelrpaylyearfee) {
		this.fsteelrpaylyearfee = fsteelrpaylyearfee;
	}
	
	public String getFematerialrpaylyearfee() {
		return fematerialrpaylyearfee;
	}

	public void setFematerialrpaylyearfee(String fematerialrpaylyearfee) {
		this.fematerialrpaylyearfee = fematerialrpaylyearfee;
	}
	
	public String getFlabourrpaylyearfee() {
		return flabourrpaylyearfee;
	}

	public void setFlabourrpaylyearfee(String flabourrpaylyearfee) {
		this.flabourrpaylyearfee = flabourrpaylyearfee;
	}
	
	public String getFtaxrpaylyearfee() {
		return ftaxrpaylyearfee;
	}

	public void setFtaxrpaylyearfee(String ftaxrpaylyearfee) {
		this.ftaxrpaylyearfee = ftaxrpaylyearfee;
	}
	
	public String getFsumrpaylyearfee() {
		return fsumrpaylyearfee;
	}

	public void setFsumrpaylyearfee(String fsumrpaylyearfee) {
		this.fsumrpaylyearfee = fsumrpaylyearfee;
	}
	
	public String getFstonerpaytyearfee() {
		return fstonerpaytyearfee;
	}

	public void setFstonerpaytyearfee(String fstonerpaytyearfee) {
		this.fstonerpaytyearfee = fstonerpaytyearfee;
	}
	
	public String getFstonetsrpaytyearfee() {
		return fstonetsrpaytyearfee;
	}

	public void setFstonetsrpaytyearfee(String fstonetsrpaytyearfee) {
		this.fstonetsrpaytyearfee = fstonetsrpaytyearfee;
	}
	
	public String getFsteelrpaytyearfee() {
		return fsteelrpaytyearfee;
	}

	public void setFsteelrpaytyearfee(String fsteelrpaytyearfee) {
		this.fsteelrpaytyearfee = fsteelrpaytyearfee;
	}
	
	public String getFematerialrpaytyearfee() {
		return fematerialrpaytyearfee;
	}

	public void setFematerialrpaytyearfee(String fematerialrpaytyearfee) {
		this.fematerialrpaytyearfee = fematerialrpaytyearfee;
	}
	
	public String getFlabourrpaytyearfee() {
		return flabourrpaytyearfee;
	}

	public void setFlabourrpaytyearfee(String flabourrpaytyearfee) {
		this.flabourrpaytyearfee = flabourrpaytyearfee;
	}
	
	public String getFtaxrpaytyearfee() {
		return ftaxrpaytyearfee;
	}

	public void setFtaxrpaytyearfee(String ftaxrpaytyearfee) {
		this.ftaxrpaytyearfee = ftaxrpaytyearfee;
	}
	
	public String getFsumrpaytyearfee() {
		return fsumrpaytyearfee;
	}

	public void setFsumrpaytyearfee(String fsumrpaytyearfee) {
		this.fsumrpaytyearfee = fsumrpaytyearfee;
	}
	
	public String getFstonesubpayfee() {
		return fstonesubpayfee;
	}

	public void setFstonesubpayfee(String fstonesubpayfee) {
		this.fstonesubpayfee = fstonesubpayfee;
	}
	
	public String getFstoentssubpayfee() {
		return fstoentssubpayfee;
	}

	public void setFstoentssubpayfee(String fstoentssubpayfee) {
		this.fstoentssubpayfee = fstoentssubpayfee;
	}
	
	public String getFsteelsubpayfee() {
		return fsteelsubpayfee;
	}

	public void setFsteelsubpayfee(String fsteelsubpayfee) {
		this.fsteelsubpayfee = fsteelsubpayfee;
	}
	
	public String getFematerialsubpayfee() {
		return fematerialsubpayfee;
	}

	public void setFematerialsubpayfee(String fematerialsubpayfee) {
		this.fematerialsubpayfee = fematerialsubpayfee;
	}
	
	public String getFlaboursubpayfee() {
		return flaboursubpayfee;
	}

	public void setFlaboursubpayfee(String flaboursubpayfee) {
		this.flaboursubpayfee = flaboursubpayfee;
	}
	
	public String getFtaxsubpayfee() {
		return ftaxsubpayfee;
	}

	public void setFtaxsubpayfee(String ftaxsubpayfee) {
		this.ftaxsubpayfee = ftaxsubpayfee;
	}
	
	public String getFsumsubpayfee() {
		return fsumsubpayfee;
	}

	public void setFsumsubpayfee(String fsumsubpayfee) {
		this.fsumsubpayfee = fsumsubpayfee;
	}
	
	public String getFstoneplanpayfee() {
		return fstoneplanpayfee;
	}

	public void setFstoneplanpayfee(String fstoneplanpayfee) {
		this.fstoneplanpayfee = fstoneplanpayfee;
	}
	
	public String getFstonetsplanpayfee() {
		return fstonetsplanpayfee;
	}

	public void setFstonetsplanpayfee(String fstonetsplanpayfee) {
		this.fstonetsplanpayfee = fstonetsplanpayfee;
	}
	
	public String getFsteelplanpayfee() {
		return fsteelplanpayfee;
	}

	public void setFsteelplanpayfee(String fsteelplanpayfee) {
		this.fsteelplanpayfee = fsteelplanpayfee;
	}
	
	public String getFematerialplanpayfee() {
		return fematerialplanpayfee;
	}

	public void setFematerialplanpayfee(String fematerialplanpayfee) {
		this.fematerialplanpayfee = fematerialplanpayfee;
	}
	
	public String getFlabourplanpayfee() {
		return flabourplanpayfee;
	}

	public void setFlabourplanpayfee(String flabourplanpayfee) {
		this.flabourplanpayfee = flabourplanpayfee;
	}
	
	public String getFtaxplanpayfee() {
		return ftaxplanpayfee;
	}

	public void setFtaxplanpayfee(String ftaxplanpayfee) {
		this.ftaxplanpayfee = ftaxplanpayfee;
	}
	
	public String getFsumplanpayfee() {
		return fsumplanpayfee;
	}

	public void setFsumplanpayfee(String fsumplanpayfee) {
		this.fsumplanpayfee = fsumplanpayfee;
	}
	
}