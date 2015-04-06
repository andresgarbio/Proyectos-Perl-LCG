#!usr/bin/perl 

$tamano_pila_menor = 0;
$tamano_pila_comun = 0;
$MCD = 1;

print"Bienvenido al BUSCADOR de MAXIMO COMUN DIVISOR\nIngresa tu primer numero ENTERO M\n";
$M = <STDIN>;
$M = checar_tamano($M);
print"Ingresa tu segundo numero ENTERO N\n";
$N = <STDIN>;
$N = checar_tamano($N);
$menor = buscar_menor($M, $N);
$mayor = ($M == $menor) ? $N : $M;
eval{
	generar_divisores($menor);
};
checar_divisores();
imprimir_pila_comun();

sub checar_tamano{
	while($_[0] > 20000 || $_[0] < -20000 || ($_[0] != int($_[0])) || $_[0] == 0){
		print"Solo en el rango ENTROS de -20000 a 20000\n";
		$_[0] = <STDIN>;	
	}return($_[0]);
}

sub buscar_menor{
	if(abs($_[0]) > abs($_[1])){
		return(abs($_[1]));
	}else{
		return(abs($_[0]));
	}
}

sub generar_divisores{
	my($numero) = $_[0];
	for($divisor = 2; $divisor <= $numero ; $divisor++){
		if($divisor == $numero){
			$divisores_menor[$tamano_pila_menor++] = $numero;
			die;
		}if($divisor == int($numero/2)){
			$divisores_menor[$tamano_pila_menor++] = $numero;
			die;
		}if(!($numero % $divisor)){
			$divisores_menor[$tamano_pila_menor++] = $divisor; 
			generar_divisores($numero/$divisor); 
		}
	}
			
}

sub checar_divisores{
	for($i = 0 ; $i < $tamano_pila_menor ; $i++){
		if(!($mayor % $divisores_menor[$i])){
			$pila_comun[$tamano_pila_comun++] = $divisores_menor[$i];
		}	
	}
}

sub imprimir_pila_comun{
	for($i = 0 ; $i < $tamano_pila_comun ; $i++){
		$MCD *= $pila_comun[$i];
	}
	print"Tu Maximo Comun Divisor es:\n", $MCD, "\n";
	if($MCD == 1){
		print"Que lastima, tus numeros no tienen factores en comun \n";	
	}
}



