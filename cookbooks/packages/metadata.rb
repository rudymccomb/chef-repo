name 'packages'
maintainer 'Franco Catena'
maintainer_email 'francocatena@gmail.com'
license 'mit'
description 'Installs/Configures the system base packages'
long_description 'Installs/Configures the system base packages'
version '0.1.0'

%w(apt yum yum-epel build-essential git nodejs ntp vim).each do |cookbook|
  depends cookbook
end

# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
# issues_url 'https://github.com/<insert_org_here>/packages/issues' if respond_to?(:issues_url)

# The `source_url` points to the development reposiory for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
# source_url 'https://github.com/<insert_org_here>/packages' if respond_to?(:source_url)
