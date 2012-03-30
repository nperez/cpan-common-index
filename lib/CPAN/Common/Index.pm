package CPAN::Common::Index;
use warnings;
use strict;

use Carp 'confess';

#ABSTRACT: A common API for accessing indices

=method_public find_package

find_package takes the name of a package and returns an array reference of a single data structure that contains the meta information of that package. See L</DATA STRUCTURE> for details on the return value of this method.

=cut

sub find_package {
    confess 'find_package needs to be implemented by a subclass';
}

=method_public search_packages

search_packages takes a named list of arguments that searches the index and returns an array reference of structures that match the parameters provided. Currently supports the following named arguments:

    name: name can be either a string or a regex. If it is a string, it will do an exact search for the name of the package. If it is a regex, it will apply that regex to the index and return those results that match

See L</DATA STRUCTURE> for details on the return value of this method.

=cut

sub search_packages {
    confess 'search_packages needs to be implemented by a subclass';
}

1;
__END__
=head1 DESCRIPTION


=head1 DATA STRUCTURE
CPAN::Common::Index guarantees that the returned data structures from either L</find_package> or L</search_packages> is consistent. In fact, they are the same data structure, but with L</search_packages> simply returning more elements in the top level array. Below is an example of the data structure as returned by both methods:

    [
        {
            name => 'Foo::Bar',
            userid => 'CPANID',
            file => 'Foo-Bar-1.23.tar.gz',
            version => '1.23',
        },
        { ... },
    ]

=cut
