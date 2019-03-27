package com.answer.springboot.mybatis.web.entity;

/**
 * @author Answer.AI.L
 * @date 2019-03-27
 */
public class AIResponse<T> {
    private String respCode;
    private T respDesc;

    private AIResponse(String respCode, T respDesc) {
        this.respCode = respCode;
        this.respDesc = respDesc;
    }

    private AIResponse(String respCode, T respDesc, long startTime) {
        this.respCode = respCode;
        this.respDesc = respDesc;
    }

    public static <T> AIResponse success(T t) {
        return new AIResponse<>("0000", t);
    }

    public static <T> AIResponse failed(T t) {
        return new AIResponse<>("0001", t);
    }

    public String getRespCode() {
        return respCode;
    }

    public void setRespCode(String respCode) {
        this.respCode = respCode;
    }

    public T getRespDesc() {
        return respDesc;
    }

    public void setRespDesc(T respDesc) {
        this.respDesc = respDesc;
    }

}