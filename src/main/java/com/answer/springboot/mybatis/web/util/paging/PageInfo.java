package com.answer.springboot.mybatis.web.util.paging;

/**
 * Created by Answer on 2018-06-19 17:19
 *
 * MyBatis 分页插件实体类
 */
public class PageInfo {
    private int currentPage;
    private int pageSize;

    public PageInfo(int currentPage, int pageSize) {
        this.currentPage = currentPage;
        this.pageSize = pageSize;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }
}