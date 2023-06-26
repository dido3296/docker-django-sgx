FROM enclaive/gramine-os:jammy-7e9d6925


RUN apt-get update \
    && apt-get install -y  wget build-essential python3 python3-pip\
    && rm -rf /var/lib/apt/lists/*

ENV PYTHONBUFFERED=1

WORKDIR /app

COPY ./django_project /app/
COPY ./requirements.txt /app/requirements.txt
COPY ./input.txt /app/input.txt
COPY ./app.manifest.template ./entrypoint.sh /app/

RUN pip install -r requirements.txt

RUN gramine-argv-serializer "/usr/bin/python3" "/app/manage.py" "runserver" "0.0.0.0:8000" > args.txt &&\
    gramine-manifest -Darch_libdir=/lib/x86_64-linux-gnu app.manifest.template app.manifest &&\
    gramine-sgx-sign --key "$SGX_SIGNER_KEY" --manifest app.manifest --output app.manifest.sgx


EXPOSE 8000

RUN chmod +x entrypoint.sh
ENTRYPOINT [ "/app/entrypoint.sh" ]