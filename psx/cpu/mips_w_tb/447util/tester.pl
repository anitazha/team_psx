#!/usr/bin/perl

$m = "\e[1;32m18-477 Makefile: \e[0m";

$refFilename = $ARGV[0];
$refFilename =~ s/\.s/\.reg/;
$dumpFilename = $ARGV[1];

@refVals;
if(!open(REF_FILE,$refFilename)) {
  printf $m."ERROR -- reference register-dump not found: %s\n", $refFilename;
  exit 1;
}

while(<REF_FILE>) {
  if(/\s*R(\d+).*= (\w+)\s+R(\d+).*= (\w+)\s+R(\d+).*= (\w+)\s+R(\d+).*= (\w+)/) {
    #printf "r%d=%s  r%d=%s  r%d=%s  r%d=%s\n", $1, $2, $3, $4, $5, $6, $7, $8;
    $refVals[$1] = $2;
    $refVals[$3] = $4;
    $refVals[$5] = $6;
    $refVals[$7] = $8;
  }
}
close(REF_FILE);

@dumpVals;
if(!open(DUMP_FILE,$dumpFilename)) {
  printf $m."ERROR -- simulation register-dump not found: %s\n", $dumpFilename;
  exit 1;
}
while(<DUMP_FILE>) {
  if(/\s*R\s+(\d+)\s+=\s+0x(\w+)\s+/) {
    #printf "r%d=%s\n", $1, $2;
    $dumpVals[$1] = $2;
  }
}
close(DUMP_FILE);

$correct = 1;
printf "Reg\tDiff?\tRef\t\tTest\n";
for($ii = 0; $ii < 32; $ii++) {
  printf "%d\t", $ii;
  if($refVals[$ii] ne $dumpVals[$ii]) {
    $correct = 0;
    printf "  *\t";
  } else {
    printf "\t";
  }
  printf "%s\t%s\n", $refVals[$ii], $dumpVals[$ii];
}

printf "\n";
if($correct) {
  printf $m."\e[01;32mCORRECT! The simulation register-dump MATCHES the reference.\e[0m\n";
} else {
  printf $m."\e[01;31mINCORRECT! The simulation register-dump does NOT match the
  reference.\e[0m\n";
}

