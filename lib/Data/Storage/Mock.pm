package Data::Storage::Mock;

# $Id: Mock.pm 13653 2007-10-22 09:11:20Z gr $

use strict;
use warnings;


our $VERSION = '0.05';


use base qw(Data::Storage Class::Accessor::Complex);


__PACKAGE__->mk_scalar_accessors(qw(should_die_on_connect));


sub connect {
    my $self = shift;
    $self->die_on_connect if $self->should_die_on_connect;
}


sub die_on_connect {
    my $self = shift;
    throw Error::Hierarchy::Internal::CustomMessage(custom_message =>
        "can't connect",
    );
}


sub disconnect {
    my $self = shift;
    return unless $self->is_connected;
    $self->rollback_mode ? $self->rollback : $self->commit;
}


sub is_connected { 1 }


sub rollback {}
sub commit   {}


1;


__END__



=head1 NAME

Data::Storage::Mock - generic abstract storage mechanism

=head1 SYNOPSIS

    Data::Storage::Mock->new;

=head1 DESCRIPTION

None yet. This is an early release; fully functional, but undocumented. The
next release will have more documentation.

Data::Storage::Mock inherits from L<Data::Storage>.

The superclass L<Data::Storage> defines these methods and functions:

    new(), DEFAULTS(), clear_log(), clear_rollback_mode(), create(), id(),
    initialize_data(), is_abstract(), lazy_connect(), log(), log_clear(),
    rollback_mode(), rollback_mode_clear(), rollback_mode_set(),
    set_rollback_mode(), setup(), signature(), test_setup()

The superclass L<Class::Accessor::Complex> defines these methods and
functions:

    carp(), cluck(), croak(), flatten(), mk_abstract_accessors(),
    mk_array_accessors(), mk_boolean_accessors(),
    mk_class_array_accessors(), mk_class_hash_accessors(),
    mk_class_scalar_accessors(), mk_concat_accessors(),
    mk_forward_accessors(), mk_hash_accessors(), mk_integer_accessors(),
    mk_new(), mk_object_accessors(), mk_scalar_accessors(),
    mk_set_accessors(), mk_singleton()

The superclass L<Class::Accessor> defines these methods and functions:

    _carp(), _croak(), _mk_accessors(), accessor_name_for(),
    best_practice_accessor_name_for(), best_practice_mutator_name_for(),
    follow_best_practice(), get(), make_accessor(), make_ro_accessor(),
    make_wo_accessor(), mk_accessors(), mk_ro_accessors(),
    mk_wo_accessors(), mutator_name_for(), set()

The superclass L<Class::Accessor::Installer> defines these methods and
functions:

    install_accessor(), subname()

=head1 METHODS

=over 4

=item clear_should_die_on_connect

    $obj->clear_should_die_on_connect;

Clears the value.

=item should_die_on_connect

    my $value = $obj->should_die_on_connect;
    $obj->should_die_on_connect($value);

A basic getter/setter method. If called without an argument, it returns the
value. If called with a single argument, it sets the value.

=item should_die_on_connect_clear

    $obj->should_die_on_connect_clear;

Clears the value.

=back

=head1 TAGS

If you talk about this module in blogs, on del.icio.us or anywhere else,
please use the C<datastorage> tag.

=head1 VERSION 
                   
This document describes version 0.05 of L<Data::Storage::Mock>.

=head1 BUGS AND LIMITATIONS

No bugs have been reported.

Please report any bugs or feature requests to
C<<bug-data-storage@rt.cpan.org>>, or through the web interface at
L<http://rt.cpan.org>.

=head1 INSTALLATION

See perlmodinstall for information and options on installing Perl modules.

=head1 AVAILABILITY

The latest version of this module is available from the Comprehensive Perl
Archive Network (CPAN). Visit <http://www.perl.com/CPAN/> to find a CPAN
site near you. Or see <http://www.perl.com/CPAN/authors/id/M/MA/MARCEL/>.

=head1 AUTHOR

Marcel GrE<uuml>nauer, C<< <marcel@cpan.org> >>

=head1 COPYRIGHT AND LICENSE

Copyright 2004-2007 by Marcel GrE<uuml>nauer

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.


=cut

