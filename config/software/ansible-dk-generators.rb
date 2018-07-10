name "ansible-dk-generators"
default_version "0.1.0" # This is just to silence a warning
description "a set of generic playbooks for the ansible-dk generator"

build do
  copy Dir.pwd + "/generators", "#{install_dir}/"
end
