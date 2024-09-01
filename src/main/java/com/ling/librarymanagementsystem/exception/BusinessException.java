package com.ling.librarymanagementsystem.exception;


import com.ling.librarymanagementsystem.common.ResultErrorCode;

/**
 * 自定义异常类
 */
public class BusinessException extends RuntimeException {

    /**
     * 错误码
     */
    private final int code;

    public BusinessException(int code, String message) {
        super(message);
        this.code = code;
    }

    public BusinessException(ResultErrorCode resultErrorCode) {
        super(resultErrorCode.getMessage());
        this.code = resultErrorCode.getCode();
    }

    public BusinessException(ResultErrorCode resultErrorCode, String message) {
        super(message);
        this.code = resultErrorCode.getCode();
    }

    public int getCode() {
        return code;
    }
}
