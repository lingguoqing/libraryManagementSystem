package com.ling.librarymanagementsystem.common;

import com.ling.librarymanagementsystem.model.vo.LoginUserVo;

public class BaseContext {

        public static ThreadLocal<LoginUserVo> threadLocal = new ThreadLocal<>();

        public static void setThreadLocal(LoginUserVo loginUserVo) {
            threadLocal.set(loginUserVo);
        }

        public static LoginUserVo getThreadLocal() {
            return threadLocal.get();
        }

        public static void clearThreadLocal() {
            threadLocal.remove();
        }
}
