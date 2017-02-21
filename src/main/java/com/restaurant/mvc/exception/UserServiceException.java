package com.restaurant.mvc.exception;

public class UserServiceException extends RuntimeException {
    public UserServiceException(String s) {
        super(s);
    }

    public UserServiceException() {
        super();
    }

    public UserServiceException(String s, Throwable throwable) {
        super(s, throwable);
    }

    public UserServiceException(Throwable throwable) {
        super(throwable);
    }

    protected UserServiceException(String s, Throwable throwable, boolean b, boolean b1) {
        super(s, throwable, b, b1);
    }
}
