package com.seven.domain;

public class PageBean {
	
	private int pageSize;
	private String pageNum;
	private int currentPage;
	private int startRow;
	
	private int count;
	private int pageBlock;
	private int startPage;
	private int endPage;
	private int pageCount;
	private float lower;
	private float upper;
	private String sorting;
	private String category;
	
	private String startDate;
	private String endDate;
	
	
	
	
	
	
	

	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getSorting() {
		return sorting;
	}
	public void setSorting(String sorting) {
		this.sorting = sorting;
	}
	public float getLower() {
		return lower;
	}
	public void setLower(float lower) {
		this.lower = lower;
	}
	public float getUpper() {
		return upper;
	}
	public void setUpper(float upper) {
		this.upper = upper;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public String getPageNum() {
		return pageNum;
	}
	public void setPageNum(String pageNum) {
		this.pageNum = pageNum;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
		// pageBlock, startPage, endPage, pageCount구하기
		init();
	}
	public void init() {
		pageBlock=12;
		startPage=(currentPage-1)/pageBlock*pageBlock+1;
		endPage=startPage+pageBlock-1;
		pageCount=count/pageSize+(count%pageSize==0?0:1);
		 if(endPage > pageCount){
		 	endPage = pageCount;
		 }
	}
	
	public int getPageBlock() {
		return pageBlock;
	}
	public void setPageBlock(int pageBlock) {
		this.pageBlock = pageBlock;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	
	
	
}
