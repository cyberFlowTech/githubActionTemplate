## 1. 如何在一个项目中使用github action作为cicd的工具?
### 将这些文件放到项目的对应目录中:
### .github/workflows/cicd.yml
### ./deploy/docker/Dockerfile
### ./deploy/k8s/k8s.yaml
## 2. 开发者需要调整哪些文件?
### 开发者需要维护整个Dockerfile文件,以及其他文件中标注"开发者维护"的内容
## 3. 分支与tag的管理?
### 非生产环境可以直接发布分支，生产环境需要打tag再发布