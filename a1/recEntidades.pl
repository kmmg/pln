#!/usr/bin/perl

use warnings; 
use strict; #para dar os warnings e erros para nos ajudar a perceber o que se está a passar
use utf8::all; #para usar o encoding utf8 para todos os inputs

# Exemplo
# my $y = 20; #my é utilizado para declarar variáveis locais, para var globais utiliza-se o our
# print "Variavel $y\n";


#contar as linhas de um input
# my ($l,$c);
# while ($l = <>){ #<> - operador diamante vai ler o input, o diamante vazio permite receber ficheiros, já <STDIN> só recebe do STDIN
# 	$c++;
# }

# print "$c linhas\n";


#se não guardarmos o que é lido em nenhuma variável ele vai para a var $_ 
# my ($c);
# while (<>){ 
# 	print $_;
# 	#print; a var $_ pode ser omitida
# 	$c++;
# }

# print "$c linhas\n";

#contar palavras
my ($c);
while (<>){
	while ($_ =~ /\w+/g) { #utilizamos expressões regulares para identificar o que é uma palavra, as letros inseridas depois das barras são modificadores, neste caso o g é utilizado para fazer o match à palavra quantas vezes forem possiveis na string
		$c++;
	}
}

print "$c palavras\n";