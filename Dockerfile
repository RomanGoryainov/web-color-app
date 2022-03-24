FROM python:3.9-alpine

RUN apk -U upgrade
RUN pip install flask

RUN addgroup -S dash && adduser -S dash -G dash
USER dash

WORKDIR /app
COPY --chown=dash:dash . .

EXPOSE 8080
ENTRYPOINT ["python", "app.py"]
