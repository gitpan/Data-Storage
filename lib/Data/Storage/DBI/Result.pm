use 5.008;
use strict;
use warnings;

package Data::Storage::DBI::Result;
BEGIN {
  $Data::Storage::DBI::Result::VERSION = '1.102250';
}
# ABSTRACT: Base class for DBI query results
use DBI ':sql_types';
use Error::Hierarchy::Util 'assert_defined';
use parent 'Class::Accessor::Complex';
__PACKAGE__
    ->mk_new
    ->mk_scalar_accessors(qw(sth result));

sub fetch {
    my $self = shift;
    assert_defined $self->sth, 'called without set statement handle.';
    $self->sth->fetch;
}

sub finish {
    my $self = shift;
    assert_defined $self->sth, 'called without set statement handle.';
    $self->sth->finish;
}

sub rows {
    my $self = shift;
    assert_defined $self->sth, 'called without set statement handle.';
    $self->sth->rows;
}
1;


__END__
=pod

=head1 VERSION

version 1.102250

=head1 METHODS

=head2 fetch

FIXME

=head2 finish

FIXME

=head2 rows

FIXME

=head1 INSTALLATION

See perlmodinstall for information and options on installing Perl modules.

=head1 BUGS AND LIMITATIONS

No bugs have been reported.

Please report any bugs or feature requests through the web interface at
L<http://rt.cpan.org>.

=head1 AVAILABILITY

The latest version of this module is available from the Comprehensive Perl
Archive Network (CPAN). Visit L<http://www.perl.com/CPAN/> to find a CPAN
site near you, or see
L<http://search.cpan.org/dist/Data-Storage/>.

The development version lives at
L<http://github.com/hanekomu/Data-Storage/>.
Instead of sending patches, please fork this project using the standard git
and github infrastructure.

=head1 AUTHOR

Marcel Gruenauer <marcel@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2004 by Marcel Gruenauer.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

