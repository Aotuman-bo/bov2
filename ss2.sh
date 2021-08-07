#!/bin/sh

cat << EFO > /opt/jar/proxy.yaml 
                
proxy:
  authPassword: 'uibobo.com'
  localPort: 433
  maxConnections: 300

logging:
  file: /opt/jar/logs/v2ray-proxy.log
  file.max-history: 7
  level:
    root: info
manager:
  address: http://106.75.225.191:9091
  getProxyAccountUrl: ${manager.address}/proxy/proxyAccount/ac?accountNo={accountNo}&domain={domain}
  reportFlowUrl: ${manager.address}/report/flowStat
  reportOverConnectionLimitUrl: ${manager.address}/report/connectionLimit?accountNo={accountNo}

server:
  port: 8091
  tomcat:
    max-threads: 1
    min-threads: 1
              
EFO

nohup /usr/local/bin/v2ray -config /usr/local/etc/v2ray/config.json  > /usr/local/etc/v2ray/v2ray.out 2>&1 &
nohup java -jar -Xms40m -Xmx40m -XX:MaxDirectMemorySize=10M -XX:MaxMetaspaceSize=80m /opt/jar/v2ray-proxy.jar --spring.config.location=/opt/jar/proxy.yaml > /dev/null 2>&1 &

