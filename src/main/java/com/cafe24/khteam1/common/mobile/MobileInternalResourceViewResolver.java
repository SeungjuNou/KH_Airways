package com.cafe24.khteam1.common.mobile;

import java.util.Locale;


import org.slf4j.Logger;

import org.slf4j.LoggerFactory;

import org.springframework.mobile.device.Device;

import org.springframework.mobile.device.DeviceUtils;

import org.springframework.web.context.request.RequestContextHolder;

import org.springframework.web.servlet.view.AbstractUrlBasedView;

import org.springframework.web.servlet.view.InternalResourceView;

import org.springframework.web.servlet.view.InternalResourceViewResolver;


public class MobileInternalResourceViewResolver extends InternalResourceViewResolver {

	private Logger logger = LoggerFactory.getLogger(MobileInternalResourceViewResolver.class);


	@Override

	protected AbstractUrlBasedView buildView(String viewName) throws Exception {

		Device device = DeviceUtils.getCurrentDevice(RequestContextHolder.currentRequestAttributes());

		if (device.isMobile()) {

			viewName = getMobileViewName(viewName);
			logger.debug("mobile");

		}

		logger.debug("ViewName : {}", viewName);

		return (InternalResourceView) super.buildView(viewName);

	}


	private String getMobileViewName(String viewName) {

		return viewName+"mobile";

	}


	@Override

	protected Object getCacheKey(String viewName, Locale locale) {

		Device device = DeviceUtils.getCurrentDevice(RequestContextHolder.currentRequestAttributes());

		if (device.isMobile()) {

			return super.getCacheKey(getMobileViewName(viewName), locale);

		} else {

			return super.getCacheKey(viewName, locale);

		}

	}

}