package com.ling.librarymanagementsystem.common;

import lombok.Data;

/**
 * 统一返回结果类
 *
 * @param <T>
 */
@Data
public class ResultResponse<T> {

    private int code;

    private String message;

    private T data;

    public ResultResponse(int code, String message, T data) {
        this.code = code;
        this.message = message;
        this.data = data;
    }

    public ResultResponse(int code, String message) {
        this.code = code;
        this.message = message;
    }

    public ResultResponse(ResultErrorCode resultErrorCode) {
        this(resultErrorCode.getCode(), resultErrorCode.getMessage(), null);
    }

    public ResultResponse(ResultErrorCode resultErrorCode, T data) {
        this(resultErrorCode.getCode(), resultErrorCode.getMessage(), data);
    }
}
