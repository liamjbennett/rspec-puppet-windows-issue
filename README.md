

# what?


when using rspec-puppet to  test a class intended to be used on windows with a File resource 
on linux or osx,  it fails catalog compilation complaining that the path of the file resource
is not absolute.

how do we test these catalogs still compile on a system that isn't windows?
our puppet master runs on linux,  it doesn't fail compilation. so there must be
a way.

this project is a simple project to demonstrate the issue.   try it. 

    bundle
    bundle exec rake spec


# example failure:


    windows
      should compile into a catalogue without dependency cycles (FAILED - 1)

    Failures:

      1) windows should compile into a catalogue without dependency cycles
	Failure/Error: it { should compile }
	  error during compilation: Parameter path failed on File[foo]: File paths must be fully qualifi
    ed, not 'C:\foo.txt' at /Users/fess/check/rspec-puppet-windows-issue/spec/fixtures/modules/windows/ma
    nifests/init.pp:8
	# ./spec/classes/windows_spec.rb:5:in lock (2 levels) in <top (required)>'

    Finished in 0.06575 seconds
    1 example, 1 failure

    Failed examples:

    rspec ./spec/classes/windows_spec.rb:5 # windows should compile into a catalogue without dependency c
    ycles
    /opt/boxen/rbenv/versions/1.9.3-p484/bin/ruby -S rspec spec/classes/windows_spec.rb --colour -f d fai
    led

# a mitigation

Add this bit of code to your tests and the fully qualified path validation will use Windows rules instead
of the host OS. You've also got to disable autosign, because by default it's set to the path to `autosign.conf`
that's proper for the host platform--which is a Linux path, not a Windows path.

    # fake out the file checks so that they validate as absolute even though they're Windows paths
    before :each do
      Puppet[:autosign] = false
      Puppet::Util::Platform.stubs(:windows?).returns true
    end
