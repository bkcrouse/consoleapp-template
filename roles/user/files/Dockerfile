#FROM mcr.microsoft.com/dotnet/core/runtime:3.1
FROM mcr.microsoft.com/dotnet/runtime

RUN apt-get update -y && \
	apt-get install usbutils -y && \
	apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /trax
ENTRYPOINT [ "dotnet", "TRAX.Console.dll" ]
