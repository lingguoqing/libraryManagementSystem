package com.ling.librarymanagementsystem.common;

public class BaseResponse {

    public static <T> ResultResponse<T> success(T data) {
        return new ResultResponse<T>(ResultErrorCode.SUCCESS.getCode(), ResultErrorCode.SUCCESS.getMessage(), data);
    }

    public static <T> ResultResponse<T> success(int code, String message) {
        return new ResultResponse<T>(code, message);
    }

    public static <T> ResultResponse<T> success(int code, String message, T data) {
        return new ResultResponse<T>(code, message, data);
    }

    public static <T> ResultResponse<T> fail(ResultErrorCode resultErrorCode, T data) {
        return new ResultResponse<T>(resultErrorCode.getCode(), resultErrorCode.getMessage(), data);
    }

    public static <T> ResultResponse<T> fail(ResultErrorCode resultErrorCode) {
        return new ResultResponse<T>(resultErrorCode.getCode(), resultErrorCode.getMessage());
    }

    public static <T> ResultResponse<T> fail(int code, String message) {
        return new ResultResponse<T>(code, message);
    }
}
