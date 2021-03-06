FROM python:3.6-jessie

WORKDIR /cheeseshop

ADD . /cheeseshop

RUN make prep-dev

RUN apt-get update && apt-get install -y git gettext-base
RUN pip install .

EXPOSE 9980

CMD ["/bin/bash", "-c", "envsubst < /cheeseshop/conf/config_template.yaml > /cheeseshop-config.yaml && cheeseshop-webapp /cheeseshop-config.yaml"]
