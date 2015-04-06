#!usr/bin/perl 

&generar_lista(); 
print"Que numero buscas?\n";
$busqueda = <STDIN>;
while(($busqueda > 20000) || ($busqueda < -20000)){
			print"Rango de (-20,000 a -20,000)";
			$busqueda = <STDIN>;
}$limitesuperior = $numeros -1;
$limiteinferior = 0;
$indice = int(($limitesuperior - $limiteinferior) / 2) + $limiteinferior;
buscar($indice, $limitesuperior, $limiteinferior);
sub buscar{
	$_[0] = int(($_[1] - $_[2]) / 2) + $_[2];
	if($busqueda == $lista[$_[0]]){
		print("Tu numero esta en el indice \n", $_[0] , "\n");
	}elsif($_[1] == $_[2] || $busqueda > $_[1] || $busqueda < $_[2]){
		print("No se encontro tu numero \n");
	}elsif($busqueda > $lista[$_[0]]){
		$_[2] = $_[0];
		buscar($_[0], $_[1], $_[2]);
	}elsif($busqueda < $lista[$_[0]]){
		$_[1] = $_[0];
		buscar($_[0], $_[1], $_[2]);
	} 
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

