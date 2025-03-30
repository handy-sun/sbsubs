FROM ghcr.io/astral-sh/uv:python3.12-alpine

ENV PUID=0 PGID=0 TZ=Asia/Shanghai

COPY . /app

WORKDIR /app

VOLUME "/app/data"

RUN useradd -ms /bin/bash dev

RUN uv sync --frozen &&\  
  useradd -ms /bin/bash dev &&\
  chmod +x ./entrypoint.sh &&\
  ./entrypoint.sh -v

ENTRYPOINT [ "./entrypoint.sh" ]
