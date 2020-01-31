FROM hashicorp/terraform:0.12.20
RUN apk add --no-cache bash git jq grep
RUN apk -v --update add \
        python \
        py-pip \
        groff \
        less \
        mailcap \
        ruby \
        npm \
        && \
    pip install --upgrade awscli==1.16.200 s3cmd==2.0.1 python-magic && \
    apk -v --purge del py-pip && \
    rm /var/cache/apk/*
ADD https://github.com/gruntwork-io/terragrunt/releases/download/v0.21.7/terragrunt_linux_amd64 /usr/local/bin/terragrunt
RUN chmod +x /usr/local/bin/terragrunt
ENTRYPOINT ["/usr/local/bin/terragrunt"]
