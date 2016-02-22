#!/usr/bin/perl

use warnings; 
use strict; #para dar os warnings e erros para nos ajudar a perceber o que se está a passar
use utf8::all; #para usar o encoding utf8 para todos os inputs

#podemos declarar as nossas proprias experessoes regulares
my $pm = qr{[[:upper:]]\w+};
#v1: my $np = qr{$pm( $pm)*};
my $prep = qr{d[aeo]s?};
my $np = qr{$pm( ($prep )?$pm)*};


#contador de ocorrência de palavras

my (%palavras);
while (<>){
	#se a palavra começa por '<' (tag) passa a frente com o next
	next if /^</;
	while (/$np|\w+(-\w+)*/g) { #neste caso estamos tambem a identificar palavras com ifens e nomes proprios
		$palavras{$&}++
	}
}


#v1: ---------
#o sort ordena alphanumericamente
#foreach my $p (sort keys %a){
#-------------
#v2: ---------
#para ordenar pelo número de ocorrências(valor) temos de passar o operador (exemplo: $palavras{$a} <=> $palavras{$b})
#foreach my $p (sort($palavras{$a} <=> $palavras{$b}) keys %palavras){
#-------------
#podemos utilizar também uma função de comparação que nos sirva
foreach my $p (sort {mycompare($a,$b)} keys %palavras){
	print "$p: $palavras{$p}\n";
}

#ordena por número de ocorrências inverso e dentro delas alphabeticamente
sub mycompare{my($a,$b)=@_;
	if($palavras{$a} < $palavras{$b}) {return 1}
	if($palavras{$a} > $palavras{$b}) {return -1}
	return $a cmp $b;
}