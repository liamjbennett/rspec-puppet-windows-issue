require 'rake'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = "--colour -f d"
  t.pattern = 'spec/*/*_spec.rb'
end


desc "puppet master --compile the windows role works"
task :master do
  sh "
    puppet master \
      --compile  'foo' \
      --confdir . \
      --manifest spec/fixtures/manifests/site.pp \
      --modulepath spec/fixtures/modules
  "
end
