name "ansible-dk"
maintainer "OmniTI"
homepage "https://github.com/omniti-labs/ansible-dk"

# Defaults to C:/ansible-dk on Windows
# and /opt/ansible-dk on all other platforms
install_dir "#{default_root}/#{name}"

build_version Omnibus::BuildVersion.semver
build_iteration 1

# Version pinning.  Most of the software definitons have a
# default_version of "master" (ie, floating on latest)
override :ruby,              version: "2.1.7"
override :bundler,           version: "1.10.6"
override :rubygems,          version: "2.4.8"
override :'test-kitchen',    version: "v1.4.2"
override :'kitchen-ansible', version: "0.0.30"
override :'kitchen-vagrant', version: "v0.19.0"
override :'kitchen-ec2',     version: "v0.10.0"
override :awscli,            version: "1.9.5"
override :jq,                version: "jq-1.5"
override :ansible,           version: "1.9.4"
override :paramiko,          version: "1.16.0"
override :pycrypto,          version: "2.6.1"
override :'ansible-lint',    version: "2.1.3"
override :'ansible-toolkit', version: "1.3.2"
override :appbundler,        version: "0.6.0"
override :serverspec,        version: "v2.24.2"
override :testinfra,         version: "1.0.0.0a17"
override :molecule,          version: "1.0.6"

# Creates required build directories
dependency "preparation"

# ansible-dk dependencies/components

# Python land
dependency "python"
dependency "pip"
dependency "ansible-dk-cli"
dependency "awscli"
dependency "ansible"
dependency "ansible-lint"
dependency "ansible-toolkit"
dependency "testinfra"
dependency "molecule"

# Ruby land
dependency "ruby"
dependency "rubygems"
dependency "bundler"
dependency "appbundler"
dependency "test-kitchen"
dependency "kitchen-ansible"
dependency "kitchen-vagrant"
dependency "kitchen-ec2"
dependency "serverspec"

# Others
dependency "jq"

# Version manifest file
dependency "version-manifest"

exclude "**/.git"
exclude "**/bundler/git"

package :pkg do
  identifier 'com.omniti.labs.ansible-dk'
end

compress :dmg
