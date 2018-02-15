FROM golang:1.9.4 AS builder
ENV CGO_ENABLED=0
ENV GOOS=linux
RUN go get -u github.com/rakyll/hey \
    && go build -a -o hey github.com/rakyll/hey

FROM scratch
COPY --from=builder /go/hey /hey

ENTRYPOINT ["/hey"]