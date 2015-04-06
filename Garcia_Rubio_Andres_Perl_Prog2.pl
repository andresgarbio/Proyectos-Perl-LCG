#!usr/bin/perl 

print "Bienvenido al ORDENADOR DE NUMEROS ENTEROS\nCuantos numeros quieres ordenar? (no mas de 10,000)\n";
$numeros = <STDIN>;
while(($numeros>10000) || ($numeros < 1)){
	print"Solo pueden ordenarse 10000 numeros\n";
	$numeros = <STDIN>;
}for($i = 0; $i < $numeros; $i++){
	$comp = $i;	
	print"Ingresa tu ", $i + 1, "° numero\n(-20,000 a -20,000)\n";
	$lista[$i] = <STDIN>;
	while(($lista[$i] > 20000) || ($lista[$i] < -20000)){
		print"Rango de (-20,000 a -20,000)";
		$lista[$i] = <STDIN>;
	}while($lista[$comp] < $lista[$comp - 1] && $comp ){
		$muleta = $lista[$comp];
		$lista[$comp] = $lista[$comp - 1];
		$lista[$comp - 1] = $muleta;
		$comp--;
	}
}print"Aqui estan tus numeros ordenados:";
for($i = 0 ; $i < $numeros ; $i++){
	print($lista[$i]);
}
	


