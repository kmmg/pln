#!/usr/bin/perl

use warnings;
use strict;
use utf8::all;

#este script le varios ficheiros dados, calcula os seus md5 e ve se existem ficheiros repetidos, se sim faz o print de quais


my %lines;
#my $arg = join( " ", @ARGV );
#para o case de receber um pasta
my $arg = join( " ", map{-d $_ ? "$_/*":$_}@ARGV);

#o open serve para abrir um ficheiro

#ler um ficheiro
#open (F,"<", "f") or die("Can't open file\n");
#com um comando e escrver (|-) ou ler (-|) na pipe
open (F,"-|", "md5sum $arg") or die("Can't open file\n");

while(<F>){
	if($_=~/(\w+)\s+(.+)/){
		if(lines{$1}){
			print "$lines{$1} = $2\n";
		}else{
			$lines{$1} = $2;
		}
	}
}

__END__
#como executar um comando
my $a = `ls`;
print $a;






