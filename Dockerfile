FROM python:3.11-slim

RUN useradd -ms /bin/bash dev

COPY ./ /app
WORKDIR /app

RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

VOLUME ["/app/data"]

EXPOSE 5000

RUN chmod +x ./entrypoint.sh && \
    ./entrypoint.sh -v

ENV PUID=0 PGID=0 TZ=Asia/Shanghai

CMD [ "./entrypoint.sh" ]