mkdir $HOME/tanzu

tar -xvf $HOME/downloads/tanzu-framework-linux-amd64.tar -C $HOME/tanzu

export TANZU_CLI_NO_INIT=true


# Install the CLI core by running
 CD $HOME/tanzu

 sudo install cli/core/v0.11.1/tanzu-core-linux_amd64 /usr/local/bin/tanzu