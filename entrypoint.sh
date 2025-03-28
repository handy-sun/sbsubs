#!/bin/bash
if [[ "$1" = "-v" ]]; then
    echo 0.1.0
else
    chown -R ${PUID}:${PGID} /app
    python api/app.py
fi