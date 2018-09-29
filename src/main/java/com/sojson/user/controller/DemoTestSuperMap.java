package com.sojson.user.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sojson.common.controller.BaseController;
import com.sojson.common.utils.MathUtil;
import com.sojson.user.bo.SubmitDto;

@Controller
@Scope(value="prototype")
@RequestMapping("arcgis")
public class DemoTestSuperMap extends BaseController {
	
	final static String OUT_MAP = DemoTestSuperMap.class.getCanonicalName() + "_outMap"; 
	final static String URL_PART = DemoTestSuperMap.class.getCanonicalName() + "_url"; 
	
	
	@RequestMapping(value="index")
	public ModelAndView list(ModelMap map,HttpServletRequest request){
		//页面输出map构建。
		Map<String, Object> outMap = new SubmitDto().securitySelf();
		//存储Session , 或者存储缓存(带时效).
		HttpSession session = request.getSession();
		session.setAttribute(OUT_MAP, outMap);
		//输出到页面使用
		map.putAll(outMap);
		//url 动态输出Session, 或者存储缓存(带时效).
		String urlPart = MathUtil.getRandom620(10);
		session.setAttribute(URL_PART, urlPart);
		//页面显示
		map.put("urlPart", urlPart);
		return new ModelAndView("arcgis/index");
	}
	

	
	
}
