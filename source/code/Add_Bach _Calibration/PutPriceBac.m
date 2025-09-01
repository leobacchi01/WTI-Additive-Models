function [price]=PutPriceBac(K,F,T,sigma,disc)
d=(F-K)/(sigma*sqrt(T));
price=disc*((K-F)*normcdf(-d)+sigma*sqrt(T)*normpdf(d));