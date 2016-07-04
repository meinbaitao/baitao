package com.bt.modules.activiti.constants;

/**
 * author fanjinyuan.
 */
public enum AuditResult {

    REJECT("0", "驳回"), APPROVAL("1", "通过");

    private String value;
    private String label;

    private AuditResult(String value, String label){
        this.value = value;
        this.label =  label;
    }

    public String getValue() {
        return value;
    }

    public String getLabel() {
        return label;
    }

}
