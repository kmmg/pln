#!/usr/bin/perl

use warnings;
use strict;
use utf8::all;

#script para percorrer um ficheiro e ver se tem linhas repetidas, se tiver faz o print delas

my %lines;

while(<>){
	if($_=~/\S/ && $lines{$_}){
		print $_;
	}else{
		$lines{$_}++;
	}
}