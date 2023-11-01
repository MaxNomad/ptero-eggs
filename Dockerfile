FROM jwigley/alpine-node-git-yarn:node-18

RUN apk --update --no-cache add curl ca-certificates nginx

RUN echo "UTC" > /etc/timezone

# Installing bash
RUN apk add bash

USER container
ENV  USER container
ENV HOME /home/container

WORKDIR /home/container
COPY ./entrypoint.sh /entrypoint.sh


CMD ["/bin/ash", "/entrypoint.sh"]
