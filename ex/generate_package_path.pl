#!/usr/bin/env perl -l
package App::GeneratePackagePath;
use Moose;

extends qw(Devel::GeneratePackagePath);
with qw(MooseX::Getopt);

sub run {
    my ($cmd) = ( @{ $_[0]->extra_argv }, 'get_path' );
    print $_[0]->$cmd;
}
__PACKAGE__->new_with_options->run;
