package File::Trash::EmptyFiles::Undoable;

# AUTHORITY
# DATE
# DIST
# VERSION

use 5.010001;
use strict;
use warnings;
use Log::ger;

our %SPEC;

$SPEC{':package'} = {
    v => 1.1,
    summary => 'Trash all empty files in the current directory tree, with undo/redo capability',
    description => <<'_',

This is the undoable version of <pm:App::FileRemoveUtils>
`delete_all_empty_files`. The CLI is <prog:trash-all-empty-files-u>.

_
};

$SPEC{trash_all_empty_files} = {
    v => 1.1,
    summary => 'Trash all empty (zero-sized) files in the current '.
        'directory tree, with undo support',
    args => {
    },
    features => {
        tx => {v=>2},
        idempotent => 1,
    },
};
sub trash_all_empty_files {
    require App::FileRemoveUtils;
    require File::Trash::Undoable;

    my %args = @_;

    my $files = App::FileRemoveUtils::list_all_empty_files();

    File::Trash::Undoable::trash_files(
        %args,
        files => $files,
    );
}

1;
# ABSTRACT:

=head1 SYNOPSIS

 # use the trash-all-empty-files-u script


=head1 DESCRIPTION

This module provides routines to trash all empty files in the current directory
tree, with undo/redo support. Actual trashing/untrashing is provided by
L<File::Trash::Undoable>.


=head1 SEE ALSO

L<File::Trash::Undoable> and L<trash-u>.

=cut
