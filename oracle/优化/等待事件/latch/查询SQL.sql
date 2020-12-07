latch是一种轻量级的锁，不会造成阻塞，会导致等待。
阻塞，是系统设计的问题，等待，是资源争用问题。




Check the following V$SESSION_WAIT parameter columns:

?P1 - Address of the latch
?P2 - Latch number
?P3 - Number of times process has already slept, waiting for the latch


-- 查询最近等待的latch
SELECT EVENT, SUM(P3) SLEEPS, SUM(SECONDS_IN_WAIT) SECONDS_IN_WAIT
  FROM V$SESSION_WAIT
 WHERE EVENT LIKE 'latch%'
  GROUP BY EVENT;


-- 查询latch引起的等待事件占db time的比值
SELECT EVENT, TIME_WAITED_MICRO, 
       ROUND(TIME_WAITED_MICRO*100/S.DBTIME,1) PCT_DB_TIME 
  FROM V$SYSTEM_EVENT, 
   (SELECT VALUE DBTIME FROM V$SYS_TIME_MODEL WHERE STAT_NAME = 'DB time') S
 WHERE EVENT LIKE 'latch%'
 ORDER BY PCT_DB_TIME ASC;
