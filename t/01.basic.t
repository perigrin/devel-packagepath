use strict;
use Test::More qw(no_plan);

use Devel::PackagePath;

ok( my $path = Devel::PackagePath->new( package => 'Foo::Bar::Baz' ),
    'Create a path object' );
is( $path->path, 'Foo/Bar' );
ok( $path->create );
ok( -e 'Foo' );
ok( -e 'Foo/Bar' );

# XXX: We should figure out a safe way to do a remove inside
#      the package
ok( $path->directory->rmtree );
ok( $path->directory->parent->remove );
ok( !-e 'Foo/Bar' );
ok( !-e 'Foo' );
