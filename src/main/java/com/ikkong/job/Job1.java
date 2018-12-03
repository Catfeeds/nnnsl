package com.ikkong.job;

import cn.codeforfun.jfinalplugin.quartz.core.JFinalJob;
import com.ikkong.core.dao.Blade;
import com.sun.org.apache.xpath.internal.operations.Bool;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

public class Job1 extends JFinalJob {
    public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        System.out.println("job1 " + sdf.format(new Date()));
        Blade.dao().update("Cars.initcars");
    }
}
