package com.KSW.web.action;

/*
 * ActionForward 클래스는 웹 애플리케이션에서 Action 클래스가 수행한 작업의 결과를 나타냅니다.
 * isRedirect는 페이지 전환 방식을 나타내며, true일 경우 Redirect, false일 경우 Forward를 의미합니다.
 * path는 이동할 경로를 나타냅니다.
 */
public class ActionForward {
	private boolean isRedirect;
	private String path;

	/**
	 * 기본 생성자. isRedirect는 false로, path는 null로 초기화됩니다.
	 */
	public ActionForward() {
	}

	/**
	 * 인자를 받는 생성자. isRedirect와 path를 초기화합니다.
	 *
	 * @param isRedirect 페이지 전환 방식을 나타내는 boolean 값입니다. true일 경우 Redirect, false일 경우
	 *                   Forward를 의미합니다.
	 * @param path       이동할 경로를 나타내는 문자열입니다.
	 */
	public ActionForward(boolean isRedirect, String path) {
		super();
		this.isRedirect = isRedirect;
		this.path = path;
	}

	/**
	 * 페이지 전환 방식을 반환합니다.
	 *
	 * @return 페이지 전환 방식을 나타내는 boolean 값입니다. true일 경우 Redirect, false일 경우 Forward를
	 *         의미합니다.
	 */
	public boolean isRedirect() {
		return isRedirect;
	}

	/**
	 * 페이지 전환 방식을 설정합니다.
	 *
	 * @param isRedirect 페이지 전환 방식을 나타내는 boolean 값입니다. true일 경우 Redirect, false일 경우
	 *                   Forward를 의미합니다.
	 */
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}

	/**
	 * 이동할 경로를 반환합니다.
	 *
	 * @return 이동할 경로를 나타내는 문자열입니다.
	 */
	public String getPath() {
		return path;
	}

	/**
	 * 이동할 경로를 설정합니다.
	 *
	 * @param path 이동할 경로를 나타내는 문자열입니다.
	 */
	public void setPath(String path) {
		this.path = path;
	}
}
