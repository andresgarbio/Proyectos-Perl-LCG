#!usr/bin/perl 

print"Bienvenido al CONVERTIDOR BINARIO A DECIMAL! \nIntroduce tu numero binario de IZQUIERDA A DERECHA tecleando 1 o 0: \n";

for($i = 0 ; $i < 16; $i++){
	print"Ingresa el ", $i + 1, "° digito \n";
	$binario[$i] = <STDIN>; 
	while(($binario[$i] != 1) && ($binario[$i] != 0)){
		print"Solo puedes insertar 1 o 0 \n";
		$binario[$i] = <STDIN>;
	}$decimal |= ($binario[$i] << (15 - $i))
}print "Tu numero decimal es: \n$decimal\n"; 








