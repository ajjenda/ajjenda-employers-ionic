FROM ajjenda/ionic
MAINTAINER Yoseph Reuveni <yoseph.reuveni@gmail.com>
 
RUN phonegap -v && \
    cordova -v && \
    ionic -v && \
    n -V && \
    bower -v && \
    node -v

COPY ajjenda-mobile-employers.tar.gz .
RUN tar -zxf ajjenda-mobile-employers.tar.gz && rm ajjenda-mobile-employers.tar.gz 

# Expose the ports we're interested in
EXPOSE 8100 8100
EXPOSE 35729 35729

# Set the default command to run on boot
# This will boot IONIC in the standalone mode and bind to all interface
WORKDIR AjjendaEmployers
CMD ["ionic", "serve", "-c", "-s", "--address", "0.0.0.0"]
