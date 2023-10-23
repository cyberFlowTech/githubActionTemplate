# 开发者维护:
# 此处以golang项目为例

FROM golang:alpine as build
WORKDIR /app
ADD . .
RUN CGO_ENABLED=0 GOOS=linux go build -o myapp

FROM alpine:latest as final
COPY --from=build /app/myapp .
# 调整时区
RUN apk update && \
    apk add tzdata && \
    /bin/cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo 'Asia/Shanghai' >/etc/timezone
# 日志路径
RUN mkdir -p /Logs && mkdir -p /Config

# 这里注意暴露端口,与k8s.yaml文件中配置的相同
EXPOSE 8888
CMD ["/myapp"]