# Xeoma

FROM ubuntu:trusty
MAINTAINER Jason Garland <jason@jasongarland.com>

# Let the container know that there is no tty
ENV DEBIAN_FRONTEND noninteractive

# Resynchronize the package index files 
RUN apt-get update && apt-get install -y \
	libasound2 wget

# Set the root passwd
RUN echo 'root:root' | chpasswd

# Create the xeoma user
RUN useradd -d /home/xeoma -m -s /bin/bash xeoma
RUN echo xeoma:xeoma | chpasswd
RUN echo 'xeoma ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/xeoma
RUN chmod 0440 /etc/sudoers.d/xeoma

USER xeoma

WORKDIR /home/xeoma

RUN mkdir -p /home/xeoma/.config/Xeoma

VOLUME /home/xeoma/.config/Xeoma

# Download Xeoma
RUN mkdir -p /home/xeoma/bin && wget http://felenasoft.com/xeoma/downloads/xeoma_linux64.tgz -O - | tar -xzC /home/xeoma/bin

# Expose ssh and Xeoma ports
EXPOSE 8090
EXPOSE 22

CMD ["/home/xeoma/bin/xeoma.app", "-core"]

