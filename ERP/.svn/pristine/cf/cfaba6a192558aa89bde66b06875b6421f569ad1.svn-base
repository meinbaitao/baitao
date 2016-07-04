package com.bt.modules.project.entity;

import com.thinkgem.jeesite.common.persistence.BaseEntity;
import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * author fanjinyuan.
 */
public class DesignDirectorBuildnoMapping extends DataEntity<DesignDirectorBuildnoMapping> {

    private static final long serialVersionUID = 1L;

    private String projId;

    private String designDirector;

    private String buildNo;

    public String getProjId() {
        return projId;
    }

    public void setProjId(String projId) {
        this.projId = projId;
    }

    public String getDesignDirector() {
        return designDirector;
    }

    public void setDesignDirector(String designDirector) {
        this.designDirector = designDirector;
    }

    public String getBuildNo() {
        return buildNo;
    }

    public void setBuildNo(String buildNo) {
        this.buildNo = buildNo;
    }

    @Override
    public void preInsert() {

    }

    @Override
    public void preUpdate() {

    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        if (!super.equals(o)) return false;

        DesignDirectorBuildnoMapping that = (DesignDirectorBuildnoMapping) o;

        if (!projId.equals(that.projId)) return false;
        if (!designDirector.equals(that.designDirector)) return false;
        return buildNo.equals(that.buildNo);

    }

    @Override
    public int hashCode() {
        int result = projId.hashCode();
        result = 31 * result + designDirector.hashCode();
        result = 31 * result + buildNo.hashCode();
        return result;
    }

}
