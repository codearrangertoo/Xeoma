# Xeoma
Xeoma Dockerfile

http://felenasoft.com/xeoma/en/

Building:

docker build --tag=jgarland79/xeoma:15.2.25 ./

Starting and getting the password:

CID=$(docker run -d -t -p 8090:8090 jgarland79/xeoma:15.2.25) && docker exec $CID /home/xeoma/bin/xeoma.app -showpassword



