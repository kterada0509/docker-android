FROM openjdk:8-jdk

LABEL maintainer="kterada.0509sg@gmail.com"

RUN apt-get update \
    && apt-get install -y wget unzip \
    && rm -rf /var/lib/apt/lists/* \
    && cd /usr/local \
    && wget http://dl.google.com/android/android-sdk_r24.4.1-linux.tgz \
    && tar zxvf android-sdk_r24.4.1-linux.tgz \
    && rm -rf /usr/local/android-sdk_r24.4.1-linux.tgz

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV ANDROID_HOME /usr/local/android-sdk-linux
ENV PATH $ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$PATH

RUN echo y | android update sdk --no-ui --all --filter "android-23,build-tools-23.0.3" \
  && echo y | android update sdk --no-ui --all --filter "extra-google-m2repository,extra-android-m2repository"