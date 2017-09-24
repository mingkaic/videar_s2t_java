FROM dgroup/java8-gradle:latest

ENV S2T_DIR /usr/src/s2t

# Create app directory
RUN mkdir -p $S2T_DIR
WORKDIR $S2T_DIR

# move everything
COPY . $S2T_DIR

RUN gradle build

CMD ["java", "-mx300m", "-Xmx300m", "-Xms300m", "-XX:+UseParallelGC", "-XX:-UseGCOverheadLimit", "-jar", "build/libs/s2t-gradle-0.1.0.jar"]
