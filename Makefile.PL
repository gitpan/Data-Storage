
use strict;
use warnings;

 BEGIN { require 5.008; } 

use ExtUtils::MakeMaker 6.11;



my %WriteMakefileArgs = (
                       'test' => {
                                   'TESTS' => 't/*.t'
                                 },
                       'NAME' => 'Data::Storage',
                       'DISTNAME' => 'Data-Storage',
                       'CONFIGURE_REQUIRES' => {
                                                 'ExtUtils::MakeMaker' => '6.11'
                                               },
                       'AUTHOR' => 'Marcel Gruenauer <marcel@cpan.org>',
                       'BUILD_REQUIRES' => {},
                       'ABSTRACT' => 'Base class for storages',
                       'EXE_FILES' => [],
                       'VERSION' => '1.100850',
                       'PREREQ_PM' => {
                                        'Scalar::Util' => '0',
                                        'Data::Miscellany' => '0',
                                        'Error::Hierarchy::Util' => '0',
                                        'Error::Hierarchy::Internal::DBI' => '0',
                                        'Error' => '0',
                                        'Class::Accessor::Constructor' => '0',
                                        'File::Find' => '0',
                                        'Class::Null' => '0',
                                        'Error::Hierarchy' => '0',
                                        'DBI' => '0',
                                        'Class::Accessor::Complex' => '0',
                                        'English' => '0',
                                        'parent' => '0',
                                        'constant' => '0',
                                        'Carp' => '0',
                                        'Test::More' => '0.88',
                                        'File::Temp' => '0'
                                      },
                       'LICENSE' => 'perl'
                     );


delete $WriteMakefileArgs{LICENSE}
  unless eval { ExtUtils::MakeMaker->VERSION(6.31) };

WriteMakefile(%WriteMakefileArgs);



