FROM alpine:3 AS downloader
ARG DOWNLOAD_URL="https://github.com/nopSolutions/nopCommerce/releases/download/release-4.60.5/nopCommerce_4.60.5_NoSource_linux_x64.zip"
ADD ${DOWNLOAD_URL} /nopCommerce/nopCommerce_4.60.5_NoSource_linux_x64.zip
RUN apk update && \
    apk add unzip && \
    cd /nopCommerce && \
    unzip nopCommerce_4.60.5_NoSource_linux_x64.zip && \
    mkdir bin logs && \
    rm nopCommerce_4.60.5_NoSource_linux_x64.zip


FROM mcr.microsoft.com/dotnet/sdk:8.0-alpine3.18
LABEL app=".NET application"
COPY --from=downloader /nopCommerce /nopCommerce
ENV ASPNETCORE_URLS="http://0.0.0.0:5000"
ARG USERNAME='nop'
ARG HOMEDIR='/nopCommerce'
RUN adduser -h ${HOMEDIR} -s /bin/sh -D ${USERNAME}
USER ${USERNAME}
WORKDIR ${HOMEDIR}
EXPOSE 5000
CMD [ "dotnet", "Nop.Web.dll" ]