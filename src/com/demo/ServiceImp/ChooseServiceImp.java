package com.demo.ServiceImp;

import com.demo.DaoImp.ChooseDaoImp;
import com.demo.Service.ChooseService;

/**
 * Created by eCRF on 2017/9/6.
 */
public class ChooseServiceImp implements ChooseService {

    ChooseDaoImp chooseDaoImp;

    public ChooseDaoImp getChooseDaoImp() {
        return chooseDaoImp;
    }

    public void setChooseDaoImp(ChooseDaoImp chooseDaoImp) {
        this.chooseDaoImp = chooseDaoImp;
    }
    @Override
    public int GetProvinceID(String name) {
        return chooseDaoImp.GetProvinceDetailByID(name);
    }
}
