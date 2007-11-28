package Data::Storage::DBI::SQLite;

# $Id: SQLite.pm 9190 2005-06-14 14:47:46Z gr $

use strict;
use warnings;


our $VERSION = '0.05';


use base 'Data::Storage::DBI';


sub connect_string {
    my $self = shift;
    sprintf("dbi:SQLite:dbname=%s", $self->dbname);
}


# Prepare a test database; unlink the existing database and recreate it with
# the initial data. This method is called at the beginning of test programs.
# The functionality implemented here is specific to SQLite, as that's probably
# only going to be used for tests. If you're testing against Oracle databases
# where setup is going to take a lot more steps than unlinking and recreating,
# you might want to prepare a test database beforehand and leave this method
# empty, so the same database is reused for many tests.

sub test_setup {
    my $self = shift;

    if (-e $self->dbname) {
        unlink $self->dbname or
            throw Error::Hierarchy::Internal::CustomMessage(custom_message =>
                sprintf "can't unlink %s: %s\n", $self->dbname, $!
            );
    }

    $self->connect;
    $self->setup;
}


sub last_id {
    my $self = shift;
    $self->dbh->func('last_insert_rowid');
}


1;


__END__



=head1 NAME

Data::Storage::DBI::SQLite - generic abstract storage mechanism

=head1 SYNOPSIS

    Data::Storage::DBI::SQLite->new;

=head1 DESCRIPTION

None yet. This is an early release; fully functional, but undocumented. The
next release will have more documentation.

Data::Storage::DBI::SQLite inherits from L<Data::Storage::DBI>.

The superclass L<Data::Storage::DBI> defines these methods and functions:

    AutoCommit(), AutoCommit_clear(), DEFAULTS(), HandleError(),
    HandleError_clear(), LongReadLen(), LongReadLen_clear(), PrintError(),
    PrintError_clear(), RaiseError(), RaiseError_clear(), SQL_ALL_TYPES(),
    SQL_ARRAY(), SQL_ARRAY_LOCATOR(), SQL_BIGINT(), SQL_BINARY(),
    SQL_BIT(), SQL_BLOB(), SQL_BLOB_LOCATOR(), SQL_BOOLEAN(), SQL_CHAR(),
    SQL_CLOB(), SQL_CLOB_LOCATOR(), SQL_DATE(), SQL_DATETIME(),
    SQL_DECIMAL(), SQL_DOUBLE(), SQL_FLOAT(), SQL_GUID(), SQL_INTEGER(),
    SQL_INTERVAL(), SQL_INTERVAL_DAY(), SQL_INTERVAL_DAY_TO_HOUR(),
    SQL_INTERVAL_DAY_TO_MINUTE(), SQL_INTERVAL_DAY_TO_SECOND(),
    SQL_INTERVAL_HOUR(), SQL_INTERVAL_HOUR_TO_MINUTE(),
    SQL_INTERVAL_HOUR_TO_SECOND(), SQL_INTERVAL_MINUTE(),
    SQL_INTERVAL_MINUTE_TO_SECOND(), SQL_INTERVAL_MONTH(),
    SQL_INTERVAL_SECOND(), SQL_INTERVAL_YEAR(),
    SQL_INTERVAL_YEAR_TO_MONTH(), SQL_LONGVARBINARY(), SQL_LONGVARCHAR(),
    SQL_MULTISET(), SQL_MULTISET_LOCATOR(), SQL_NUMERIC(), SQL_REAL(),
    SQL_REF(), SQL_ROW(), SQL_SMALLINT(), SQL_TIME(), SQL_TIMESTAMP(),
    SQL_TINYINT(), SQL_TYPE_DATE(), SQL_TYPE_TIME(), SQL_TYPE_TIMESTAMP(),
    SQL_TYPE_TIMESTAMP_WITH_TIMEZONE(), SQL_TYPE_TIME_WITH_TIMEZONE(),
    SQL_UDT(), SQL_UDT_LOCATOR(), SQL_UNKNOWN_TYPE(), SQL_VARBINARY(),
    SQL_VARCHAR(), SQL_WCHAR(), SQL_WLONGVARCHAR(), SQL_WVARCHAR(),
    assert_defined(), clear_AutoCommit(), clear_HandleError(),
    clear_LongReadLen(), clear_PrintError(), clear_RaiseError(),
    clear_dbh(), clear_dbhost(), clear_dbname(), clear_dbpass(),
    clear_dbuser(), clear_port(), clear_schema_prefix(), commit(),
    connect(), connect_string_dbi_id(), dbh(), dbh_clear(), dbhost(),
    dbhost_clear(), dbname(), dbname_clear(), dbpass(), dbpass_clear(),
    dbuser(), dbuser_clear(), disconnect(), except(), finally(),
    get_connect_options(), is_connected(), lazy_connect(), otherwise(),
    port(), port_clear(), prepare(), rewrite_query(),
    rewrite_query_for_dbd(), rollback(), schema_prefix(),
    schema_prefix_clear(), signature(), try(), with()

The superclass L<Data::Storage> defines these methods and functions:

    new(), clear_log(), clear_rollback_mode(), create(), id(),
    initialize_data(), is_abstract(), log(), log_clear(), rollback_mode(),
    rollback_mode_clear(), rollback_mode_set(), set_rollback_mode(),
    setup()

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



=back

=head1 TAGS

If you talk about this module in blogs, on del.icio.us or anywhere else,
please use the C<datastorage> tag.

=head1 VERSION 
                   
This document describes version 0.05 of L<Data::Storage::DBI::SQLite>.

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

