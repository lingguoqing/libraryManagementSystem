package com.ling.librarymanagementsystem.common;

import lombok.Data;

/**
 * 统一返回结果类
 *
 * @param <T>
 */
@Data
public class BaseResponse<T> {

    private int code;

    private String message;

    private T data;

    public BaseResponse(int code, String message, T data) {
        this.code = code;
        this.message = message;
        this.data = data;
    }

    public BaseResponse(int code, String message) {
        this.code = code;
        this.message = message;
    }

    public BaseResponse(ResultErrorCode resultErrorCode) {
        this(resultErrorCode.getCode(), resultErrorCode.getMessage(), null);
    }

    public BaseResponse(ResultErrorCode resultErrorCode, T data) {
        this(resultErrorCode.getCode(), resultErrorCode.getMessage(), data);
    }
}
