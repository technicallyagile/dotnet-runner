FROM microsoft/dotnet:1.1.0-sdk-msbuild-rc4
MAINTAINER CodinGame <coders@codingame.com>
COPY run.sh /
COPY build /project/

ENTRYPOINT ["/run.sh"]
