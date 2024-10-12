# version

<https://github.com/minio/minio>

```bash
git remote add upstream git@github.com:minio/minio.git

git fetch upstream

git merge RELEASE.2024-10-02T17-50-41Z
```

## debug

```bash
# cache
docker run -it \
  --rm \
  -v $PWD/:/go/src/github.com/minio/minio \
  -w /go/src/github.com/minio/minio \
  registry.cn-qingdao.aliyuncs.com/wod/golang:1.22-alpine \
  rm -rf vendor && go mod vendor

# build
docker run -it \
  --rm \
  -v $PWD/:/go/src/github.com/minio/minio \
  -w /go/src/github.com/minio/minio \
  registry.cn-qingdao.aliyuncs.com/wod/golang:1.22-alpine \
  bash .beagle/build.sh

# check
file .bin/linux/arm64/minio
```

## cache

```bash
# 构建缓存-->推送缓存至服务器
docker run --rm \
  -e PLUGIN_REBUILD=true \
  -e PLUGIN_ENDPOINT=$PLUGIN_ENDPOINT \
  -e PLUGIN_ACCESS_KEY=$PLUGIN_ACCESS_KEY \
  -e PLUGIN_SECRET_KEY=$PLUGIN_SECRET_KEY \
  -e DRONE_REPO_OWNER="open-beagle" \
  -e DRONE_REPO_NAME="minio" \
  -e PLUGIN_MOUNT="./.git" \
  -v $(pwd):$(pwd) \
  -w $(pwd) \
  registry.cn-qingdao.aliyuncs.com/wod/devops-s3-cache:1.0

# 读取缓存-->将缓存从服务器拉取到本地
docker run --rm \
  -e PLUGIN_RESTORE=true \
  -e PLUGIN_ENDPOINT=$PLUGIN_ENDPOINT \
  -e PLUGIN_ACCESS_KEY=$PLUGIN_ACCESS_KEY \
  -e PLUGIN_SECRET_KEY=$PLUGIN_SECRET_KEY \
  -e DRONE_REPO_OWNER="open-beagle" \
  -e DRONE_REPO_NAME="minio" \
  -v $(pwd):$(pwd) \
  -w $(pwd) \
  registry.cn-qingdao.aliyuncs.com/wod/devops-s3-cache:1.0
```
