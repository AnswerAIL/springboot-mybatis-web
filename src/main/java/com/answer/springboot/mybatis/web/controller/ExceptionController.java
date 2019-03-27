package com.answer.springboot.mybatis.web.controller;

import com.answer.springboot.mybatis.web.entity.AIResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;


/**
 * @author Answer.AI.L
 * @date 2019-03-27
 *
 *
 * ExceptionHandler：统一处理某一类异常，从而能够减少代码重复率和复杂度
 * ControllerAdvice：异常集中处理，更好的使业务逻辑与异常处理剥离开
 * ResponseStatus：可以将某种异常映射为HTTP状态码
 *
 *
 * 函数返回值： ModelAndView、Model、Map、View、String、HttpEntity<?> 、 ResponseEntity<?> 以及 void
 */
@ControllerAdvice
public class ExceptionController {
    private static final Logger LOGGER = LoggerFactory.getLogger(ExceptionController.class);

    @ExceptionHandler(Exception.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ResponseBody
    public AIResponse exceptionHandler(Exception exception) {
        LOGGER.info("exception: " + exception.getMessage());

        return AIResponse.failed(exception.getMessage());
    }



    @ExceptionHandler(NullPointerException.class)
    @ResponseStatus(HttpStatus.ACCEPTED)
    @ResponseBody
    public AIResponse exceptionHandler(NullPointerException nullPointerException) {
        LOGGER.info("nullPointerException: " + nullPointerException.getMessage());

        return AIResponse.failed(nullPointerException.getMessage());
    }


}