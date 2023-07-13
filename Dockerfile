FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive

# Install dependencies
RUN \
	apt-get update && \
	apt-get install -y --no-install-recommends \
		curl \
		mono-complete \
		unzip \
		wget

# Run Nitrox
COPY ./install-nitrox.sh /config/scripts/install-nitrox.sh
COPY ./run-nitrox.sh /config/scripts/run-nitrox.sh
COPY ./setup-timezone.sh /config/scripts/setup-timezone.sh
COPY ./setup-user.sh /config/scripts/setup-user.sh
CMD \
	/config/scripts/setup-timezone.sh \
	&& /config/scripts/setup-user.sh \
	&& /config/scripts/install-nitrox.sh \
	&& /config/scripts/run-nitrox.sh
