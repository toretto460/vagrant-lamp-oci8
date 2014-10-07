name              "vagrant_main"
maintainer        "Kataskopeo"
maintainer_email  "s.dimaulo@kataskopeo.com"
license           "MIT"
description       "Enable aliased virtualhosts"
version           "0.1"

depends "apache2"

%w{ debian ubuntu centos redhat fedora scientific amazon }.each do |os|
  supports os
end

recipe "vagrant_main", "Enable aliased Vhosts"