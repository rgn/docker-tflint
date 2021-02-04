# docker-tflint

Container to utilize tflint.

``` bash
docker run -it --rm tvdgnr/tflint --version
TFLint version 0.24.1
```

To lint your code add a volume.

``` bash
docker run -it --rm -v $(pwd):/src tvdgnr/tflint --version
```

``` bash
docker run -it --rm tvdgnr/tflint --help
Usage:
  tflint [OPTIONS] [FILE or DIR...]

Application Options:
  -v, --version                                   Print TFLint version
      --langserver                                Start language server
  -f, --format=[default|json|checkstyle|junit]    Output format (default: default)
  -c, --config=FILE                               Config file name (default: .tflint.hcl)
      --ignore-module=SOURCE                      Ignore module sources
      --enable-rule=RULE_NAME                     Enable rules from the command line
      --disable-rule=RULE_NAME                    Disable rules from the command line
      --only=RULE_NAME                            Enable only this rule, disabling all other defaults. Can be specified multiple times
      --var-file=FILE                             Terraform variable file name
      --var='foo=bar'                             Set a Terraform variable
      --module                                    Inspect modules
      --force                                     Return zero exit status even if issues found
      --no-color                                  Disable colorized output
      --loglevel=[trace|debug|info|warn|error]    Change the loglevel (default: none)

Help Options:
  -h, --help                                      Show this help message
```

You are able to pass any parameter from tflint to the container to customize the behavior.

## Extensions

This container includes the extensions for Amazon Web Services, Microsoft Azure and Google Cloud Platform.

If you want include these during liniting please provide a .tflint.hcl configuration.

**Amazon Web Services**
``` hcl
plugin "aws" {
    enabled = true
}
```

**Microsoft Azure**
``` hcl
plugin "azurerm" {
    enabled = true
}
```

**Google Cloud Platform**
``` hcl
plugin "google" {
    enabled = true
}
```
