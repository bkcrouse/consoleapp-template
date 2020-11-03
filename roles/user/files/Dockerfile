FROM mcr.microsoft.com/dotnet/core/runtime:3.1

RUN apt-get update -y && \
	apt-get install usbutils -y

WORKDIR /trax
ENTRYPOINT [ "dotnet", "TRAX.Console.dll" ]
