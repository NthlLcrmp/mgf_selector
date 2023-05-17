#!/usr/bin/perl
use warnings;
use strict;

print "\nWhat is the path of the mgf file to modify?\n";
print '(e.g. C:\Users\Metabo\Documents\My Project\MZmine_output_for_SIRIUS.mgf)';
print "\n";
my $path1 = <>;
chomp $path1;

{
	open(MGF1, '<', $path1) or die $!;

	local $/ = "\n\n";

	my @totIDs = ();

	while(<MGF1>){
		my $start1 = index($_, "FEATURE_ID="); 
		my $end1 = index($_, "\nMSLEVEL="); # Remplacer par PEPMASS= pour GNPS
		my $len1 = $end1 - $start1;
		my $id1 = substr($_, $start1, $len1);
		# print "$id1\n";
		unless($id1 ~~ @totIDs){
			push(@totIDs, $id1);
		}
	}

	my $count1 = scalar @totIDs;

	print "\n==> The mgf file contains $count1 features.\n";

	close(MGF1);
}

print "\nWhat is the path of the csv file from MetaboAnalyst?\n";
print '(e.g. C:\Users\Metabo\Documents\My Project\kw_posthoc.csv)';
print "\n";
my $path2 = <>;
chomp $path2;

open(CSV, '<', $path2) or die $!;

my @NumID = ();

while(<CSV>){
	if($_ =~ /mz/){
		my @cut = split("/", $_);
		my $ID = $cut[0];
		push(@NumID, $ID);
	}
}

my @IDs = ();

foreach(@NumID){
	push(@IDs, "FEATURE_ID=$_");
}

my $count2 = scalar @IDs;

print "\n==> $count2 features need to be extracted from the mgf file.\n";

close(CSV);

open(MGF1, '<', $path1) or die $!;

print "\nWhat is the path to the output mgf file?\n";
print '(e.g. C:\Users\Metabo\Documents\My Project\MZmine_output_for_SIRIUS_cleaned.mgf)';
print "\n";
my $path3 = <>;
chomp $path3;

open(MGF2, '>', $path3) or die $!;

local $/ = "\n\n";

while(<MGF1>){
	my $start = index($_, "FEATURE_ID="); 
	my $end = index($_, "\nMSLEVEL="); 
	my $len = $end - $start;
	my $id = substr($_, $start, $len);
	print MGF2 $_ if $id ~~ @IDs;
}

close(MGF1);
close(MGF2);

{
	open(MGF2, '<', $path3) or die $!;

	local $/ = "\n\n";

	my @totIDs2 = ();

	while(<MGF2>){
		my $start2 = index($_, "FEATURE_ID="); 
		my $end2 = index($_, "\nMSLEVEL="); 
		my $len2 = $end2 - $start2;
		my $id2 = substr($_, $start2, $len2);
		unless($id2 ~~ @totIDs2){
			push(@totIDs2, $id2);
		}
	}

	my $count3 = scalar @totIDs2;

	print "\n==> The new mgf file contains $count3 features.\n";

	close(MGF2);
}

sleep 10;