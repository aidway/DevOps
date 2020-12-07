latch��һ����������������������������ᵼ�µȴ���
��������ϵͳ��Ƶ����⣬�ȴ�������Դ�������⡣




Check the following V$SESSION_WAIT parameter columns:

?P1 - Address of the latch
?P2 - Latch number
?P3 - Number of times process has already slept, waiting for the latch


-- ��ѯ����ȴ���latch
SELECT EVENT, SUM(P3) SLEEPS, SUM(SECONDS_IN_WAIT) SECONDS_IN_WAIT
  FROM V$SESSION_WAIT
 WHERE EVENT LIKE 'latch%'
  GROUP BY EVENT;


-- ��ѯlatch����ĵȴ��¼�ռdb time�ı�ֵ
SELECT EVENT, TIME_WAITED_MICRO, 
       ROUND(TIME_WAITED_MICRO*100/S.DBTIME,1) PCT_DB_TIME 
  FROM V$SYSTEM_EVENT, 
   (SELECT VALUE DBTIME FROM V$SYS_TIME_MODEL WHERE STAT_NAME = 'DB time') S
 WHERE EVENT LIKE 'latch%'
 ORDER BY PCT_DB_TIME ASC;
