##------------for-dev-env-----------##
FROM golang:alpine3.22 AS dev

WORKDIR /app/

RUN adduser -D myuser

COPY --chown=myuser:myuser go.* /app/

RUN chown myuser:myuser ./  

USER myuser

RUN go mod download 

COPY --chown=myuser:myuser . .

RUN go build -o my-app .

CMD [ "./my-app" ]
EXPOSE 8080

##------------for-prod-env-----------##

FROM golang:alpine3.22 AS builder

WORKDIR /app

COPY go.* ./
RUN go mod download

COPY . .
RUN go build -o my-app .

# Stage 2: Minimal runtime
FROM alpine:3.22 AS prod

WORKDIR /app


COPY --from=builder /app/my-app .

CMD ["./my-app"]
EXPOSE 8080
