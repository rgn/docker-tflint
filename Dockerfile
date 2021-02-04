FROM alpine:3.12

LABEL maintainer=ralf.gnaedinger-tflint@gmail.com

RUN apk add --no-cache ca-certificates curl bash unzip \
    && mkdir -p /tmp/setup \
    && cd /tmp/setup \
    && wget https://releases.hashicorp.com/terraform/0.14.5/terraform_0.14.5_linux_amd64.zip \
    && unzip terraform_0.14.5_linux_amd64.zip \
    && mv terraform /usr/local/bin \
    && ln -s /usr/local/bin/terraform /usr/local/bin/tf \
    && wget https://github.com/terraform-linters/tflint/releases/download/v0.24.1/tflint_linux_amd64.zip \
    && unzip tflint_linux_amd64.zip \
    && mv tflint /usr/local/bin \
    && mkdir -p ~/.tflint.d/plugins \
    && wget https://github.com/terraform-linters/tflint-ruleset-aws/releases/download/v0.2.1/tflint-ruleset-aws_linux_amd64.zip \
    && unzip tflint-ruleset-aws_linux_amd64.zip \
    && mv tflint-ruleset-aws ~/.tflint.d/plugins \
    && wget https://github.com/terraform-linters/tflint-ruleset-azurerm/releases/download/v0.8.2/tflint-ruleset-azurerm_linux_amd64.zip \
    && unzip tflint-ruleset-azurerm_linux_amd64.zip \        
    && mv tflint-ruleset-azurerm ~/.tflint.d/plugins \
    && wget https://github.com/terraform-linters/tflint-ruleset-google/releases/download/v0.5.1/tflint-ruleset-google_linux_amd64.zip \
    && unzip tflint-ruleset-google_linux_amd64.zip \        
    && mv tflint-ruleset-google ~/.tflint.d/plugins \    
    && cd / \
    && rm -rf /tmp/setup

WORKDIR /src