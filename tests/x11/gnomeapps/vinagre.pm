# SUSE's openQA tests
#
# Copyright © 2017 SUSE LLC
#
# Copying and distribution of this file, with or without modification,
# are permitted in any medium without royalty provided the copyright
# notice and this notice are preserved.  This file is offered as-is,
# without any warranty.

# Summary: GNOME Weather - Minimal Test
# Maintainer: Dominique Leuenberger <dimstar@suse.de>>

use base "x11test";
use strict;
use testapi;
use utils;

sub run() {
    assert_gui_app('vinagre');
}

1;
# vim: set sw=4 et:
