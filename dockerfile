# Use a base .NET SDK image
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build

# Install Git
RUN apt-get update && apt-get install -y git

# Clone UnityCodeSmellAnalyzer repository and build it
RUN git clone https://github.com/MatteoBosco89/UnityCodeSmellAnalyzer.git && \
    cd UnityCodeSmellAnalyzer && \
    dotnet build

# Set the working directory to the root of the repository
WORKDIR /github/workspace

# Entry point for the action
ENTRYPOINT ["bash", "/UnityCodeSmellAnalyzer/run.sh"]
