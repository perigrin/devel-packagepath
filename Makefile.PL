# Load the Module::Install bundled in ./inc/
use inc::Module::Install;

# Define metadata
name 'Devel-GeneratePackagePath';
all_from 'lib/Devel/GeneratePackagePath.pm';

# Specific dependencies
requires 'Moose'                      => '0.60';
requires 'MooseX::Types::Path::Class' => undef;

build_requires 'Test::More' => '0.42';

no_index 'directory' => 'ex';

auto_install;
WriteAll;
