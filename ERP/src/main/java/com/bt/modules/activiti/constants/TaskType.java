package com.bt.modules.activiti.constants;

/**
 * author fanjinyuan.
 */
public enum TaskType {

    Claim("1", "签收"), Audit("0", "审核");

    private String value;
    private String label;

    private TaskType(String value, String label){
        this.value = value;
        this.label = label;
    }

    public String getValue() {
        return value;
    }

    public String getLabel() {
        return label;
    }
}
