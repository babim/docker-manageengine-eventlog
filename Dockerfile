FROM babim/oraclelinuxbase:7
ENV SOFT	EventLog
ENV EDITTION	pro
ENV SOFT_HOME	/opt/ManageEngine/${SOFT}
ENV FIXED	true
ENV MANUAL	true

# download option
RUN yum install curl -y && \
    curl -Ls https://raw.githubusercontent.com/babim/docker-tag-options/master/z%20SCRIPT%20AUTO/option.sh -o /option.sh && \
    chmod +x /option.sh

# install
RUN curl -s https://raw.githubusercontent.com/babim/docker-tag-options/master/z%20ManageEngine/${SOFT}_install.sh | bash

# Set the default working directory as the installation directory.
#WORKDIR ${SOFT_HOME}

VOLUME ["${SOFT_HOME}"]
# Expose default HTTP connector port.
EXPOSE 8400 513/tcp 514/tcp 513/udp 514/udp

CMD ["/usr/sbin/init"]
ENTRYPOINT ["/docker-entrypoint.sh"]