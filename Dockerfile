FROM mcr.microsoft.com/dotnet/runtime:9.0

ENV DEBIAN_FRONTEND noninteractive

# Install dependencies
RUN \
	apt-get update && \
	apt-get install -y --no-install-recommends \
		curl \
		unzip \
		wget

# Run Nitrox
COPY ./install-nitrox.sh /scripts/install-nitrox.sh
COPY ./run-nitrox.sh /scripts/run-nitrox.sh
COPY ./setup-timezone.sh /scripts/setup-timezone.sh
COPY ./setup-user.sh /scripts/setup-user.sh
CMD \
	/scripts/setup-timezone.sh \
	&& /scripts/setup-user.sh \
	&& /scripts/install-nitrox.sh \
	&& /scripts/run-nitrox.sh
