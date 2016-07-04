package com.bt.modules.report.weekly.mianly.entity;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * author fanjinyuan.
 */
public abstract class BaseReportEntity<T>  extends DataEntity<T> {

    private static final long serialVersionUID = 1L;

    protected String houseType; 		  //户型
    protected String buildingDisplayName; //楼栋展示名,仅仅用于显示

    public BaseReportEntity(String id) {
        super(id);
    }

    public BaseReportEntity() {
    }

    public String getBuildingDisplayName() {
        return buildingDisplayName;
    }

    public void setBuildingDisplayName(String buildingDisplayName) {
        this.buildingDisplayName = buildingDisplayName;
    }

	public String getHouseType() {
		return houseType;
	}

	public void setHouseType(String houseType) {
		this.houseType = houseType;
	}
    
    
}
