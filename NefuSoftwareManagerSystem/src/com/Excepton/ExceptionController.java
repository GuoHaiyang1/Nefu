package com.Excepton;

import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.validation.BindException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@ControllerAdvice
public class ExceptionController {
	private static Logger logger = LogManager.getLogger(ExceptionController.class);
	
	/**
	 * 处理controller方法参数校验失败异常
	 * @param e
	 * @param request
	 * @param redirectAttributes
	 * @return
	 */
	@ExceptionHandler(ConstraintViolationException.class)
	public String getConstraintViolationException(
			ConstraintViolationException e, 
			HttpServletRequest request, 
			RedirectAttributes redirectAttributes) {
		logger.debug(request.getHeader("referer"));
		logger.debug("ConstraintViolationException");
		 Set<ConstraintViolation<?>> violations = e.getConstraintViolations();
	      StringBuilder strBuilder = new StringBuilder();
	      violations.forEach(v -> {
	    	  strBuilder.append(v.getMessage() + "; ");
	      });
	      redirectAttributes.addFlashAttribute("exception", strBuilder.toString());
	      return "redirect:" + request.getHeader("referer");
	}
	/**
	 * 处理对象属性校验失败异常
	 * @param e
	 * @param request
	 * @param redirectAttributes
	 * @return
	 */
	@ExceptionHandler(BindException.class)
	public String getBindException(
			BindException e, 
			HttpServletRequest request, 
			RedirectAttributes redirectAttributes) {
		logger.debug("BindException");
		StringBuilder strBuilder = new StringBuilder();
		 e.getFieldErrors().forEach(er -> {
			 strBuilder.append(er.getDefaultMessage() + "; ");
		 });
	      redirectAttributes.addFlashAttribute("exception", strBuilder.toString());
	      return "redirect:" + request.getHeader("referer");
	}
	/**
	 * 处理自定义异常
	 * @param request
	 * @param redirectAttributes
	 * @param e
	 * @return
	 */
	@ExceptionHandler(MyException.class)
	public String getMyException(
			HttpServletRequest request, 
			RedirectAttributes redirectAttributes, 
			MyException e) {
		logger.debug(e.getMessage());
		redirectAttributes.addFlashAttribute("exception", e.getMessage());
		return "redirect:" + request.getHeader("referer");
	}
	
	/**
	 * 校验json
	 */
	@ExceptionHandler(MethodArgumentNotValidException.class)
	public void getMethodArgumentNotValidException(){
		logger.debug("MethodArgumentNotValidException");
	} 

}
