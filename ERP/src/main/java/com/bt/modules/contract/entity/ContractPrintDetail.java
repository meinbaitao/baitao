package com.bt.modules.contract.entity;

import com.thinkgem.jeesite.common.persistence.DataEntity;

public class ContractPrintDetail extends
		DataEntity<ContractPrintDetail> {
	private static final long serialVersionUID = 1L;
	
	
	private String contractNo;

	private String contractType;

	
	public ContractPrintDetail() {
	}

	public ContractPrintDetail(String contractNo, String contractType) {
		this.contractNo = contractNo;
		this.contractType = contractType;
	}
	
	public String getContractNo() {
		return contractNo;
	}

	public void setContractNo(String contractNo) {
		this.contractNo = contractNo;
	}

	public String getContractType() {
		return contractType;
	}

	public void setContractType(String contractType) {
		this.contractType = contractType;
	}

}
