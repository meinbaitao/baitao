package com.bt.modules.activiti.constants;

/**
 * 流程定义的key与流程图对应
 * 
 * @author 许俊雄
 * @since 20160516
 *
 */
public enum ProcessDefinitionKeyEnum {

	PD_LARBOR_CONTACT_CAL("larbor_contact_cal_flow"), // 劳务结算
	PD_LARBOR_CONTACT_STANDARD("standard_contract_audit_flow"), // 标准劳务合同
	PD_LARBOR_CONTACT_OFFSTATNDAR("larbor_contract_offstandard_flow")// 非标准劳务合同
	;

	private String name;

	private ProcessDefinitionKeyEnum(String name) {
		this.name = name;
	}

	public String getName() {
		return this.name;
	}

	// 用法
	public static void main(String[] args) {
		System.out.println(ProcessDefinitionKeyEnum.PD_LARBOR_CONTACT_CAL
				.getName());
		System.out.println(ProcessDefinitionKeyEnum.PD_LARBOR_CONTACT_CAL
				.toString());
	}
}
