# 使用 ARG 定义构建参数
ARG SUPERSONIC_VERSION=1.0.0-SNAPSHOT
ARG S2_DB_TYPE=postgres

FROM openjdk:21-jdk-bullseye as base

# Set the working directory in the container
WORKDIR /usr/src/app

# Argument to pass in the supersonic version at build time
ARG SUPERSONIC_VERSION

# Copy the supersonic standalone zip file into the container
# 修改为从assembly/build目录复制
COPY assembly/build/supersonic-standalone-${SUPERSONIC_VERSION}.zip .

# Unzip the supersonic standalone zip
RUN if [ ! -f "supersonic-standalone-${SUPERSONIC_VERSION}.zip" ]; then \
    echo "Error: ZIP file not found in build context!"; exit 1; fi
RUN unzip -q -o supersonic-standalone-${SUPERSONIC_VERSION}.zip || ([ $? -eq 1 ] && rm -f supersonic-standalone-${SUPERSONIC_VERSION}.zip)

# 清理临时文件
RUN rm -f supersonic-standalone-${SUPERSONIC_VERSION}.zip

FROM openjdk:21-slim

# Set the working directory in the container
WORKDIR /usr/src/app

# Argument to pass in the supersonic version at build time
ARG SUPERSONIC_VERSION

# Copy the supersonic standalone folder into the container
COPY --from=base /usr/src/app/supersonic-standalone-${SUPERSONIC_VERSION} ./supersonic-standalone-${SUPERSONIC_VERSION}

# Create a symbolic link to the supersonic installation directory
RUN ln -s /usr/src/app/supersonic-standalone-${SUPERSONIC_VERSION} /usr/src/app/supersonic-standalone-latest

# Set the working directory to the supersonic installation directory
WORKDIR /usr/src/app/supersonic-standalone-${SUPERSONIC_VERSION}

# Expose the default port
EXPOSE 9080
# Command to run the supersonic daemon
RUN chmod +x bin/supersonic-daemon.sh
CMD ["bash", "-c", "bin/supersonic-daemon.sh restart standalone ${S2_DB_TYPE} && tail -f /dev/null"]


## 解决换行符问题
RUN apt-get update && apt-get install -y dos2unix
RUN find ./bin -name "*.sh" -exec dos2unix {} \;
