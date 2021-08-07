FROM liubobo/v2-ubuntu

ADD ss2.sh /opt/ss2.sh
RUN chmod +x /opt/ss2.sh

ENTRYPOINT ["sh", "-c", "/opt/ss2.sh"]

