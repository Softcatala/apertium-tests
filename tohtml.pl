#!/bin/perl
use utf8;
use strict;
binmode(STDIN, ":utf8");
binmode(STDOUT, ":utf8");
binmode(STDERR, ":utf8");

my $prevline ="";

# rosa:  #ffeef0  #fdb8c0;
# verd:  #e6ffed; #acf2bd;

while (<STDIN>) {
    chop;
    my $line = $_;
    if ($prevline =~ /.+/) {
	$line = $prevline . " " . $line;
    }
    if ($line =~/^(.*)<span style="color:red">(.*)<\/span>[ \t]+<span style="color:green">(.*)<\/span>(.*)$/) { 
    	$prevline="";
	my $first = $line;
	$first =~ s/<span style="color:green">(.*?)<\/span>//g;
	$first =~ s/<span style="color:red">(.*?)<\/span>/<\/span><span style='background-color:#fdb8c0;'>\1<\/span><span style='background-color:#ffeef0;'>/g;
	my $second = $line;
	$second =~ s/<span style="color:red">(.*?)<\/span>//g;
	$second =~ s/<span style="color:green">(.*?)<\/span>/<\/span><span style='background-color:#acf2bd;'>\1<\/span><span style='background-color:#e6ffed;'>/g;
    	print "<span style='background-color:#ffeef0;'>$first</span><br/>\n";
    	print "<span style='background-color:#e6ffed;'>$second</span><br/>\n";
    } elsif ($line =~/(^<span style="color:red">.*<\/span> *$)/) {
    	$prevline = $line;
    } elsif ($line =~/^(.*)<span style="color:red">(.*)<\/span>(.*)$/) { 
    	$prevline="";
	my $first = $line;
	$first =~ s/<span style="color:green">(.*?)<\/span>//g;
	$first =~ s/<span style="color:red">(.*?)<\/span>/<\/span><span style='background-color:#fdb8c0;'>\1<\/span><span style='background-color:#ffeef0;'>/g;
	my $second = $line;
	$second =~ s/<span style="color:red">(.*?)<\/span>//g;
	$second =~ s/<span style="color:green">(.*?)<\/span>/<\/span><span style='background-color:#acf2bd;'>\1<\/span><span style='background-color:#e6ffed;'>/g;

    	print "<span style='background-color:#ffeef0;'>$first</span><br/>\n";
    	print "<span style='background-color:#e6ffed;'>$second</span><br/>\n";
    } elsif ($line =~/^(.*)<span style="color:green">(.*)<\/span>(.*)$/) { 
    	$prevline="";
	my $first = $line;
	$first =~ s/<span style="color:green">(.*?)<\/span>//g;
	$first =~ s/<span style="color:red">(.*?)<\/span>/<\/span><span style='background-color:#fdb8c0;'>\1<\/span><span style='background-color:#ffeef0;'>/g;
	my $second = $line;
	$second =~ s/<span style="color:red">(.*?)<\/span>//g;
	$second =~ s/<span style="color:green">(.*?)<\/span>/<\/span><span style='background-color:#acf2bd;'>\1<\/span><span style='background-color:#e6ffed;'>/g;
    	print "<span style='background-color:#ffeef0;'>$first</span><br/>\n";
    	print "<span style='background-color:#e6ffed;'>$second</span><br/>\n";
    } else {
#        $prevline="";
        if ($line !~ /@@/) {
            print "$line<br/>\n";1
        } else {
            print "<br/>\n";1
        }
    }
}
