FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive

# Install dependencies
RUN \
	apt-get update
	apt-get install -y --no-install-recommends \
		curl \
		mono-complete \
		unzip \
		wget

# Run Nitrox
COPY ./install-nitrox.sh /software/scripts/install-nitrox.sh
COPY ./run-nitrox.sh /software/scripts/run-nitrox.sh
COPY ./setup-timezone.sh /software/scripts/setup-timezone.sh
COPY ./setup-user.sh /software/scripts/setup-user.sh
CMD \
	/software/scripts/setup-timezone.sh \
	&& /software/scripts/setup-user.sh \
	&& /software/scripts/install-nitrox.sh \
	&& /software/scripts/run-nitrox.sh
