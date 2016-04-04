#!/usr/bin/perl
  
  use warnings;
  use strict;
  use Lingua::Jspell;
  use utf8::all;
  
  my $dic = Lingua::Jspell -> new("pt");
  
  my @analysis = $dic -> fea("era");
  
  use Data::Dumper;
  print Dumper(\@analysis);