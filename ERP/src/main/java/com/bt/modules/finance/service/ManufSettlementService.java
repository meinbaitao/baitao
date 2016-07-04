/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.finance.service;

import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.sys.utils.DictUtils;
import com.bt.common.exceptions.BusinessException;
import com.bt.modules.contract.entity.ManufContractDetail;
import com.bt.modules.finance.entity.ManufOrderBom;
import com.bt.modules.finance.entity.ManufSettlement;
import com.bt.modules.finance.entity.ManufSettlementDetail;
import com.bt.modules.finance.entity.ManufSettlementMapping;
import com.bt.modules.finance.dao.ManufSettlementDao;
import com.bt.modules.finance.dao.ManufSettlementMappingDao;
import com.bt.modules.logistics.entity.LogisticsDetail;
import com.bt.modules.material.entity.SettlementMaterial;
import com.bt.modules.orbom.entity.OrderBomDetail;
import com.bt.modules.supplier.service.SupplierService;
import com.bt.modules.utils.CommonConstant;
import com.bt.modules.utils.CommonUtils;
import com.bt.modules.utils.MathUtil;
import com.bt.modules.utils.SeriesNumberUtils;

/**
 * 生产结算单Service
 * 
 * @author yhh
 * @version 2015-10-15
 * 
 * @author zjs
 * @version 2016-05-05
 */
@Service
@Transactional(readOnly = true)
public class ManufSettlementService extends
		CrudService<ManufSettlementDao, ManufSettlement> {

	@Autowired
	private ManufSettlementMappingDao mappingDao;

	@Autowired
	private ManufSettlementDao manufSettlementDao;

	@Autowired
	private ManufSettlementDetailService detailService;

	@Autowired
	private SupplierService supplierService;

	// 是否
	private final String YES = "是";
	private final String NO = "否";

	// 饰面处理
	private final String FaceProcess_GM = "光面";
	private final String FaceProcess_LZM = "荔枝面";

	// 石材类型字典表type
	private final String StoneType = "stone_variety";

	// 石材类型
	private final String StoneType_THH = "桃花红";

	// 确定造型板种类
	private final String lxPrefix1 = "LX01"; // 3cm菱形板
	private final String lxPrefix2 = "LX02"; // 3cm菱形板
	private final String atPrefix1 = "AT01"; // 5cm凹凸板
	private final String atPrefix2 = "AT02"; // 4.5cm凹凸板

	// 平板结算项
	public String[] pingb() {
		List<String> pingbjgx = this.getTypeSettlementItem("PB");
		int pingbjgxsize = pingbjgx.size();
		String pingb[] = pingbjgx.toArray(new String[pingbjgxsize]);
		return pingb;
	}

	// 平板结算项
	public String[] gzfpingb() {
		List<String> gzfpingbjgx = this.getTypeSettlementItem("GPB");
		int gzfpingbjgxsize = gzfpingbjgx.size();
		String gzfpingb[] = gzfpingbjgx.toArray(new String[gzfpingbjgxsize]);
		return gzfpingb;
	}

	// 线条结算项
	public String[] xt() {
		List<String> xtjgx = this.getTypeSettlementItem("CX");
		int xtjgxsize = xtjgx.size();
		String xt[] = xtjgx.toArray(new String[xtjgxsize]);
		return xt;
	}

	// 造型板结算项
	public String[] zaoxingb() {
		List<String> zxbjgx = this.getTypeSettlementItem("ZXP");
		int zxbjgxsize = zxbjgx.size();
		String zaoxingb[] = zxbjgx.toArray(new String[zxbjgxsize]);
		return zaoxingb;
	}

	// 葫芦瓶结算项
	public String[] hulup() {
		List<String> hulupjgx = this.getTypeSettlementItem("HLP");
		int hulupjgxsize = hulupjgx.size();
		String hulup[] = hulupjgx.toArray(new String[hulupjgxsize]);
		return hulup;
	}

	// 花瓶结算项
	public String[] huap() {
		List<String> huapjgx = this.getTypeSettlementItem("HP");
		int huapjgxsize = huapjgx.size();
		String huap[] = huapjgx.toArray(new String[huapjgxsize]);
		return huap;
	}

	// 圆柱结算项
	public String[] yuanz() {
		List<String> yuanzjgx = this.getTypeSettlementItem("YZ");
		int yuanzjgxsize = yuanzjgx.size();
		String yuanz[] = yuanzjgx.toArray(new String[yuanzjgxsize]);
		return yuanz;
	}

	// 雕花结算项
	public String[] diaoh() {
		List<String> diaohjgx = this.getTypeSettlementItem("DH");
		int diaohjgxsize = diaohjgx.size();
		String diaoh[] = diaohjgx.toArray(new String[diaohjgxsize]);
		return diaoh;
	}

	// 雕花件结算项
	public String[] diaohuaj() {
		List<String> diaohuajjgx = this.getTypeSettlementItem("DHB");
		int diaohuajjgxsize = diaohuajjgx.size();
		String diaohuaj[] = diaohuajjgx.toArray(new String[diaohuajjgxsize]);
		return diaohuaj;
	}

	/* ============================================================ */

	public ManufSettlement get(String id) {
		ManufSettlement settlement = super.get(id);

		ManufSettlementMapping param = new ManufSettlementMapping();
		String settlementId = settlement.getId();
		param.setSettlementId(settlementId);
		List<ManufSettlementMapping> mappingList = mappingDao.findList(param);

		for (ManufSettlementMapping mapping : mappingList) {
			ManufSettlementDetail detail = new ManufSettlementDetail();
			String mappingId = mapping.getId();
			detail.setMappingId(mappingId);
			List<ManufSettlementDetail> detailList = detailService
					.findList(detail);
			mapping.setDetailList(detailList);
		}

		settlement.setDetailList(mappingList);
		// if(Payment_NotYet.equals(settlement.getStatue())){
		// settlement = patchContractPrice(settlement);
		// }
		return settlement;
	}

	public List<ManufSettlement> findList(ManufSettlement manufSettlement) {
		return super.findList(manufSettlement);
	}

	public Page<ManufSettlement> findPage(Page<ManufSettlement> page,
			ManufSettlement manufSettlement) {
		return super.findPage(page, manufSettlement);
	}

	@Transactional(readOnly = false)
	public void save(ManufSettlement manufSettlement) {
		super.save(manufSettlement);
	}

	@Transactional(readOnly = false)
	public void delete(ManufSettlement manufSettlement) {
		super.delete(manufSettlement);
	}

	/**
	 * 结算单组装价格
	 * 
	 * @param settlement
	 * @return
	 */
	public ManufSettlement patchContractPrice(ManufSettlement settlement) {
		DecimalFormat df = (DecimalFormat) NumberFormat.getInstance();
		df.setMaximumFractionDigits(2);

		String factoryId = settlement.getFactoryId(); // 加工厂id
		List<ManufSettlementMapping> mappingList = settlement.getDetailList(); // 结算料单
		Map<String, Object> parameter = new HashMap<String, Object>();
		double sum, subtotal = 0, total = 0;
		for (ManufSettlementMapping mapping : mappingList) {
			Date orderDate = mapping.getOrderFinishDate(); // 下单时间
			List<ManufSettlementDetail> detailList = mapping.getDetailList(); // 结算加工项
			String stoneTypeId = mapping.getStoneColorName();
			String stoneType = null; // 石材类别
			if (StringUtils.isNotBlank(stoneTypeId)) {
				stoneType = DictUtils.getDictLabel(stoneTypeId, StoneType, "");
			}

			parameter.clear();
			parameter.put("factory", factoryId);
			parameter.put("orderDate", orderDate);
			List<ManufContractDetail> priceList = manufSettlementDao
					.findContractPriceList(parameter); // 价格列表

			for (ManufSettlementDetail detail : detailList) {
				detail = createManufDetail(stoneType, detail, priceList);
				sum = CommonUtils.stringToDouble(detail.getSum());
				subtotal += sum;
			}

			subtotal = MathUtil.scaleDouble(subtotal, 2);
			mapping.setFcostdetail(df.format(subtotal));
			total += subtotal;
		}

		total = MathUtil.scaleDouble(total, 2);
		settlement.setPrice(df.format(total));
		return settlement;
	}

	/**
	 * 由料单ids生成结算单
	 * 
	 * @param manufSettlementList
	 * @throws Exception
	 */
	@Transactional(readOnly = false)
	public void createSettlementsByOrderIds(List<String> orderBomIds)
			throws Exception {
		List<String> orderIdList = new ArrayList<String>();
		/*for (String id : orderBomIds) {
			if (condition) {
				orderIdList.add(id);
			}	
		}*/
		List<ManufOrderBom> manufOrderBomList = createManufOrderBomList(orderBomIds);
		List<ManufSettlement> manufSettlementList = createManufSettlement(manufOrderBomList);
		for (ManufSettlement settlement : manufSettlementList) {
			settlement = createSettlementMessage(settlement); // 填充结算信息
			saveManufSettlement(settlement);
		}
	}

	/**
	 * 保存结算单
	 * 
	 * @param settlementList
	 * @throws Exception
	 */
	@Transactional(readOnly = false)
	public void saveManufSettlement(ManufSettlement settlement)
			throws Exception {
		// 保存结算单
		String settlementId = IdGen.uuid();
		settlement.setId(settlementId);
		settlement.setIsNewRecord(true);
		save(settlement);
		//料单的结算项集合，一个料单一个mapping
		List<ManufSettlementMapping> mappingList = settlement.getDetailList();
		for (ManufSettlementMapping mapping : mappingList) {
			String mappingId = IdGen.uuid();
			mapping.setSettlementId(settlementId);
			mapping.setId(mappingId);
			mappingDao.insert(mapping);

			List<ManufSettlementDetail> detailList = mapping.getDetailList();
			if (detailList != null) {
				//每一条详细的结算项
				for (ManufSettlementDetail detail : detailList) {
					detail.setMappingId(mappingId);
					detail.setId(IdGen.uuid());
					detail.setIsNewRecord(true);
					detailService.save(detail);
				}
			} else {
				throw new Exception("新的下料单的加工费结算未开发！");
			}

		}
	}

	/**
	 * 更新结算单
	 * 
	 * @param settlement
	 * @throws ParseException
	 */
	@Transactional(readOnly = false)
	public void updateManufSettlement(ManufSettlement settlement) {
		save(settlement);

		List<ManufSettlementMapping> mappingList = settlement.getDetailList();
		for (ManufSettlementMapping mapping : mappingList) {

			// 处理436,72.89此种数据
			DecimalFormat f = new DecimalFormat("0,000.00");
			try {
				mapping.setFcostdetail(f.parseObject(mapping.getFcostdetail())
						.toString());
			} catch (ParseException e) {
				// 记录日志
			}

			mappingDao.update(mapping);

			List<ManufSettlementDetail> detailList = mapping.getDetailList();
			for (ManufSettlementDetail detail : detailList) {
				detail.setMappingId(mapping.getId());
				if (detail.getIsNewRecord()) {
					detail.setId(IdGen.uuid());
				}
				detailService.save(detail);
			}
		}

	}

	/**
	 * 获取已完全收货料单列表
	 * 
	 * @param orderBomIds
	 * @return
	 */
	public List<ManufOrderBom> createManufOrderBomList(List<String> orderBomIds) {
		List<ManufOrderBom> manufOrderBomList = new ArrayList<ManufOrderBom>();
		for (String orderBomId : orderBomIds) {
			List<ManufOrderBom> result = manufSettlementDao
					.findManufOrderBom(orderBomId);
			if (null != result) {
				manufOrderBomList.addAll(result);
			}
		}
		return manufOrderBomList;
	}

	/**
	 * 生成结算单,结算料单
	 * 
	 * @param list
	 */
	public List<ManufSettlement> createManufSettlement(
			List<ManufOrderBom> manufOrderBomList) {
		Map<String, List<ManufOrderBom>> map = new HashMap<String, List<ManufOrderBom>>();
		// 结算单,关联料单
		List<ManufSettlement> settlementList = new ArrayList<ManufSettlement>();
		ManufSettlement settlement = new ManufSettlement();
		for (ManufOrderBom obj : manufOrderBomList) {
			if (StringUtils.isNotBlank(obj.getFactoryId())
					&& StringUtils.isNotBlank(obj.getProjectId())) {
				// org.apache.commons.lang.StringUtils
				// key值的构成：加工厂id:项目id,以这两个来进行分组，统计
				String key = StringUtils.trimToEmpty(obj.getFactoryId()) + ":"
						+ StringUtils.trimToEmpty(obj.getProjectId());
				// String value = StringUtils.trimToEmpty(obj.getOrderBomId());
				List<ManufOrderBom> value = new ArrayList<ManufOrderBom>();
				value.add(obj);
				if (map.containsKey(key)) {
					value.addAll(map.get(key));
				}
				map.put(key, value);
			}
		}

		for (Map.Entry<String, List<ManufOrderBom>> entry : map.entrySet()) {
			String[] key = StringUtils.splitByWholeSeparator(entry.getKey(),
					":");
			// String[] value =
			// StringUtils.splitByWholeSeparator(entry.getValue(), ",");
			List<ManufOrderBom> value = entry.getValue();

			// 结算单号
			String factoryCode = supplierService.get(key[0]).getCode();
			String prefix = "SCJS-" + factoryCode + "-";
			String date = DateUtils.getDate("yyyyMMdd");
			int count = dao.getTodayCount(date);
			String seriesnumber = SeriesNumberUtils.createSeriesNumber(prefix,date,count);

			// String settlementId = IdGen.uuid();
			// settlement.setId(settlementId);
			settlement.setFactoryId(key[0]);
			settlement.setProjectId(key[1]);
			settlement.setSeriesnumber(seriesnumber);
			// settlement.setIsNewRecord(true);
			// save(settlement);

			List<ManufSettlementMapping> mappingList = new ArrayList<ManufSettlementMapping>();
			for (ManufOrderBom detail : value) {
				ManufSettlementMapping mapping = new ManufSettlementMapping();
				// mapping.setId(IdGen.uuid());
				// mapping.setSettlementId(settlementId);
				mapping.setOrderBomId(detail.getOrderBomId());
				mapping.setSettlementType(detail.getSettlementType());
				mapping.setOrderBomNo(detail.getOrderBomNo());
				mapping.setHouseType(detail.getHouseType());
				mapping.setBuilding(detail.getBuilding());
				mapping.setOrderType(detail.getOrderType());
				mapping.setOrderFinishDate(detail.getOrderFinishDate());
				mapping.setStoneColorName(detail.getStoneColorName());
				// mapping.setIsNewRecord(true);
				// mappingDao.insert(mapping);
				mappingList.add(mapping);
			}
			settlement.setDetailList(mappingList);
			settlementList.add(settlement);
		}

		return settlementList;
	}

	/**
	 * 查加工厂有效加工项的价格
	 * 
	 * @param parameter
	 *            (加工厂id,下单时间)
	 * @return
	 */
	public List<ManufContractDetail> findContractPriceList(
			Map<String, Object> parameter) {
		return manufSettlementDao.findContractPriceList(parameter);
	}

	/**
	 * 结算单填充结算信息
	 * 
	 * @param manufSettlement
	 * @return
	 * @throws Exception 
	 */
	public ManufSettlement createSettlementMessage(
			ManufSettlement manufSettlement) throws Exception {
		String factoryId = manufSettlement.getFactoryId(); // 加工厂id
		List<ManufSettlementMapping> mappingList = manufSettlement
				.getDetailList(); // 结算料单

		// 遍历下料单
		for (ManufSettlementMapping mapping : mappingList) {
			List<LogisticsDetail> orderDetailList = new ArrayList<LogisticsDetail>(); // 发货清单中结算物料
			Map<String, Double> countS = new HashMap<String, Double>(); // 结算项数量
			Map<String, Double> countSX = new HashMap<String, Double>(); // 结算项数量(非模板)

			String orderBomId = mapping.getOrderBomId(); // 结算料单id
			String settlementType = mapping.getSettlementType(); // 结算类型
			String orderBomType = mapping.getOrderType(); // 下料单类型

			// 结算下料单的物料
			Map<String, Object> parameter = new HashMap<String, Object>();
			parameter.put("orderBomId", orderBomId);
			parameter.put("factoryId", factoryId);
			parameter.put("settlementType", settlementType);
			parameter.put("delFlag", OrderBomDetail.DEL_FLAG_NORMAL);
			orderDetailList = manufSettlementDao
					.findSettlementDetailList(parameter);
			countS = countNumber(orderDetailList);

			int type = Integer.valueOf(orderBomType);
			String[] nameS;
			// 下料单类型 2-平板下料单 3-门窗套线下料单 4-腰线下料单 5-造型板下料单 6-圆柱下料单
			// 7-雕花下料单8-弧形板下料单9-屋檐板下料单10-窗侧板下料单11-平板工字缝
			switch (type) {
			case 2:
			case 9:
			case 10:
				orderDetailList = handleLogisticsDetailList(orderDetailList,
						type);
				countSX = countSettlementHead(orderDetailList);
				countS.putAll(countSX);
				nameS = addManufNameS(this.pingb(), countSX);
				mapping = createManufDetailList(mapping, nameS, countS);
				break;
			case 3:
				nameS = this.xt();
				mapping = createManufDetailList(mapping, nameS, countS);
				break;
			case 4:
				nameS = this.xt();
				mapping = createManufDetailList(mapping, nameS, countS);
				break;
			case 5:
			case 8:
				orderDetailList = handleLogisticsDetailList(orderDetailList,
						type);
				countSX = countSettlementHead(orderDetailList);
				countS.putAll(countSX);
				nameS = addManufNameS(this.zaoxingb(), countSX);
				mapping = createManufDetailList(mapping, nameS, countS);
				break;
			case 6:
				if (CommonConstant.SettlementType_hlp.equals(settlementType)) {
					nameS = this.hulup();
					mapping = createManufDetailList(mapping, nameS, countS);
				}
				if (CommonConstant.SettlementType_hp.equals(settlementType)) {
					nameS = this.huap();
					mapping = createManufDetailList(mapping, nameS, countS);
				}
				if (CommonConstant.SettlementType_yz.equals(settlementType)) {
					nameS = this.yuanz();
					mapping = createManufDetailList(mapping, nameS, countS);
				}
				break;
			case 7:
				if (CommonConstant.SettlementType_dh.equals(settlementType)) {
					nameS = this.diaoh();
					mapping = createManufDetailList(mapping, nameS, countS);
					// mapping =
					// createManufDetailListCarve(mapping,orderDetailList,nameS,
					// countS);
				}
				if (CommonConstant.SettlementType_dhj.equals(settlementType)) {
					nameS = this.diaohuaj();
					mapping = createManufDetailList(mapping, nameS, countS);
					// mapping =
					// createManufDetailListCarve(mapping,orderDetailList,nameS,
					// countS);
				}
				break;
			case 11:
				orderDetailList = handleLogisticsDetailList(orderDetailList,
						type);
				countSX = countSettlementHead(orderDetailList);
				countS.putAll(countSX);
				nameS = addManufNameS(this.gzfpingb(), countSX);
				mapping = createManufDetailList(mapping, nameS, countS);
				break;
			default:
				break;
			}

		}

		manufSettlement.setDetailList(mappingList);
		return manufSettlement;
	}

	/**
	 * 由物料列表确定所有加工数量
	 * 
	 * @param orderDetailList
	 * @return
	 * @throws Exception 
	 */
	public Map<String, Double> countNumber(List<LogisticsDetail> orderDetailList)
			throws Exception {
		Map<String, Double> number = new HashMap<String, Double>();
		// 线条
		double plfN = 0; // 胚料费
		double lzmhxbplfN = 0; // 荔枝面弧形板胚料费
		double thhplfN = 0; // 桃花红坯料费
		double thhhxatbplfN = 0;// 桃花红弧形凹凸板胚料
		double hxtjgfN = 0; // 弧线条加工费
		double zxtjgfN = 0; // 直线条加工费
		double thhzxtjgf01N = 0; // 桃花红直线条加工费01
		double thhzxtjgf02N = 0; // 桃花红直线条加工费02
		double thhhxtjgf04N = 0; // 桃花红弧线条加工费04
		double dscN = 0; // 滴水槽
		double qjN = 0; // 切角
		double xtbqlbN = 0; // 线条背切两边
		double xtfsN = 0; // 线条防水
		double ztN = 0; // 转头

		// 平板
		double abcddjN = 0; // ABCD倒角
		double kcN = 0; // 开槽
		double pbfsN = 0; // 平板防水
		double bq1cmmgN = 0; // 背切1cm磨光

		// 造型板
		double lmzb4cm = 0; // 4cm罗马柱板
		double lmzb5cm = 0; // 5cm罗马柱板
		double hzknjfN1 = 0; // 回字框粘接费
		double lbmqjN = 0; // 罗马板切角
		double thhhxbjgfN = 0; // 桃花红弧形板加工费
		double hzknjfN = 0; // 回字框粘结费
		double hzkpbfN = 0; // 回字框平板费
		double hzkdbkN = 0; // 回字框（雕边框）
		double hzktbkN = 0; // 回字框（凸边框）
		double hzklcfN = 0; // 回字框拉槽费
		double hzkabkN = 0; // 回字框（凹边框）
		double lzmhxbjgfN = 0; // 荔枝面弧形板加工费
		double msb6cmN = 0; // 6cm麦穗板
		double zxbfsN = 0; // 造型板防水

		// 葫芦瓶
		double hpzkN = 0;
		double hpfs1N = 0;
		double hpfs2N = 0;

		// 花盆
		double hp1N = 0;
		double hp2N = 0;

		// 圆柱
		double ztzm2N = 0;
		double ztzm1N = 0;
		double ztzm3N = 0;
		double zs2N = 0;
		double zs1N = 0;
		double zs3N = 0;
		double lmzbyzN = 0;
		double yzkxglzN = 0;
		double yzsxglzN = 0;
		double ylmztdhN = 0;
		double yzfsN = 0;

		// 雕花
		double dhplfN = 0; // 雕花胚料费
		double dhbqjN = 0; // 雕花板切角
		double dhbztN = 0; // 雕花板转头
		double dhbplfN = 0; // 雕花板胚料费

		// 工字缝平板
		double gzfabcddjN = 0; // ABCD倒角
		double gzfpbfsN = 0; // 平板防水
		double gzfpblc15mmN = 0; // 工字缝平板拉槽15mm
		double gzfpblc20mmN = 0; // 工字缝平板拉槽20mm

		// 遍历物料列表数据
		String stoneType = null;
		// orderDetailList 存在不同的 logisticsId
		for (LogisticsDetail detail : orderDetailList) {
			String settlementType = detail.getSettlementType(); // 结算料单类别
			String materialNo = detail.getMaterialNo(); // 物料编号
			String faceProcess = detail.getFaceProcess(); // 饰面
			String orderBomtype = detail.getOrderBomType();// 下料单类别
			String stoneTypeId = detail.getStoneTypeId();
			String processChartNo = this.getprocessChartNo(detail);// 加工图号
			if (StringUtils.isNotBlank(stoneTypeId)) {
				stoneType = DictUtils.getDictLabel(stoneTypeId, StoneType, "");
			}
			String heightTemp = detail.getHeight();// 规格-厚
			double height = CommonUtils.stringToDouble(heightTemp);
			String isArc = detail.getIsArcLine(); // 是否弧形线条
			String areaTemp = detail.getArea();
			double area = CommonUtils.stringToDouble(areaTemp); // 面积
			String volumeTemp = detail.getVolume();
			double volume = CommonUtils.stringToDouble(volumeTemp); // 体积
			String cutTemp = detail.getCutAngleCount();
			double cut = CommonUtils.stringToDouble(cutTemp); // 切角
			String amountTemp = detail.getAmount();
			double amount = CommonUtils.stringToDouble(amountTemp); // 数量
			String turnTemp = detail.getTurnAngleCount();
			double turn = CommonUtils.stringToDouble(turnTemp); // 转角
			String lengthTemp = detail.getLength();
			double length = CommonUtils.stringToDouble(lengthTemp); // 规格-长
			String widthTemp = detail.getWidth();
			double width = CommonUtils.stringToDouble(widthTemp); // 规格-宽
			String angleABTemp = detail.getAngleAB();
			double angleAB = CommonUtils.stringToDouble(angleABTemp); // ab角
			String angleCDTemp = detail.getAngleCD();
			double angleCD = CommonUtils.stringToDouble(angleCDTemp); // cd角
			String carveMeterTemp = detail.getCarveSlotMeter();
			double carveMeter = CommonUtils.stringToDouble(carveMeterTemp); // 开槽米数
			String reservedAngleTemp = detail.getReversedAngle();
			double reservedAngle = CommonUtils
					.stringToDouble(reservedAngleTemp); // 倒角边
			String rawAreaTemp = detail.getRawArea();
			double rawArea = CommonUtils.stringToDouble(rawAreaTemp); // 胚料面积
			String rawVolumeTemp = detail.getRawVolume();
			double rawVolume = CommonUtils.stringToDouble(rawVolumeTemp); // 胚料体积

			String shortMaterialNo = "";
			List<String> materialNos = this.getAllMaterialNoItem();
			for (String no : materialNos) {
				if (materialNo.indexOf(no) >= 0) {
					if (no.contains("YX") && !materialNo.contains("CX")
							&& !materialNo.contains("TX")) {
						shortMaterialNo = no;
						break;
					}else if (no.contains("CX")) {
						shortMaterialNo = no;
						break;
					}else if (no.contains("TX")) {
						shortMaterialNo = no;
						break;
					}   
					else if (no.startsWith("HLP")) {
						shortMaterialNo = materialNo;
						break;
					} else if (no.contains("LM")
							&& !materialNo.contains("LMZD")
							&& !materialNo.contains("YLM")) {
						shortMaterialNo = no;
						break;
					} else if (no.contains("LMZD")) {
						shortMaterialNo = no;
						break;
					} else if (no.contains("YLM")) {
						shortMaterialNo = no;
						break;
					} else if (no.contains("AT")) {
						shortMaterialNo = no;
						break;
					} else {
						if (materialNo.contains("TX")||materialNo.contains("CX")||materialNo.contains("LMZD")||materialNo.contains("YLM")) {
							shortMaterialNo = materialNo;
							break;
						}else {
							shortMaterialNo = no;
							break;
						}
					}
				} else {
					shortMaterialNo = materialNo;
				}
			}
			List<String> settlementItemList = this
					.getSettlementItem(shortMaterialNo);
			String others = "other";
			if (settlementItemList.isEmpty()) {
				settlementItemList.add(others);
			}
			int type = MathUtil.intUtils(orderBomtype);
			for (String item : settlementItemList) {
				switch (type) {
				case 2:
				case 9:
				case 10:
					/************************ 平板 ****************************/
					// ABCD倒角
					abcddjN = abcddjN + angleAB + angleCD;
					// 开槽
					kcN += carveMeter;
					// 平板防水
					pbfsN += area;
					// 背切1cm磨光
					if (StoneType_THH.equals(stoneType)) {		
							bq1cmmgN += angleAB+angleCD;
					}
					break;
				case 3:
				case 4:
					/************************ 门窗套线,腰线 ****************************/
					if (item.equals("3-CX-001")) {
						// 胚料费
						plfN += rawVolume;
					}

					// 线条加工费
					if (YES.equals(isArc)) {
						if (item.equals("3-CX-002")&&!StoneType_THH.equals(stoneType)) {
							hxtjgfN += area; // 弧线条加工费
						}
							if (item.equals("3-CX-011")&&StoneType_THH.equals(stoneType)) {
								thhhxtjgf04N += area;// 桃花红弧线条加工费04
							}
					}
					if (NO.equals(isArc)) {
						if (StoneType_THH.equals(stoneType)) {
							// 桃花红直线条加工费01
								if (item.equals("3-CX-009")) {
									thhzxtjgf01N += area;
								}
							// 桃花红直线条加工费02
								if (item.equals("3-CX-010")) {
									thhzxtjgf02N += area;
								}
						}else {
							if (item.equals("3-CX-003")) {
								// 直线条加工费
								zxtjgfN += area;
							}
							if (item.equals("3-CX-012")) {
								// 直线条加工费
								zxtjgfN += 2 * area;
							}
						}
					}

					// 滴水槽
					if (item.equals("3-CX-004")) {
						dscN = dscN + (length * amount / 1000d);
					}
					// 切角
					if (item.equals("3-CX-005")) {
						qjN += cut;
					}
					// 线条背切两边
					if (item.equals("3-CX-006")) {
						xtbqlbN = xtbqlbN + (length * amount / 1000d);
					}
					// 线条防水
					if (item.equals("3-CX-007")&&!StoneType_THH.equals(stoneType)) {
						xtfsN = hxtjgfN + zxtjgfN;
					}
					// 转头
					if (item.equals("3-CX-008")) {
						ztN += turn;
					}
					break;
				case 5:
				case 8:
					/************************ 造型板 ****************************/
					// 4CM罗马柱板
					if (item.equals("5-ZXP-001")) {
						if (height < 50) {
							lmzb4cm += area;
						}
					}
					// 5CM罗马柱板
					if (item.equals("5-ZXP-002")) {
						if (height > 50 || height == 50) {
							lmzb5cm += area;
						}
					}
					// 罗马板切角
					if (item.equals("5-ZXP-003")) {
						lbmqjN += reservedAngle;
					}
					// 桃花红弧形凹凸板胚料
					if (item.equals("5-ZXP-004")) {
						if (StoneType_THH.equals(stoneType)) {
							thhhxatbplfN += volume;
						}
					}
					// 桃花红弧形板加工费
					if (item.equals("5-ZXP-005")) {
						if (YES.equals(isArc)
								&& StoneType_THH.equals(stoneType)) {
							thhhxbjgfN += area;
						}
					}
					// 桃花红坯料费
					if (item.equals("5-ZXP-006")) {
						if (StoneType_THH.equals(stoneType)) {
							thhplfN += rawVolume;
						}
					}
					// 回字框粘结费
					if (item.equals("5-ZXP-007")) {
						hzknjfN = hzknjfN + (length + width) * 2d * amount;
					}
					// 回字框平板费
					if (item.equals("5-ZXP-008")) {
						hzkpbfN += area;
					}
					// 回字框（雕边框）
					if (item.equals("5-ZXP-009")) {
						hzkdbkN += area;
					}
					// 回字框（凸边框）
					if (item.equals("5-ZXP-010")) {
						hzktbkN += area;
					}
					// 回字框拉槽费
					// if (item.equals("5-ZXP-011")) {
					// hzklcfN += area;
					// }
					// 回字框（凹边框）
					if (item.equals("5-ZXP-012")) {
						hzkabkN += area;
					}
					// 光面弧形板加工费
					if (item.equals("5-ZXP-013")&&FaceProcess_GM.equals(faceProcess)) {
						lzmhxbjgfN += area;
					}
					// 光面弧形板胚料费
					if (item.equals("5-ZXP-014")&&FaceProcess_GM.equals(faceProcess)) {
						lzmhxbplfN += rawVolume;
					}
					// 6cm麦穗板
					if (item.equals("5-ZXP-015")&&height==60) {
						msb6cmN += area;
					}
					// 造型板防水
					if (item.equals("5-ZXP-016")) {
						zxbfsN += area;
					}
					// 回字框粘接费
					if (item.equals("5-ZXP-017")) {
						hzknjfN1 += reservedAngle;
					}
					break;
				case 6:
					/************************ 葫芦瓶 ****************************/
					String key6 = "";
					double value6 = 0;
					for (int i = 1; i <= 16; i++) {
						if (i < 10) {
							key6 = "6-HLP-00" + i;
						} else {
							key6 = "6-HLP-0" + i;
						}
						if (item.equals(key6)) {
							if (number.containsKey(key6)) {
								value6 = number.get(key6);
								number.put(key6, (value6 += amount));
							} else {
								number.put(key6, (amount));
							}
							break;
						}
					}

					// 花瓶钻孔
					if (item.equals("6-HLP-017")) {
						hpzkN += amount;
					}
					// 花瓶防水（长度〉＝660）
					// 花瓶防水（长度<660）
					if (length > 660 || length == 660) {
						if (item.equals("6-HLP-018")) {
							hpfs1N += amount;
						}
					} else {
						if (item.equals("6-HLP-019")) {
							hpfs2N += amount;
						}
					}

					/************************ 花盆 ****************************/
					if (item.equals("6-HP-001")) {
						hp1N += amount;
					}
					if (item.equals("6-HP-002")) {
						hp2N += amount;
					}

					// 圆柱
					// 柱头柱脚≦1/4
					if (item.equals("6-YZ-001")) {
						ztzm1N += area;
					}
					// 1/4<柱头柱脚≦ 1/2
					if (item.equals("6-YZ-002")) {
						ztzm2N += area;
					}
					// 柱头柱脚〉1/2
					if (item.equals("6-YZ-003")) {
						ztzm3N += area;
					}
					// 圆柱≦1/4
					if (item.equals("6-YZ-004")) {
						zs1N += area;
					}
					// 1/4<圆柱≦ 1/2
					if (item.equals("6-YZ-005")) {
						zs2N += area;
					}
					// 1/2<圆柱
					if (item.equals("6-YZ-006")) {
						zs3N += area;
					}
					// 罗马柱半圆柱
					if (item.equals("6-YZ-007")) {
						lmzbyzN += area;
					}
					// 圆柱空心橄榄柱
					if (item.equals("6-YZ-008")) {
						yzkxglzN += area;
					}
					// 圆柱实心橄榄柱
					if (item.equals("6-YZ-009")) {
						yzsxglzN += area;
					}
					// 圆罗马柱头雕花
					if (item.equals("6-YZ-010")) {
						ylmztdhN += amount/2;
					}
					// 圆柱防水
					if (item.equals("6-YZ-011")) {
						yzfsN += area;
					}
					break;
				case 7:
					String key7 = "";
					double value7 = 0;
					if (settlementType.equals(CommonConstant.SettlementType_dh)) {
						for (int i = 1; i <= 67; i++) {
							if (i < 10) {
								key7 = "7-DH-00" + i;
							} else {
								key7 = "7-DH-0" + i;
							}
							if (item.equals(key7)) {
								if (number.containsKey(key7)) {
									value7 = number.get(key7);
									if (i == 18 || i == 36 || i == 43
											|| i == 46 || i == 48 || i == 50) {
										number.put(key7, (value7 += area));
									} else {
										number.put(key7, (value7 += amount));
									}
								} else {
									if (i == 18 || i == 36 || i == 43
											|| i == 46 || i == 48 || i == 50) {
										number.put(key7, (area));
									} else {
										number.put(key7, (amount));
									}
								}
								break;
							}
						}
					}
					if (settlementType
							.equals(CommonConstant.SettlementType_dhj)) {
						for (int i = 1; i <= 25; i++) {
							if (i < 10) {
								key7 = "7-DHB-00" + i;
							} else {
								key7 = "7-DHB-0" + i;
							}

							if (item.equals(key7)) {
								if (number.containsKey(key7)) {
									value7 = number.get(key7);
									if (i == 1 || i == 2 || i == 12 || i == 13) {
										number.put(key7, (value7 += (length
												* amount / 1000d)));
									} else {
										number.put(key7, (value7 += area));
									}
								} else {
									if (i == 1 || i == 2 || i == 12 || i == 13) {
										number.put(key7,
												(length * amount / 1000d));
									} else {
										number.put(key7, (area));
									}
								}
								break;
							}
						}
					}

					// 雕花胚料费
					if (item.equals("7-DH-068")) {
						dhplfN += volume;
					}
					// 切角
					if (item.equals("7-DHB-026")) {
						dhbqjN += cut;
					}
					// 转头
					if (item.equals("7-DHB-027")) {
						dhbztN += turn;
					}
					// 雕花板胚料费
					if (item.equals("7-DHB-028")) {
						dhbplfN += volume;
					}
					break;
				default:
					break;
				case 11:
					// ABCD倒角
					gzfabcddjN = gzfabcddjN + angleAB + angleCD;
					// 平板防水
					gzfpbfsN += area;
					// 工字缝平板拉槽15mm
					gzfpblc15mmN += this.openSlotM1(length, width, amount,
							processChartNo);
					// 工字缝平板拉槽20mm
					gzfpblc20mmN += this.openSlotM2(length, width, amount,
							processChartNo);
					break;
				}
			}
		}
		// 返回各个加工项数量
		number.put("3-CX-001", MathUtil.scaleDouble(plfN, 2)); // 胚料费
		number.put("3-CX-002", MathUtil.scaleDouble(hxtjgfN, 2)); // 弧线条加工费
		number.put("3-CX-003", MathUtil.scaleDouble(zxtjgfN, 2)); // 直线条加工费
		number.put("3-CX-004", MathUtil.scaleDouble(dscN, 2)); // 滴水槽
		number.put("3-CX-005", MathUtil.scaleDouble(qjN, 2)); // 切角
		number.put("3-CX-006", MathUtil.scaleDouble(xtbqlbN, 2)); // 线条背切两边
		number.put("3-CX-007", MathUtil.scaleDouble(xtfsN, 2)); // 线条防水
		number.put("3-CX-008", MathUtil.scaleDouble(ztN, 2)); // 转头
		number.put("3-CX-009", MathUtil.scaleDouble(thhzxtjgf01N, 2)); // 桃花红直线条加工费01
		number.put("3-CX-010", MathUtil.scaleDouble(thhzxtjgf02N, 2)); // 桃花红直线条加工费02
		number.put("3-CX-011", MathUtil.scaleDouble(thhhxtjgf04N, 2)); // 桃花红直线条加工费04

		// 平板
		number.put("2-PB-001", MathUtil.scaleDouble(abcddjN, 2)); // ABCD倒角
		number.put("2-PB-002", MathUtil.scaleDouble(kcN, 2)); // 开槽
		number.put("2-PB-003", MathUtil.scaleDouble(pbfsN, 2)); // 平板防水
		number.put("2-PB-004", MathUtil.scaleDouble(bq1cmmgN, 2)); // 背切1cm磨光

		// 造型板
		number.put("5-ZXP-001", MathUtil.scaleDouble(lmzb4cm, 2)); // 4cm罗马柱板
		number.put("5-ZXP-002", MathUtil.scaleDouble(lmzb5cm, 2)); // 5cm罗马柱板
		number.put("5-ZXP-003", MathUtil.scaleDouble(lbmqjN, 2)); // 罗马板切角
		number.put("5-ZXP-004", MathUtil.scaleDouble(thhhxatbplfN, 2)); // 桃花红弧形凹凸板胚料
		number.put("5-ZXP-005", MathUtil.scaleDouble(thhhxbjgfN, 2)); // 桃花红弧形板加工费
		number.put("5-ZXP-006", MathUtil.scaleDouble(thhplfN, 2)); // 桃花红胚料费
		number.put("5-ZXP-007", MathUtil.scaleDouble(hzknjfN, 2)); // 回字框粘结费
		number.put("5-ZXP-008", MathUtil.scaleDouble(hzkpbfN, 2)); // 回字框平板费
		number.put("5-ZXP-009", MathUtil.scaleDouble(hzkdbkN, 2)); // 回字框（雕边框）
		number.put("5-ZXP-010", MathUtil.scaleDouble(hzktbkN, 2)); // 回字框（凸边框）
		// number.put("5-ZXP-011", MathUtil.scaleDouble(hzklcfN, 2)); // 回字框拉槽费
		number.put("5-ZXP-012", MathUtil.scaleDouble(hzkabkN, 2)); // 回字框（凹边框）
		number.put("5-ZXP-013", MathUtil.scaleDouble(lzmhxbjgfN, 2)); // 荔枝面弧形板加工费
		number.put("5-ZXP-014", MathUtil.scaleDouble(lzmhxbplfN, 2)); // 荔枝面弧形板胚料费
		number.put("5-ZXP-015", MathUtil.scaleDouble(msb6cmN, 2)); // 6cm麦穗板
		number.put("5-ZXP-016", MathUtil.scaleDouble(zxbfsN, 2)); // 造型板防水
		number.put("5-ZXP-017", MathUtil.scaleDouble(hzknjfN1, 2)); // 回字框粘接费

		// 葫芦瓶
		number.put("6-HLP-017", MathUtil.scaleDouble(hpzkN, 2));// 花瓶钻孔
		number.put("6-HLP-018", MathUtil.scaleDouble(hpfs1N, 2));// 花瓶防水（长度〉＝660）
		number.put("6-HLP-019", MathUtil.scaleDouble(hpfs2N, 2));// 花瓶防水（长度<660）

		// 花盆
		number.put("6-HP-001", MathUtil.scaleDouble(hp1N, 2));
		number.put("6-HP-002", MathUtil.scaleDouble(hp2N, 2));

		// 圆柱
		number.put("6-YZ-001", MathUtil.scaleDouble(ztzm1N, 2));
		number.put("6-YZ-002", MathUtil.scaleDouble(ztzm2N, 2));
		number.put("6-YZ-003", MathUtil.scaleDouble(ztzm3N, 2));
		number.put("6-YZ-004", MathUtil.scaleDouble(zs1N, 2));
		number.put("6-YZ-005", MathUtil.scaleDouble(zs2N, 2));
		number.put("6-YZ-006", MathUtil.scaleDouble(zs3N, 2));
		number.put("6-YZ-007", MathUtil.scaleDouble(lmzbyzN, 2));// 罗马柱半圆柱
		number.put("6-YZ-008", MathUtil.scaleDouble(yzkxglzN, 2));// 圆柱空心橄榄柱
		number.put("6-YZ-009", MathUtil.scaleDouble(yzsxglzN, 2));// 圆柱实心橄榄柱
		number.put("6-YZ-010", MathUtil.scaleDouble(ylmztdhN, 2));// 圆罗马柱头雕花
		number.put("6-YZ-011", MathUtil.scaleDouble(yzfsN, 2));// 圆柱防水

		// 雕花
		number.put("7-DH-068", MathUtil.scaleDouble(dhplfN, 2));// 雕花胚料费
		number.put("7-DHB-026", MathUtil.scaleDouble(dhbqjN, 2));// 切角
		number.put("7-DHB-027", MathUtil.scaleDouble(dhbztN, 2));// 转头
		number.put("7-DHB-028", MathUtil.scaleDouble(dhbplfN, 2));// 雕花板胚料费

		// 工字缝平板
		number.put("11-GPB-001", MathUtil.scaleDouble(gzfpblc15mmN, 2));// 工字缝平板拉槽15mm
		number.put("11-GPB-002", MathUtil.scaleDouble(gzfpblc20mmN, 2));// 工字缝平板拉槽20mm
		number.put("11-GPB-003", MathUtil.scaleDouble(gzfabcddjN, 2));// ABCD倒角
		number.put("11-GPB-004", MathUtil.scaleDouble(gzfpbfsN, 2));// 平板防水

		return number;
	}

	/**
	 * 加工项列表补充头数加工项
	 * 
	 * @param nameS
	 * @param countSX
	 * @return
	 */
	public String[] addManufNameS(String[] nameS, Map<String, Double> countSX) {
		// String[] result = new String[countSX.size() + nameS.length];

		List<String> resultList = new ArrayList<String>();
		for (Map.Entry<String, Double> entry : countSX.entrySet()) {
			String name = entry.getKey();
			resultList.add(name);
		}
		List<String> nameStoList = Arrays.asList(nameS);
		resultList.addAll(nameStoList);

		int size = resultList.size();
		String result[] = resultList.toArray(new String[size]);
		return result;
	}

	/**
	 * 生成平板头数加工项名称,数量
	 * 
	 * @param list
	 * @return
	 */
	public Map<String, Double> countSettlementHead(List<LogisticsDetail> list) {
		Map<String, Double> map = new HashMap<String, Double>();

		String key = null;
		Double value = null;
		String settlementHead = null;
		String area = null;
		for (LogisticsDetail detail : list) {
			settlementHead = detail.getSettlementHead();
			area = detail.getArea();
			if (StringUtils.isNotBlank(settlementHead)
					&& StringUtils.isNotBlank(area)) {
				key = settlementHead;
				value = Double.valueOf(area);
				if (map.containsKey(key)) {
					value = MathUtil.sum(value, map.get(key));
				}
				map.put(key, value);
			}
		}

		return map;
	}

	/**
	 * 下料单物料头数处理
	 * 
	 * @param list
	 * @return
	 */
	public List<LogisticsDetail> handleLogisticsDetailList(
			List<LogisticsDetail> list, int orderBomType) {

		for (LogisticsDetail detail : list) {
			String materialNo, length, width, heigh, heighToCM, settlementHead = null, faceProcess, stoneTypeId, stoneType = null;
			// 确定最长边
			double[] lengthArray = new double[2];
			double lengthStandard = 0, heighD = 0;
			int head = 60;

			materialNo = detail.getMaterialNo();
			stoneTypeId = detail.getStoneTypeId(); //石材类型
			 if(StringUtils.isNotBlank(stoneTypeId)){
			 stoneType = DictUtils.getDictLabel(stoneTypeId, StoneType, "");
			 }
			faceProcess = detail.getFaceProcess(); // 饰面
			// 规格
			length = detail.getLength();
			lengthArray[0] = CommonUtils.stringToDouble(length);
			width = detail.getWidth();
			lengthArray[1] = CommonUtils.stringToDouble(width);
			heigh = detail.getHeight();
			heighD = CommonUtils.stringToDouble(heigh) / 10;
			heighToCM = String.valueOf(heighD); // mm转cm
			if (StringUtils.endsWith(heighToCM, ".0")) {
				heighToCM = StringUtils.substringBefore(heighToCM, ".0"); // 截掉数字后的".0"
			}
			// lengthArray[2] = CommonUtils.stringToDouble(heigh);
			// 确定最长边
			lengthArray = CommonUtils.bubbleSort(lengthArray);
			// lengthStandard = lengthArray[lengthArray.length-1];
			// 确定最短边
			lengthStandard = lengthArray[0];
			if (lengthArray[0] > 629 && lengthArray[1] > 629) {
				head = head + (int) ((lengthStandard - 630) / 100 + 1) * 10;
			}
			// 平板结算
			if (orderBomType == 2 || orderBomType == 9 || orderBomType == 10) {
				if (StringUtils.isNotBlank(faceProcess)) {
					settlementHead = heighToCM + "cm" + faceProcess + "平板"
							+ String.valueOf(head) + "头";
				}
			}
			// 造型板结算
			if (orderBomType == 5 || orderBomType == 8) {
				if (materialNo.startsWith(lxPrefix1)
						|| materialNo.startsWith(lxPrefix2)) {
					settlementHead = heighToCM + "cm菱形板" + String.valueOf(head)
							+ "头";
				}
				if (materialNo.startsWith(atPrefix1)) {
					settlementHead = heighToCM + "cm凹凸板" + String.valueOf(head)
							+ "头";
				}
				if (materialNo.startsWith(atPrefix2)&&StoneType_THH.equals(stoneType)) {
					settlementHead = heighToCM + "cm桃花红凹凸板"
							+ String.valueOf(head) + "头";
				}
			}

			// 工字缝平板结算
			if (orderBomType == 11) {
				if (StringUtils.isNotBlank(faceProcess)) {
					settlementHead = "工字缝" + heighToCM + "cm" + faceProcess
							+ "平板" + String.valueOf(head) + "头";
				}
			}
			detail.setSettlementHead(settlementHead);
		}

		return list;
	}

	/**
	 * 给加工项匹配价格
	 * 
	 * @param manufName
	 * @param priceList
	 * @return
	 */
	public ManufContractDetail matchPrice(String stoneType, String manufName,
			List<ManufContractDetail> priceList) {
		for (ManufContractDetail detail : priceList) {
			// 石材品种,加工名称匹配
			if (manufName.equals(detail.getManufName())
					&& stoneType.equals(detail.getStoneType())) {
				return detail;
			}
		}
		return null;
	}

	/**
	 * 确定下料单加工项信息(名,数量,单位,总价)
	 * 
	 * @param manufName
	 * @param count
	 * @param priceList
	 * @return
	 */
	public ManufSettlementDetail createManufDetail(String stoneType,
			ManufSettlementDetail detail, List<ManufContractDetail> priceList) {
		String manufName = detail.getManufName(); // 加工项
		String count = detail.getNumber(); // 数量
		String price = null; // 加工项价格
		String unit = null; // 单位
		double result = 0; // 价格*数量

		ManufContractDetail manufPrice = matchPrice(stoneType, manufName,
				priceList);
		if (null != manufPrice) {
			unit = manufPrice.getUnit();
			price = manufPrice.getContractPrice();
			result = CommonUtils.stringToDouble(price)
					* CommonUtils.stringToDouble(count);
			result = MathUtil.scaleDouble(result, 2);
		} else {
			price = "0";
		}

		detail.setUnit(unit);
		detail.setPrice(price);
		detail.setSum(String.valueOf(result));

		return detail;
	}

	/**
	 * 组装料单加工结算信息
	 * 
	 * @param nameS
	 * @param countS
	 * @param priceList
	 * @return
	 */
	public ManufSettlementMapping createManufDetailList(
			ManufSettlementMapping mapping, String[] nameS,
			Map<String, Double> countS) {

		// String stoneTypeId = mapping.getStoneColorName(); //石材类别
		// String stoneType = null;
		// if(StringUtils.isNotBlank(stoneTypeId)){
		// stoneType = DictUtils.getDictLabel(stoneTypeId, StoneType, "");
		// }
		List<ManufSettlementDetail> detailList = new ArrayList<ManufSettlementDetail>();
		for (String nametest : nameS) {
			ManufSettlementDetail detail = new ManufSettlementDetail();
			double count = 0;
			try {
				if (countS.containsKey(nametest)) {
					count = countS.get(nametest);
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
			if (count != 0) {
				String name = this.getSettlementName(nametest);
				if (StringUtils.isBlank(name)) {
					name = nametest;
				}
				detail.setManufName(name);
				detail.setNumber(String.valueOf(count));
				detailList.add(detail);
			}
		}

		mapping.setDetailList(detailList);
		return mapping;
	}

	public Double openSlotM1(double standardLong, double standardWidth,
			double count, String processChartNo) {
		// TODO Auto-generated method stub
		double openSlotM = 0;
		if (processChartNo.equals("JG-01")) {
			openSlotM = (standardLong + standardWidth - 15) * count / 1000d;
		} else if (processChartNo.equals("JG-02")) {
			openSlotM = standardLong * count / 1000d;
		} else if (processChartNo.equals("JG-03")) {
			openSlotM = standardWidth * count / 1000d;
		} else if (processChartNo.equals("JG-04")) {
			openSlotM = 0;
		} else if (processChartNo.equals("JG-05")) {
			openSlotM = standardLong * count / 1000d;
		} else if (processChartNo.equals("JG-06")) {
			openSlotM = standardLong * count / 1000d;
		} else if (processChartNo.equals("JG-07")) {
			openSlotM = standardWidth * count / 1000d;
		} else {
			openSlotM = 0;
		}
		return openSlotM;
	}

	public Double openSlotM2(double standardLong, double standardWidth,
			double count, String processChartNo) {
		// TODO Auto-generated method stub
		double openSlotM = 0;
		if (processChartNo.equals("JG-01")) {
			openSlotM = (standardWidth - 15) * count / 1000d;
		} else if (processChartNo.equals("JG-02")) {
			openSlotM = (standardWidth - 15) * count / 1000d;
		} else if (processChartNo.equals("JG-03")) {
			openSlotM = standardWidth * count / 1000d;
		} else if (processChartNo.equals("JG-04")) {
			openSlotM = standardWidth * count / 1000d;
		} else if (processChartNo.equals("JG-05")) {
			openSlotM = (standardWidth - 15) * count / 1000d;
		} else if (processChartNo.equals("JG-06")) {
			openSlotM = 0;
		} else if (processChartNo.equals("JG-07")) {
			openSlotM = standardWidth * count / 1000d;
		} else {
			openSlotM = 0;
		}
		return openSlotM;
	}

	public List<String> getSettlementItem(String materialNo) {
		return manufSettlementDao.getSettlementItem(materialNo);
	}

	public List<String> getAllMaterialNoItem() {
		Map<String, String> map = new HashMap<String, String>();
		map.put("delFlag", SettlementMaterial.DEL_FLAG_NORMAL);
		return manufSettlementDao.getAllMaterialNoItem(map);
	}
	
	public List<String> getMaterialNoByType(String settlementType) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("settlementType", settlementType);
		map.put("delFlag", SettlementMaterial.DEL_FLAG_NORMAL);
		return manufSettlementDao.getMaterialNoByType(map);
	}
	
	public List<String> getTypeSettlementItem(String itemType) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("itemType", itemType);
		map.put("delFlag", ManufSettlement.DEL_FLAG_NORMAL);
		return manufSettlementDao.getTypeSettlementItem(map);
	}

	public String getSettlementName(String itemCode) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("itemCode", itemCode);
		map.put("delFlag", ManufSettlement.DEL_FLAG_NORMAL);
		return manufSettlementDao.getSettlementName(map);
	}

	public String getprocessChartNo(LogisticsDetail detail) throws BusinessException{
		try {
			return manufSettlementDao.getprocessChartNo(detail);
		} catch (Exception e) {
			throw new BusinessException("manufSettlement.getprocessChartNo.tooMany");
		}
	}
}