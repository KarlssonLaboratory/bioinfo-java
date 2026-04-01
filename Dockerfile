FROM eclipse-temurin:21-jre-jammy

LABEL maintainer="andreyhgl"
LABEL description="bioinformatic java container"
LABEL org.opencontainers.image.source="https://github.com/KarlssonLaboratory/bioinfo-java"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
  wget \
  unzip \
  tabix \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /data

CMD ["/bin/bash"]