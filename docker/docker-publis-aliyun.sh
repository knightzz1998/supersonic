docker login --username=15565946702 crpi-c5x1u0strnxo064s.cn-hangzhou.personal.cr.aliyuncs.com

## docker images 查看镜像ID
docker tag 04ae701cc46f crpi-c5x1u0strnxo064s.cn-hangzhou.personal.cr.aliyuncs.com/docker_wangtianci/supersonic:1.0.0-SNAPSHOT

docker push crpi-c5x1u0strnxo064s.cn-hangzhou.personal.cr.aliyuncs.com/docker_wangtianci/supersonic:1.0.0-SNAPSHOT
docker pull crpi-c5x1u0strnxo064s.cn-hangzhou.personal.cr.aliyuncs.com/docker_wangtianci/supersonic:1.0.0-SNAPSHOT