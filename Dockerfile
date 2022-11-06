FROM golang:latest AS builder
WORKDIR /app
COPY app.go /app/app.go
RUN go build app.go


FROM scratch
WORKDIR /
COPY --from=builder /app/app .
ENTRYPOINT ["/app"]