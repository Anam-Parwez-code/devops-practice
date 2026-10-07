#!/bin/bash
sudo service docker start
HOSTIP=$(ip route show default | awk '{print $3}')
echo "Windows IP: $HOSTIP"
read -s -p "SQL password: " SQLPASS; echo
docker rm -f wsms-api 2>/dev/null
docker run -d -p 8080:8080 --name wsms-api \
  -v wsms-wwwroot:/app/wwwroot \
  -e "ConnectionStrings__MVCConnection=Server=$HOSTIP,1433;Database=WaralsDatabase2;User Id=wsms_app;Password=$SQLPASS;TrustServerCertificate=True;MultipleActiveResultSets=True;" \
  wsms-backend:v1
sleep 5
docker logs --tail 5 wsms-api
