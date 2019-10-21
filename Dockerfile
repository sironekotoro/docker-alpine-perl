FROM alpine:3.10.2
MAINTAINER sironekotoro <develop@sironekotoro.com>
# I created it based on ytnobody's image
# https://hub.docker.com/r/ytnobody/alpine-perl

RUN apk update && apk add gcc g++ make git patch perl perl-dev curl wget openssl perl-net-ssleay perl-io-socket-ssl perl-app-cpanminus
RUN cpanm App::cpm

WORKDIR /usr
RUN cpm install Plack

ENV PERL5LIB=/usr/local/lib/perl5
ENV PATH=/usr/local/bin:$PATH

WORKDIR /
