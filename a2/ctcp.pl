#!/usr/bin/perl

#calculadora de tabela cap pref

use warnings; 
use strict; #para dar os warnings e erros para nos ajudar a perceber o que se está a passar
use utf8::all; #para usar o encoding utf8 para todos os inputs
use Data::Dumper;

#expressoes regulares
my $pm = qr{[[:upper:]]\w+};
my $prep = qr{d[aeo]s?};
my $np = qr{$pm( ($prep )?$pm)*};

#var globais
my (%palavras);


#codigo
while (<>){
	next if /^</;
	$_ =~ s/^\w+(-\w+)*//;
	while (/\w+(-\w+)*/g) { 
		$palavras{lc($&)}{$&}++;
	}
}

print Dumper(\%palavras);

__END__

foreach my $p (sort {mycompare($a,$b)} keys %palavras){
	print "$p: $palavras{$p}\n";
}

#ordena por número de ocorrências inverso e dentro delas alphabeticamente
sub mycompare{my($a,$b)=@_;
	if($palavras{$a} < $palavras{$b}) {return 1}
	if($palavras{$a} > $palavras{$b}) {return -1}
	return $a cmp $b;
}