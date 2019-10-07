FROM python:3.7-alpine3.10 AS builder

WORKDIR /src
ADD . /src
RUN python setup.py sdist

FROM python:3.7-alpine3.10

ARG GRAFFITI_MONKEY_VERSION
ARG GRAFFITI_MONKEY_PACKAGE="graffiti_monkey-${GRAFFITI_MONKEY_VERSION}.tar.gz"

COPY --from=builder /src/dist /tmp
RUN pip install /tmp/${GRAFFITI_MONKEY_PACKAGE}

CMD ["/bin/sh"]
