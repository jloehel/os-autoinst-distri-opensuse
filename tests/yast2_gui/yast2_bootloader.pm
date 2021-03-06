# SUSE's openQA tests
#
# Copyright © 2009-2013 Bernhard M. Wiedemann
# Copyright © 2012-2016 SUSE LLC
#
# Copying and distribution of this file, with or without modification,
# are permitted in any medium without royalty provided the copyright
# notice and this notice are preserved.  This file is offered as-is,
# without any warranty.

# Summary: YaST2 UI test bootloader checks boot code option, kernel parameters,
#	graphical console, bootloader option, foreign OS and protect boot loader
#    Make sure those yast2 modules can opened properly. We can add more
#    feature test against each module later, it is ensure it will not crashed
#    while launching atm.
# Maintainer: Zaoliang Luo <zluo@suse.com>

use base "y2x11test";
use strict;
use testapi;

sub run() {
    my $self   = shift;
    my $module = "bootloader";

    $self->launch_yast2_module_x11($module);
    assert_screen "yast2-$module-ui", 120;

    #	boot code options
    assert_and_click 'yast2-bootloader_grub2';
    assert_and_click 'yast2-bootloader_not-managed';
    send_key 'alt-c';

    #	kernel parameters and use graphical console
    wait_still_screen 3;
    assert_and_click 'yast2-bootloader_kernel-parameters';
    send_key 'alt-p';
    send_key 'end';
    assert_screen 'yast2-bootloader_use-graphical-console';

    #	bootloader options and set probe foreign OS, timeout
    assert_and_click 'yast2-bootloader_bootloader-options';
    send_key 'alt-b';
    wait_still_screen 3;
    send_key 'alt-t';
    type_string '16';

    #	default boot section
    assert_and_click 'yast2-bootloader_default-boot-section';
    assert_screen 'yast2-bootloader_defautl-boot-section_tw';

    #	proctect boot loader with password
    assert_and_click 'yast2-bootloader_protect-bootloader-with-password';
    send_key 'alt-p';
    type_string 'dummy-password';
    send_key 'alt-y';
    type_string 'dummy-password';
    wait_still_screen 3;

    # OK => Exit
    send_key "alt-o";
    assert_screen 'generic-desktop', 600;
}

1;
# vim: set sw=4 et:
