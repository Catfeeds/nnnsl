package com.ikkong.job;

import cn.codeforfun.jfinalplugin.quartz.core.JFinalJob;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Job2 extends JFinalJob {
    public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        System.out.println("job2 " + sdf.format(new Date()));
    }
}
