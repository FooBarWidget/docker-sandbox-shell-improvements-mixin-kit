FROM scratch

COPY resources/ /usr/local/share/shell-improvement/

ENV EDITOR=nano

# Fixes bash UTF-8 prompt line wrapping issues due to missing locale settings
ENV LANG=C.UTF-8
ENV LC_CTYPE=C.UTF-8
