package com.bt.modules.project.service;

import com.bt.modules.project.dao.DesignDirectorBuildnoMappingDao;
import com.bt.modules.project.entity.DesignDirectorBuildnoMapping;
import com.thinkgem.jeesite.common.service.CrudService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * author fanjinyuan.
 */
@Service
@Transactional(readOnly = true)
public class DesignDirectorBuildnoMappingService extends CrudService<DesignDirectorBuildnoMappingDao, DesignDirectorBuildnoMapping> {

    @Autowired
    private DesignDirectorBuildnoMappingDao designDirectorBuildnoMappingDao;

    public DesignDirectorBuildnoMapping get(String id){
        return super.get(id);
    }

    public void save(DesignDirectorBuildnoMapping obj){
        super.save(obj);
    }

    public void delete(DesignDirectorBuildnoMapping mapping){
        super.delete(mapping);
    }

    public DesignDirectorBuildnoMapping findByBuildingNOAndProject(DesignDirectorBuildnoMapping mapping){
        return designDirectorBuildnoMappingDao.findByBuildingNOAndProject(mapping);
    }

}
