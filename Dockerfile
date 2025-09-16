FROM golang:1.25 AS build
WORKDIR /build
COPY . .
RUN CGO_ENABLED=0 go build -a -ldflags '-extldflags "-static"' -o thisisfine main.go

FROM scratch
COPY --from=build /build/thisisfine /usr/local/bin/thisisfine
ENV TERM="xterm-256color"
CMD ["/usr/local/bin/thisisfine"]
