# Xeoma Dockerfile

http://felenasoft.com/xeoma/en/

https://registry.hub.docker.com/u/jgarland79/xeoma/

#Download the docker image from docker.io
```
docker pull docker.io/jgarland79/xeoma:latest
```

#Start docker and retrieve the password
```
CID=$(docker run -d -t -p 8090:8090 docker.io/jgarland79/xeoma:latest) && docker exec $CID /home/xeoma/bin/xeoma.app -showpassword
```

Then launch the Xeoma client and configure it to connect to your remote server using the password you retrieved.

