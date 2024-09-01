package com.ling.librarymanagementsystem.exception;

import com.ling.librarymanagementsystem.common.ResultErrorCode;

/**
 * 抛异常工具类
 */
public class ThrowUtils {

    /**
     * 条件成立则抛异常
     *
     * @param condition
     * @param runtimeException
     */
    public static void throwIf(boolean condition, RuntimeException runtimeException) {
        if (condition) {
            throw runtimeException;
        }
    }

    /**
     * 条件成立则抛异常
     *
     * @param condition
     * @param resultErrorCode
     */
    public static void throwIf(boolean condition, ResultErrorCode resultErrorCode) {
        throwIf(condition, new BusinessException(resultErrorCode));
    }

    /**
     * 条件成立则抛异常
     *
     * @param condition
     * @param resultErrorCode
     * @param message
     */
    public static void throwIf(boolean condition, ResultErrorCode resultErrorCode, String message) {
        throwIf(condition, new BusinessException(resultErrorCode, message));
    }
}
