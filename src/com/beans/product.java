package com.beans;

import java.sql.Date;

public class product {
	int productId,RAM,ROM,expandable,simType,cores;
	String productName,ModelNumber,brand,OS,netorkType,phoneType,FM,wifi,bluethooth,GPRS,USB,FLASH;
	float MarketPrice,SellingPrice,clockSpeed,screenSize,rearCamera,frontCamera;
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public int getRAM() {
		return RAM;
	}
	public void setRAM(int RAM) {
		this.RAM = RAM;
	}
	public int getROM() {
		return ROM;
	}
	public void setROM(int ROM) {
		this.ROM = ROM;
	}
	public int getExpandable() {
		return expandable;
	}
	public void setExpandable(int expandable) {
		this.expandable = expandable;
	}
	public int getSimType() {
		return simType;
	}
	public void setSimType(int simType) {
		this.simType = simType;
	}
	public int getCores() {
		return cores;
	}
	public void setCores(int cores) {
		this.cores = cores;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getModelNumber() {
		return ModelNumber;
	}
	public void setModelNumber(String modelNumber) {
		ModelNumber = modelNumber;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getOS() {
		return OS;
	}
	public void setOS(String OS) {
		this.OS = OS;
	}
	public String getNetorkType() {
		return netorkType;
	}
	public void setNetorkType(String netorkType) {
		this.netorkType = netorkType;
	}
	public String getPhoneType() {
		return phoneType;
	}
	public void setPhoneType(String phoneType) {
		this.phoneType = phoneType;
	}
	public String getFM() {
		return FM;
	}
	public void setFM(String FM) {
		this.FM = FM;
	}
	public String getWifi() {
		return wifi;
	}
	public void setWifi(String wifi) {
		this.wifi = wifi;
	}
	public String getBluethooth() {
		return bluethooth;
	}
	public void setBluethooth(String bluethooth) {
		this.bluethooth = bluethooth;
	}
	public String getGPRS() {
		return GPRS;
	}
	public void setGPRS(String GPRS) {
		this.GPRS = GPRS;
	}
	public String getUSB() {
		return USB;
	}
	public void setUSB(String USB) {
		this.USB = USB;
	}
	public String getFLASH() {
		return FLASH;
	}
	public void setFLASH(String FLASH) {
		this.FLASH = FLASH;
	}
	public float getMarketPrice() {
		return MarketPrice;
	}
	public void setMarketPrice(float marketPrice) {
		MarketPrice = marketPrice;
	}
	public float getSellingPrice() {
		return SellingPrice;
	}
	public void setSellingPrice(float sellingPrice) {
		SellingPrice = sellingPrice;
	}
	public float getClockSpeed() {
		return clockSpeed;
	}
	public void setClockSpeed(float clockSpeed) {
		this.clockSpeed = clockSpeed;
	}
	public float getScreenSize() {
		return screenSize;
	}
	public void setScreenSize(float screenSize) {
		this.screenSize = screenSize;
	}
	public float getRearCamera() {
		return rearCamera;
	}
	public void setRearCamera(float rearCamera) {
		this.rearCamera = rearCamera;
	}
	public float getFrontCamera() {
		return frontCamera;
	}
	public void setFrontCamera(float frontCamera) {
		this.frontCamera = frontCamera;
	}
	public Date getAddDate() {
		return addDate;
	}
	public void setAddDate(Date addDate) {
		this.addDate = addDate;
	}
	Date addDate;

}
