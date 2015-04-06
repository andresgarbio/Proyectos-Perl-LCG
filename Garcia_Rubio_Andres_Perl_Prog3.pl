#!usr/bin/perl 

generar_lista(); 
print"Que numero buscas?\n";
$busqueda = <STDIN>;
while(($busqueda > 20000) || ($busqueda < -20000)){
			print"Rango de (-20,000 a -20,000)";
			$busqueda = <STDIN>;
}$limitesuperior = $numeros -1;
$limiteinferior = 0;
until ($encontrado || $noencontrado){
	$indice = int(($limitesuperior - $limiteinferior) / 2) + $limiteinferior;
	if($busqueda > $lista[$indice]){
		$limiteinferior = $indice;
	}elsif($busqueda < $lista[$indice]){
		$limitesuperior = $indice;
	}else{
		$encontrado = 1;
	}if($limitesuperior == $limiteinferior || $busqueda > $limitesuperior || $busqueda < $limiteinferior){
		$noencontrado = 1;
	} 
}
if($encontrado){
	print("el numero ", $busqueda , "se encuentra en el indice: " , $indice, "\n");
}else{
	print("no esta en la lista \n");
}

sub generar_lista{
	print "Bienvenido al BUSCADOR DE NUMEROS\nCuantos numeros tienes? (no mas de 10,000)\n";
	$numeros = <STDIN>;
	while(($numeros>10000) || ($numeros < 1)){
		print"Solo puedes buscar entre 10000 numeros\n";
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
	}
}

