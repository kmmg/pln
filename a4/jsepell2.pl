#!/usr/bin/perl
  
  use warnings;
  use strict;
  
  use Lingua::Jspell;
  use utf8::all;
  
  use Memoize;
  memoize('radicais');
  
  my $dic = Lingua::Jspell -> new("pt");
  my (%oco, $c);
  
  while (<>) {
      next if /^</;
  
      while ( /\w+(-\w+)*/g ) {
          my $word = $&;
      
          my @rad = radicais($word);
          for my $rad (@rad) {
              $oco{$rad}++;
          }
      }
  }
  
  for my $rad (sort { $oco{$b} <=> $oco{$a}} keys %oco){
      print "$rad\t$oco{$rad}\n"
  }
  
  sub radicais {
      my $word = shift;
      return $dic -> rad($word);
  }