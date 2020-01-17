# Deployment
## 前置需求
### 安裝kubectl
https://kubernetes.io/docs/tasks/tools/install-kubectl/
### 安裝skaffold
https://skaffold.dev/docs/install/
### 安裝gcloud cli
https://cloud.google.com/sdk/docs/quickstart-macos?hl=zh-tw

### 連結k8s環境
`gcloud container clusters get-credentials ${CLUSTER_NAME} --zone ${ZONE_NAME} --project ${PROJECT_NAME}`<br>

## 指令
commit變動並且加上版本號<br>
`git add .`<br>
`git commit -m "Update for v?.?.?"`<br>
`git tag v?.?.?`

build image並輸出image資訊<br>
`skaffold build --file-output deploy/v?.?.?.json`

進行deploy<br>
`skaffold deploy -a deploy/v?.?.?.json`