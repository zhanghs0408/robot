package com.itheima.domain;

import lombok.Data;

@Data
public class QueryPageBean {
    private Integer currentPage;
    private Integer pageSize;
    private String queryString;
}
