package com.ling.librarymanagementsystem.common;

public class ResultResponse {

    public static <T> BaseResponse<T> success(T data) {
        return new BaseResponse<T>(ResultErrorCode.SUCCESS.getCode(), ResultErrorCode.SUCCESS.getMessage(), data);
    }

    public static <T> BaseResponse<T> success(int code, String message) {
        return new BaseResponse<T>(code, message);
    }

    public static <T> BaseResponse<T> success(int code, String message, T data) {
        return new BaseResponse<T>(code, message, data);
    }

    public static <T> BaseResponse<T> fail(ResultErrorCode resultErrorCode, T data) {
        return new BaseResponse<T>(resultErrorCode.getCode(), resultErrorCode.getMessage(), data);
    }

    public static <T> BaseResponse<T> fail(ResultErrorCode resultErrorCode) {
        return new BaseResponse<T>(resultErrorCode.getCode(), resultErrorCode.getMessage());
    }

    public static <T> BaseResponse<T> fail(int code, String message) {
        return new BaseResponse<T>(code, message);
    }
}
