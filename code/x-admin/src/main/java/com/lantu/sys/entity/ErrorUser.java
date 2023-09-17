package com.lantu.sys.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;

/**
 * <p>
 *
 * </p>
 *
 * @author zhanghongshuai
 * @since 2023-09-17
 */
@TableName("error_user")
@Data
public class ErrorUser implements Serializable {

    private static final long serialVersionUID = 1L;

    private Integer id;

    private String pdu;

    private String keyword;

    private String descript;

    private String solution;

    private String wiki;

    private String type;

    private String author;

    private String status;
}
