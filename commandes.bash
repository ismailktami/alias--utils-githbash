set kcd=taskkill //F //IM chromedriver.exe
set kc=taskkill //F //IM chrome.exe
set lj=java -jar


netstat -ano | findstr :8080

# get java process and run gabrafe collector
ps -fC java
ps -A |grep java
java -XX:+PrintFlagsFinal -version | grep HeapSize
jcmd PID GC.run  //force gabrage collector
kill -9 <PID>


java -jar app.jar -Xmx1g


 docker run -d --name=prometheus -p 9090:9090 -v prometheus.yml:/etc/prometheus/prometheus.yml prom/prometheus --config.file=/etc/prometheus/prometheus.yml