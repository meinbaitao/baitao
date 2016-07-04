package com.bt.modules.accident.entity;

import java.io.Serializable;

/**
 * 下料单和采购单字段的一个封装
 * author fanjinyuan.
 */
public class OrderBomAndPurchase implements Serializable {

    private String materielName;
    private String standardDesc;
    private String orderBomId;
    private String purchaseId;
    private String materielNo;

    public String getMaterielName() {
        return materielName;
    }

    public void setMaterielName(String materielName) {
        this.materielName = materielName;
    }

    public String getStandardDesc() {
        return standardDesc;
    }

    public void setStandardDesc(String standardDesc) {
        this.standardDesc = standardDesc;
    }

    public String getOrderBomId() {
        return orderBomId;
    }

    public void setOrderBomId(String orderBomId) {
        this.orderBomId = orderBomId;
    }

    public String getPurchaseId() {
        return purchaseId;
    }

    public void setPurchaseId(String purchaseId) {
        this.purchaseId = purchaseId;
    }

    public String getMaterielNo() {
        return materielNo;
    }

    public void setMaterielNo(String materielNo) {
        this.materielNo = materielNo;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        OrderBomAndPurchase that = (OrderBomAndPurchase) o;

        if (materielName != null ? !materielName.equals(that.materielName) : that.materielName != null) return false;
        if (standardDesc != null ? !standardDesc.equals(that.standardDesc) : that.standardDesc != null) return false;
        if (orderBomId != null ? !orderBomId.equals(that.orderBomId) : that.orderBomId != null) return false;
        if (purchaseId != null ? !purchaseId.equals(that.purchaseId) : that.purchaseId != null) return false;
        return !(materielNo != null ? !materielNo.equals(that.materielNo) : that.materielNo != null);

    }

    @Override
    public int hashCode() {
        int result = materielName != null ? materielName.hashCode() : 0;
        result = 31 * result + (standardDesc != null ? standardDesc.hashCode() : 0);
        result = 31 * result + (orderBomId != null ? orderBomId.hashCode() : 0);
        result = 31 * result + (purchaseId != null ? purchaseId.hashCode() : 0);
        result = 31 * result + (materielNo != null ? materielNo.hashCode() : 0);
        return result;
    }

}
