name "ansible-dk-cli"
default_version "0.1.0" # This is just to silence a warning
description "generic CLI tool for ansible-dk"

dependency 'click'
dependency 'ansible-dk-generators'

build do
  copy Dir.pwd + "/ansible-dk-cli/ansible-dk", "#{install_dir}/embedded/bin"
  copy Dir.pwd + "/ansible-dk-cli/ansible-dk", "#{install_dir}/bin"
end
