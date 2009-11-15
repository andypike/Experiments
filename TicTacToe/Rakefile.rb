require 'rake'
require 'spec/rake/spectask'

Spec::Rake::SpecTask.new(:spec) do |t|
  t.spec_files = FileList['*_spec.rb']
  t.verbose = true
end

task :default  => :spec
