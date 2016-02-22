#!/usr/bin/perl

use warnings; 
use strict; #para dar os warnings e erros para nos ajudar a perceber o que se está a passar
use utf8::all; #para usar o encoding utf8 para todos os inputs

#contador de ocorrência de palavras

my (%palavras);
while (<>){
	#se a palavra começa por '<' (tag) passa a frente com o next
	next if /^</;
	while (/\w+/g) { #utilizamos expressões regulares para identificar o que é uma palavra, as letros inseridas depois das barras são modificadores, neste caso o g é utilizado para fazer o match à palavra quantas vezes forem possiveis na string
		$palavras{$&}++;
	}
}



#o sort ordena alphanumericamente
#foreach my $p (sort keys %a){
#para ordenar pelo número de ocorrências(valor) temos de passar o operador (exemplo: $palavras{$a} <=> $palavras{$b})
#foreach my $p (sort($palavras{$a} <=> $palavras{$b}) keys %palavras){
#podemos utilizar também uma função de comparação que nos sirva
foreach my $p (sort {mycompare($a,$b)} keys %palavras){
	print "$p: $palavras{$p}\n";
}

#ordena por número de ocorrências inverso e dentro delas alphabeticamente
sub mycompare{my($a,$b)=@_;
	if($palavras{$a} < $palavras{$b} {return 1});
	if($palavras{$a} > $palavras{$b} {return -1});
	return $a cmp $b;
}
