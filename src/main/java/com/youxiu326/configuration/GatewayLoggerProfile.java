package com.youxiu326.configuration;

import ch.qos.logback.classic.Logger;
import ch.qos.logback.classic.LoggerContext;
import ch.qos.logback.classic.encoder.PatternLayoutEncoder;
import ch.qos.logback.classic.spi.ILoggingEvent;
import ch.qos.logback.core.rolling.RollingFileAppender;
import ch.qos.logback.core.rolling.TimeBasedRollingPolicy;
import org.slf4j.impl.StaticLoggerBinder;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;

/**
 * Spring Cloud Gateway 代理日志记录 Filter
 *
 * 日志记录参考简书：https://www.jianshu.com/p/350d26dea23f
 */

@Component
@ConditionalOnProperty(value = "gateway.log.enable", matchIfMissing = true)
public class GatewayLoggerProfile {
    public static final String LOGGER_NAME = "requestRecorder";

    @Value("${logging.path}")
    private String logPath;

    @PostConstruct
    public void onReady() {
        LoggerContext context = (LoggerContext)StaticLoggerBinder.getSingleton().getLoggerFactory();

        //把 log 写入到专门的文件中
        Logger logger = context.getLogger(LOGGER_NAME);
        logger.detachAndStopAllAppenders();

        String logFile = null;
        if (logPath.endsWith("/"))
            logFile = logPath + "pv/pv.log";
        else
            logFile = logPath + "/pv/pv.log";

        //以下代码 通过反编译 log组件代码发现的， 不保证时效性
        RollingFileAppender<ILoggingEvent> appender = new RollingFileAppender<>();
        appender.setFile(logFile);

        PatternLayoutEncoder encoder = new PatternLayoutEncoder();

        // 日志格式化
        String logPattern = "%date %level [%thread] %logger{36} [%file : %line] %msg%n";
        encoder.setPattern(logPattern);
        encoder.setContext(context);
        encoder.setParent(appender);
        appender.setEncoder(encoder);
        encoder.start();

        TimeBasedRollingPolicy policy = new TimeBasedRollingPolicy();
        policy.setCleanHistoryOnStart(false);
        policy.setMaxHistory(30);
        policy.setContext(context);
        policy.setFileNamePattern(logFile + ".%d{yyyy-MM-dd}.gz");
        policy.setParent(appender);
        appender.setRollingPolicy(policy);
        policy.start();

        appender.setName(LOGGER_NAME + "-appender");
        appender.setContext(context);
        appender.start();

        logger.addAppender(appender);

        logger.setAdditive(false);
    }
}
