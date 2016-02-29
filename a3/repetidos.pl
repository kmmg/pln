#!/usr/bin/perl

use warnings;
use strict;
use utf8::all;

#script para percorrer um ficheiro com os md5 de varios ficheiros para ver se temos algum ficheiro repetido

my %lines;

while(<>){
	if($_=~/(\w+)\s+(.+)/){
		if(lines{$1}){
			print "$lines{$1} = $2\n";
		}else{
			$lines{$1} = $2;
		}
	}
}