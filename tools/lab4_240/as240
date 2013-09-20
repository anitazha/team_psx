#!/usr/bin/perl

my $version = "1.5";

# as240.pl: Version 1.5.1
# Assembler for 18-240
# Written by Paul Kennedy <pmkenned@andrew.cmu.edu>
# Last updated 11/9/2012
#
# Version 1.5.2 Notes - 4/22/2013
#
# * Hex file is now memory.hex instead of $filename.hex
#
#
# Version 1.5.1 Notes - 11/9/2012
# =============================================================================
# * my $data = lc shift; was giving a warning when the argment was left 
#   undefined (which happens when referring to a label which is yet to be
#   defined). This error didn't seem to happen before... probably this version
#   of Perl says that undefined values are not allowed for the 'lc' function
#
# Version 1.5 Notes - 8/30/2012
# =============================================================================
# * Replaced all switch statements with if/elsif blocks
# * Commented out backwards compatability feature where 0000 would be printed
#   for untouched memory addresses until the next address multiple of 16
# * No longer creates .sim file. This was nearly identical to the .list file
#   and I am going to start using .sim for simulator scripts
#
# Version 1.4.1 Notes - 8/28/2012
# =============================================================================
# * Fixed a bug where labels more than 7 characters long would have no space
#   between it and the opcode when printed in the list and sim files
#
# Version 1.4 Notes - 7/29/2012
# =============================================================================
# * Changed behavior so that when a label is put on a line with no code, the
#   label is printed to the list file on the line with the corresponding
#   address. (Previously it did not show up in the list file at all)
#
# Version 1.3 Notes - 4/13/2012
# =============================================================================
# * Fixed minor bug caused by neglecting to comment two lines for the
#   automatic insertion of STOP instruction at the end of the code.
#
# Version 1.2 Notes - 3/26/2012
# =============================================================================
# * Added support for .equ pseudo-op
# * .equ required changing label back-subtitution approach slightly; introduced
#   a new subroutine: back_sub_label. invoked after each line which defines
#   a label (done so at the beginning of the loop)
# * Added warning message for labels on LHS of .orgs
# * Removed case-sensitive pseudo-op bug
# * Removed sim file bug (didn't print memory segments with 0000 data to align
#   the lines with addresses ending in F as was done for .list files)
#
# Version 1.1 Notes - 3/19/2012
# =============================================================================
# * Added support for addsp instruction
#
# Version 1.0 Notes - 1/3/2012
# =============================================================================
# Improvements and differences from original assembler:
# * Fixed STA bug (register field in bits [5:3] was always 0 in original)
# * Detects invalidly formed constants
# * Detects repeated label definitions
# * Detects missing operands
# * Allows for labels beginning with R
# * Allows for no whitespace before instruction
# * Allows for registers to be referred to with lowercase r
# * Does not allow "sta Rd, addr"; only allows "sta addr, Rd"
# * Does not allow labels on right-hand side of .org directives
#    (this was buggy in the original anyway; does still allow labels for .dw)
# * Improved text alignment in .list files
# * Labels are allowed on the LSH as .org now (though it generates a warning
#   since the programmer probably wants it on the next line)
#
# Additional things to note:
# * Only .hex, .list, and .sim files are generated! Not .o, .bin, or .map files
#   (if anyone has a reason to need these, please implement this functionality)
# * Does not insert STOP at end automatically -- thought original as240 did this
# * Labels are still case-sensitive
# * Weird pieces of syntax such as ,, are still allowed
#
# Things to consider implementing or changing:
# * Generating .o or .bin, as mentioned above
# * -o [FILE] flag for setting output file name.
# * Make more warning messages
# * Detect constants which are almost valid and warn e.g. $12345
#
# Known Bugs:
# If any bugs are found, please contact pmkenned@andrew.cmu.edu.

use strict;
use warnings;

# General approach:
# For each line in the assembly file, determine the hexadecimal for the line
# store this hexadecimal value in a hash keyed by address. 
# To determine the hexadecimal for a given line of source, first look up the
# instruction in a hash keyed by mneumonic. Then bitwise OR in the register
# numbers. If the instruction is long, write the constant to the next memory
# location. If a label is used, look this up in a hash keyed by label name.
# If the label has not yet been defined, take note of it and fill in this
# location later once the value of the label has been determined.
# Detect and print errors as you go along.
#
# After this process has completed, dump the result to files.

my $error_count = 0; # keeps a count of all the errors in the assembly file
my $warning_count = 0; # keeps a count of all the warnings in the assembly file
my %labels = (); # keys are label names, values are addresses which the labels correspond to
my %label_refs = (); # keys are label names, values are lists of addresses and line numbers where the label was referred to *before being defined*
my %memory = (); # keys are addresses, values are hex values in memory. This holds the assembled data.
my %sim = (); # keys are addresses, values are corresponding strings from source code

# the sum of the following two numbers is the address at which the
# instruction being processed at a given point in time will be stored
my $org = 0; # set with the .org directive
my $offset = 0; # increments as each instruction is processed

# hash of all instructions which consume only 2 bytes
# and require two register fields (Rs and Rd)
my %short2 = (
                "add" =>    0x0E00,
                "and" =>    0x1A00,
                "cmr", =>    0x4600,
                "ldr", =>    0x0800,
                "mov", =>    0x3A00,
                "or", =>    0x1C00,
                "str", =>    0x0A00,
                "sub", =>    0x1000,
                "xor", =>    0x1E00,
            );

# hash of all instructions which consume only 2 bytes
# and require one register field
my %short1 = (
                "ashr" =>    0x2600,
                "decr", =>    0x1600,
                "incr", =>    0x1400,
                "ldsp", =>    0x3C00,
                "lshl", =>    0x2000,
                "lshr", =>    0x2400,
                "neg", =>    0x1200,
                "not", =>    0x1800,
                "pop", =>    0x3400,
                "push", =>    0x3200,
                "rol", =>    0x2200,
                "stsp", =>    0x3E00,
            );

# hash of all instructions which consume only 2 bytes
# and require no register fields
my %short0 = (
                "rtn", =>    0x3800,
                "stop", =>    0x3000,
            );
# hash of all instructions which consume 4 bytes
# and require one register field
my %long1 = (
                "cmi", =>    0x4400,
                "lda", =>    0x0400,
                "ldi", =>    0x0C00,
                "ldsf", =>    0x4000,
                "sta", =>    0x0600,
                "stsf", =>    0x4200,
            );
# hash of all instructions which consume 4 bytes
# and require no register fields
my %long0 = (
                "addsp" =>    0x0f00, # added in version 1.1
                "bra" =>    0x2800,
                "brc" =>    0x4800,
                "brn", =>    0x2C00,
                "brv", =>    0x2E00,
                "brz", =>    0x2A00,
                "jsr", =>    0x3600,
            );

use constant {
    LONG => 2,
    SHORT => 1,
};

# used when printing the .list and .sim files to know which column
# to place the words in
use constant {
    LABEL => 0,
    OPCODE => 1,
    OPERAND => 2,
};

# warning message constants
# used in assembler_warning subroutine
use constant {
    WARN_REG_NUM    => 0,
    WARN_LABEl_ORG    => 1,
};

# error message constants
# used in assembler_error subroutine
use constant {
    ERR_TRAILING        => 0,
    ERR_REPEAT_LABEL    => 1,
    ERR_ORG_CONST        => 2,
    ERR_DW_CONST        => 3,
    ERR_EQU_CONST        => 4,
    ERR_DIRECTIVE        => 5,
    ERR_INVALID_OPERAND    => 6,
    ERR_INVALID_INST    => 7,
    ERR_MISSING_OPERAND    => 8,
    ERR_UNDEFINED_LABEL    => 9,
    ERR_INVALID_REG        => 10,
    ERR_EXPECTED_REG    => 11,
    ERR_ORG_OVERLAP        => 12,
};

# each of the following global variables are defined by is_inst, is_reg, is_label, and is_const
# After calling one of these subroutines, the appropriate variables are defined. If the argument
# does not match the kind being tested for, the variables are left undefined.
my $inst;        # used by is_inst. Holds the mneumonic of the instruction.
my $inst_hex;    # used by is_inst. Holds the hex value of the instruction.
my $length;        # used by is_inst. Either the constant value for LONG or SHORT.
my $num_regs;    # used by is_inst. Holds the number of register fields in the opcode.
my $reg_num;    # used by is_reg. Holds the value of the digit in Rs or Rd.
my $const;        # used by is_const. Holds the hexadecimal value of the constant.

# when a label definition is encountered (i.e. label is the first word on the line), its value
# is determined (will be either org+offset or set by .equ directive) and then passed to the
# back_sub_label subroutine which back substitutes all of the references to that label in prior
# lines of code.
my $label = ""; # holds the label name
my $label_addr; # holds the address determined to correspond to the given label

############ START OF PROGRAM ###############

die "as240 verion $version\nUsage : as240 <input file name>" unless(defined $ARGV[0]);

($ARGV[0] =~ /(.+)\.asm$/) or die "invalid filename; must end in '.asm'";
my $filename = $1;            # filename minus the extension

open SOURCE, $ARGV[0] or die $!;
my @lines = <SOURCE>;        # slurp assembly source
close SOURCE;

s/\;.*//g foreach (@lines);    # strip comments

my $line_num = 0; # keeps track of which line we are currently processing
my @sim_words;

LINE: foreach (@lines) {
    $line_num++;

    next LINE if(/^\s+$/);    # skip blank lines

    # if previous line defined a label, back substitute now
    &back_sub_label($label,$label_addr) if $label;
    $label = "";

    @_ = split /\s+|,/;        # split line into words separated by whitespace and ,

    my @words;
    for my $i (0 .. $#_) {
        next if ($_[$i] eq "");    # ignore blank words
        $_[$i] = $_[$i];        # convert to lowercase
        push @words,$_[$i];        # add to the list of non-blank words
    }

    my $word = shift @words; # process the first word on this line

    if(&is_label($word) ) {
        push @sim_words, {"text" => $word, "type" => LABEL};
        if(exists $labels{$word}) { # label already encountered; err out
            &assembler_error(ERR_REPEAT_LABEL,$word);
        } else {
            $label = $word;
            $label_addr = $org+$offset; # unless it is .equ -- see below.
        }
        $word = shift @words; # process the next word on this line
    }

    next LINE if(!defined $word); # a label can be on its own line

    if(lc $word =~ /^\.[a-zA-Z]+$/) { # test for assembler directive
        if(lc $word  eq ".org") {
            if($label) {
                &assembler_warning(WARN_LABEl_ORG);
            }
            $word = shift @words;
            if(&is_const($word)) {
                $org = $const;
                $offset = 0; # reset the offset for starting at a new region
            } else {
                &assembler_error(ERR_ORG_CONST,$word);
            }
        }
        elsif(lc $word eq ".dw") {
            push @sim_words, {"text" => $word, "type" => OPCODE};
            $word = shift @words;
            my $data = 0;
            if(&is_const($word)) {
                $data = $const;
            }
            elsif(&is_label($word)) { # allows for labels
                $data = &get_label_addr($word);
            } else {
                &assembler_error(ERR_DW_CONST,$word);
            }
            push @sim_words, {"text" => $word, "type" => OPERAND};
            &write_to_mem($org + $offset,$data,\@sim_words);
            $offset++;
            @sim_words = ();
        }
        elsif(lc $word eq ".equ") {
            @sim_words = (); # no text in .sim file for .equ lines
            $word = shift @words;
            my $data = 0;
            if(&is_const($word)) {
                $data = $const;
            }
            else {
                &assembler_error(ERR_EQU_CONST,$word);
            }
            $label_addr = $data;
        }
        else {
            &assembler_error(ERR_DIRECTIVE,$word);
        }
        $word = shift @words;
        if(defined $word) {
            &assembler_error(ERR_TRAILING,$word);
        }
        next LINE;
    }

    if(&is_inst($word)) {
        push @sim_words, {"text" => $word, "type" => OPCODE};
        my $reg1 = 0;
        my $reg2 = 0;

        # address and register operands are reversed for sta instruction
        # (might want to find a better solution than this)
        if($inst eq 'sta') {
            my $tmp1 = shift @words;
            my $tmp2 = shift @words;
            unshift @words, $tmp1;
            unshift @words, $tmp2;
        }

        # num_regs is the number of registers which should be specified for the given inst
        if($num_regs >= 1) {
            $word = shift @words;
            if(&is_reg($word)) {
                push @sim_words, {"text" => $word, "type" => OPERAND};
                if($reg_num > 7) {
                    &assembler_error(ERR_INVALID_REG);
                }
                $reg1 = $reg_num;
                $reg2 = $reg1; # both register fields match when there is only one
            } else {
                &assembler_error(ERR_EXPECTED_REG, $word);
            }
        }
        if($num_regs == 2) {
            $word = shift @words;
            if(&is_reg($word)) {
                push @sim_words, {"text" => $word, "type" => OPERAND};
                if($reg_num > 7) {
                    &assembler_error(ERR_INVALID_REG);
                }
                $reg2 = $reg_num;
            } else {
                &assembler_error(ERR_EXPECTED_REG, $word);
            }
        }

        my $hex_with_regs = $inst_hex | ($reg1 << 3) | $reg2;
        &write_to_mem($org+$offset,$hex_with_regs, \@sim_words); # add the instruction binary to the memory hash
        $offset++; # the instruction opcode and register bits took up two bytes
        @sim_words = ();
        if($length == SHORT) {
            $word = shift @words;
            if(defined $word) {
                &assembler_error(ERR_TRAILING, $word);
            }
            next LINE;
        }
        @sim_words = ();
        # if we've reached this point, the instruction is long
        $word = shift @words; # this word should be either a label or a constant
        my $hex = 0; # the hexadecimal value which will get stored to the memory hash
        if(&is_reg($word) && $reg_num <= 7) {
            &assembler_warning(WARN_REG_NUM);
        }
        if(&is_const($word)) {
            $hex = $const;
        }
        elsif(&is_label($word)) {
            $hex = &get_label_addr($word);
        }
        elsif(!defined $word) {
            &assembler_error(ERR_MISSING_OPERAND);
        }
        else { # operand existed but was neither a label or constant
            &assembler_error(ERR_INVALID_OPERAND,$word);
        }

        push @sim_words, {"text" => $word, "type" => OPERAND};
        &write_to_mem($org+$offset,$hex,\@sim_words);
        $offset++;
        @sim_words = ();
        # check for extra unneeded stuff on this line
        $word = shift @words;
        if(defined $word) {
            &assembler_error(ERR_TRAILING,$word);
        }
        next LINE;
    }
    else {
        &assembler_error(ERR_INVALID_INST,$word);
    }
}

# edge case: label defined on the last line. no chance to run this line of
# code at the top of the loop
&back_sub_label($label,$label_addr) if $label;

# check for labels which were referred to but never defined
foreach my $undefined_label (keys %label_refs) {
    foreach my $hash (@{$label_refs{$undefined_label}}) {
        $line_num = $hash->{"line"}; # retrieve the number at which the reference was made
        &assembler_error(ERR_UNDEFINED_LABEL,$undefined_label);
    }
}

# check for errors in the assembly process
if($error_count > 0) {
    die "assembly failed with $error_count error(s) and $warning_count warning(s)";
}

print "assembly completed with $warning_count warning(s)\n" if ($warning_count > 0);

# mem_addresses is an array with all of the addresses of assembled code and data
my @mem_addresses = sort {$a <=> $b} keys %memory; # sort memory hash by address numerically
my $max_addr = $mem_addresses[$#mem_addresses]; # determine the last address stored to

# the next three lines used to add a STOP instruction at the end just in case the
# code did not include one. The old assembler seemed to do this (?).
# $memory{++$max_addr} = $short0{"stop"}; # add a stop instruction to the end just in case
# push @mem_addresses, $max_addr;
# @{$sim{$max_addr}} = ();

&print_hex_file;
&print_list_file;

############ END OF PROGRAM ###############

# this subroutine creates the .hex file
# it starts at address 0 and stops at the last address stored to (might be 0 with use of .dw $0)
# hex numbers are printed in upper-case
sub print_hex_file {
    open(HEX_FILE, ">memory\.hex") or die $!; # used to be $filename\.hex
    my $addr = 0;
    while ($addr <= $max_addr) {
        my $hex = (exists $memory{$addr})? uc sprintf("%04x",$memory{$addr}) : "0000";
        print HEX_FILE $hex."\n";
        $addr++;
    }
    close(HEX_FILE);
}

# print .list and .sim files
# In a very similar fashion to the original, this subroutine prints out .list and .sim files
# It reads data from the %memory and %sim hashes.
sub print_list_file {
    open(LIST_FILE, ">$filename\.list") or die $!;
#    open(SIM_FILE, ">$filename\.sim") or die $!;
    print LIST_FILE "addr data  label   opcode  operands\n";
    print LIST_FILE "---- ----  -----   ------  --------\n";

    my ($list_addr, $list_data, $list_label, $list_opcode, $list_operands);

    foreach my $addr (@mem_addresses) {
        $list_addr = uc sprintf("%04x",$addr);
        $list_data = uc sprintf("%04x",$memory{$addr});
        my $words = $sim{$addr};

        $list_label = $list_opcode = "        ";
        $list_operands = "";

        foreach my $word (@{$words}) {
            my $type = $word->{"type"};
            if($type == LABEL) {
                $list_label = sprintf("%-7s",$word->{"text"}). ' ';
            } elsif($type == OPCODE) {
                $list_opcode = sprintf("%-8s",$word->{"text"});
            } elsif($type == OPERAND) {
                $list_operands .= $word->{"text"}." ";
            }
        }
        print LIST_FILE "$list_addr $list_data  $list_label$list_opcode$list_operands\n";
# commented starting with version 1.5
#        print SIM_FILE "$list_addr $list_data  \"$list_label$list_opcode$list_operands\"\n";

        # to emulate the original assembler, print out zeros
#        # for every memory location not already containing an instruction
#        # until the next address which ends in F is reached
#        $addr++;
#        $list_addr = $list_data = $list_label = $list_opcode = $list_operands = "";
#        while(($addr%16 != 0) && (!exists $memory{$addr}) ) {
#            $list_addr = uc sprintf("%04x",$addr);
#            $list_data = "0000";
#            print LIST_FILE "$list_addr $list_data\n";
#            print SIM_FILE "$list_addr $list_data \"\"\n";
#            $addr++;
#        }
    }
    close(LIST_FILE);
#    close(SIM_FILE);
}

# this subroutine determines if the given argument matches an
# instruction mneumonic
# not case-sensitive
# if it is an instruction, it sets $inst to the matching mneumonic,
# sets $inst_hex equal to the hexadecimal of the opcode for this inst,
# sets $num_regs equal to the number of registers needed by this inst,
# sets $length equal to either SHORT or LONG
# each of these are set to undef if not a valid instruction
# returns 1 if argument matches an instruction, 0 otherwise
sub is_inst {
    my $word = lc shift;
    my $rv = 0;

    if(defined $word) {
        if(exists $short2{$word}) {
            $inst_hex = $short2{$word};
            $length = SHORT;
            $num_regs = 2;
            $rv = 1;
        }
        if(exists $short1{$word}) {
            $inst_hex = $short1{$word};
            $length = SHORT;
            $num_regs = 1;
            $rv = 1;
        }
        if(exists $short0{$word}) {
            $inst_hex = $short0{$word};
            $length = SHORT;
            $num_regs = 0;
            $rv = 1;
        }

        if(exists $long1{$word}) {
            $inst_hex = $long1{$word};
            $length = LONG;
            $num_regs = 1;
            $rv = 1;
        }
        if(exists $long0{$word}) {
            $inst_hex = $long0{$word};
            $length = LONG;
            $num_regs = 0;
            $rv = 1;
        }
    }
    else {
        $rv = 0;
        $inst_hex = undef;
        $length = undef;
        $num_regs = undef;
    }

    $inst = ($rv == 1) ? $word : undef;

    return $rv;
}

# this subroutine determines if the argument is a valid name for a label
# (that is, does not begin with a period . and does not match an instruction)
# NOTE: this does not determine if argument is a label which has been defined
# returns 1 for a valid label name, returns 0 otherwise
# see also get_label_addr
sub is_label {
    my $word = shift;
    my $rv = ((defined $word) && ($word =~ /^[^.]/) && !is_inst($word)) ? 1: 0;
    return $rv;
}

# this subroutine interprets the argument as a label name. it then looks up the
# address which this label corresponds to. if no such label has yet been defined,
# it adds this label name to a list of labels which have been referenced in an
# instruction (e.g. "lda R7, foo") but not yet defined
# label matching is case-sensitive
# returns address for given label if already defined, returns undef otherwise
# see also is_label and back_sub_label
sub get_label_addr {
    my $word = shift;

    if(exists $labels{$word}) { # look up the label in the table
        return $labels{$word};
    }
    else {
        # we stash the address where we need this constant as well as the line
        # number on which this label reference occurred. we store the line number
        # so that in case the label is never defined, we know on which line the
        # reference was made for the error message
        push(@{$label_refs{$word}},{"addr" => $org+$offset, "line" => $line_num});
        return undef;
    }
}

# once a label has been encountered, we can back-substitute the value to all the
# lines of code which referred to it. we then remove the prior references.
sub back_sub_label {
    my $word = shift;
    $labels{$word} = shift;
    # now that we have encountered this label, we can
    # replace all previous references to it with the
    # appropriate value
    foreach my $hash (@{$label_refs{$word}}) {
        $memory{$hash->{"addr"}} = $labels{$word};
    }
    # now remove the reference so we know at the end that there were no
    # undefined labels used e.g. "LDA R0, foo" where foo never appeared
    delete $label_refs{$word};
}

# determines if the argument forms a valid constant
# e.g. $010A and $50 are both valid while 10, $1000A and $100J are not
# sets $const to the valid constant or undef otherwise
# returns 1 for valid constants, 0 otherwise
sub is_const {
    my $word = lc shift;
    my $rv = ((defined $word) && ($word =~ /^\$([\da-f]{1,4})$/))? 1 : 0;
    $const = $rv? (hex '0x'.$1) : undef;
    return $rv;
}

# determines if the argument is a (possible invalid) register name
# NOTE: numbers greater than 7 still returns a 1. This should be tested for
# in the code using this subroutine! (a unique error message is used for this)
# NOTE: currently lowercase r's are accepted. This is not the original functionality.
# sets $reg_num equal to the number of the register named or undef otherwise
# returns 1 for a register, 0 otherwise
sub is_reg {
    my $word = lc shift;
    my $rv = ((defined $word) && ($word =~ /^r(\d+)$/))? 1 : 0;
    $reg_num = $rv? $1 : undef;
    return $rv;
}

# stashes the give data at the given address in the memory hash
# this memory hash is what is dumped to the hex file at the completion of assembly
# returns nothing
sub write_to_mem {
    my $addr = lc shift;
    my $data = shift;
    my $words = shift;

    $data = (defined $data) ? lc $data : undef;

    if( !exists $memory{$addr}) { # check for .org region overlap
        $memory{$addr} = $data;
        @{$sim{$addr}} = @{$words};
    }
    else {
        assembler_error(ERR_ORG_OVERLAP,$addr);
    }
}

# prints warnings. increments warning counter. does not die.
sub assembler_warning {
    my $warning = shift;

    $warning_count++;

    print STDERR "$filename\.asm: ";
    print STDERR "warning on line $line_num: ";

    if($warning == WARN_REG_NUM) {
        print STDERR "label matches register; are you aware this instruction requires a label or constant?"; 
    } elsif($warning == WARN_LABEl_ORG) {
        print STDERR "label '$label' should probably come after .org (i.e. on next line)"; 
    }

    print STDERR "\n";
}

# prints errors. increments error counter. causes death.
sub assembler_error {
    my $error = shift;
    my $word = shift; 

    $error_count++;

    print STDERR "$filename\.asm: ";
    print STDERR "error on line $line_num: ";

    $word = "" if(!defined $word);

    if($error == ERR_TRAILING) {        print STDERR "trailing characters: $word." }
    if($error == ERR_REPEAT_LABEL) {    print STDERR "repeated label '$word'." }
    if($error == ERR_ORG_CONST) {       print STDERR ".org directive requires a constant; saw '$word'." }
    if($error == ERR_DW_CONST) {        print STDERR ".dw directive requires a constant or label; saw '$word'." }
    if($error == ERR_EQU_CONST) {       print STDERR ".equ directive requires a constant; saw '$word'." }
    if($error == ERR_DIRECTIVE) {       print STDERR "invalid assembler directive '$word'." }
    if($error == ERR_INVALID_OPERAND) { print STDERR "invalid operand '$word'." }
    if($error == ERR_INVALID_INST) {    print STDERR "invalid instruction '$word'." }
    if($error == ERR_MISSING_OPERAND) { print STDERR "missing operand for instruction '$inst'." }
    if($error == ERR_UNDEFINED_LABEL) { print STDERR "undefined label '$word'." }
    if($error == ERR_INVALID_REG) {     print STDERR "invalid register number '$reg_num'." }
    if($error == ERR_EXPECTED_REG) {    print STDERR "expected $num_regs register operand(s) for '$inst' instruction; saw '$word'."}
    if($error == ERR_ORG_OVERLAP) {     print STDERR "overlapping \.org regions at 0x$word."}

    print STDERR "\n";
}
