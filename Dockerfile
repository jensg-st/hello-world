FROM golang:1.17-buster as build

WORKDIR /app
COPY ./main.go ./
RUN CGO_ENABLED=0 go build -o /application -ldflags="-s -w" main.go

FROM scratch

COPY --from=build /application /application

CMD ["/application"]
