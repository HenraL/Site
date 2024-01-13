echo off
color 0A
set RESSOURCE_PATH=.
set CONTAINER_NAME=webapp
set PORT=80
echo (c) Created by Henry Letellier
echo "Stopping container"
docker stop %CONTAINER_NAME%
echo "Removing container"
docker rm %CONTAINER_NAME%
echo "Removing image"
docker rmi %CONTAINER_NAME%
echo "Building image"
docker build -t %CONTAINER_NAME% .
echo "Deploying container"
docker run -it --rm -d -p %PORT%:%PORT% -v %RESSOURCE_PATH%:/usr/share/nginx/html:ro --name %CONTAINER_NAME% %CONTAINER_NAME%
start http://localhost:%PORT%
