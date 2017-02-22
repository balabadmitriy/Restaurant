package com.restaurant.mvc.exception;

public class ClientServiceException extends RuntimeException {
    public ClientServiceException(String s) {
        super(s);
    }

    public ClientServiceException() {
        super();
    }

    public ClientServiceException(String s, Throwable throwable) {
        super(s, throwable);
    }

    public ClientServiceException(Throwable throwable) {
        super(throwable);
    }

    protected ClientServiceException(String s, Throwable throwable, boolean b, boolean b1) {
        super(s, throwable, b, b1);
    }
}
