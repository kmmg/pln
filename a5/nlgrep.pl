#!/usr/bin/perl
  
use warnings;
use strict;

use utf8::all;
use Lingua::Jspell;
use Data::Dumper;
use Memoize;

my @patterns;
my $dic = Lingua::Jspell->new("pt");

if(!@ARGV){
  die "No arguments provided"; #with '\n' no line spec
}

@patterns = map{argparse($_)} @ARGV;
my $len = @patterns; #calcula o comprimento da lista patterns
print Dumper(\@patterns);

@ARGV=();
while(<>){
  my $line = $.;
  my @window = map{""} @patterns;#poe "" para cada padr\ao encontrado
  #my @window = ("") x $len;
  while (/\w+(-\w+)*|[.,;:!?]/g){
    my $w = $&;
    push @window, $w;
    shift @window;
    if(multi_word_match(\@window)) {
      print "($line @window) $_\n";
    }
    #if($dic->fea($w, ($patterns[0]))) {
    #  print "$. $_"; 
    #}
  }
}

sub argparse{
  my($a) = @_;
  my %f = split(/[:,]/, $a);
  return \%f; #retorna um apontador para o %f
}

sub multi_word_match{
  my ($window) = @_; 
  for my $i (0..$len-1){
    if($dic->fea($window->[$i], $patterns[$i])){
      return 0;
    }
  }
  return 1;
}


__END__
for my $elem (@ARGV) {
  push(@patterns, argparse($elem));
}

#primeiro teste
#perl nlgrep.pl rad:ter cat:v,t:pp
#segundo teste
#perl nlgrep.pl rad:ter CAT:v,T:ppa < ex.txt