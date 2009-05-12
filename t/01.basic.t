use strict;
use Test::More tests => 10;

use Devel::PackagePath;

ok(
    my $path = Devel::PackagePath->new( package => 'Foo::Bar::Baz' ),
    'Create a path object'
);
is( $path->path, 'Foo/Bar', 'got the right path' );
ok( $path->create, 'create Foo/Bar' );
ok( -e 'Foo',      'Foo exists' );
ok( -e 'Foo/Bar',  'Foo/Bar exists' );

# XXX: We should figure out a safe way to do a remove inside
#      the package
ok( $path->directory->rmtree, 'able to rmtree' );
ok( $path->directory->parent->remove, 'able to remote the parent' );
ok( !-e 'Foo/Bar', 'Foo/Bar is gone' );
ok( !-e 'Foo',     'Foo is gone' );

is( $path->file_name, 'Baz.pm', 'got the right file name' );
