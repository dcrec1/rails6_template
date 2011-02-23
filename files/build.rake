task :clean do
  system "rm rerun.txt"
end

task :build => [:clean, 'db:migrate', :spec, 'spec:javascripts', :cucumber, 'metrics:all']
