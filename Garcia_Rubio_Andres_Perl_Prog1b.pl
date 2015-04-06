#!usr/bin/perl 

print"Bienvenido al CONVERTIDOR DECIMAL A BINARIO! \nIntroduce tu numero decimal (menor a 65536) \n";
$decimal = <STDIN>;
while($decimal > 65535){
	print"solo menores a 65536";
	$decimal = <STDIN>;
}for($i = 16; $i ; $i--){
	$digito = $decimal >> $i - 1;
	$digito &= 1;
	$binario[16 - $i] = $digito;
}print"Tu numero binario es:\n";
for($i = 0 ; $i < 16; $i++){
	if($binario[$i]){
		$significancia = 1;	
	}if($significancia){
		print $binario[$i];	
	}
}
print "\n";



 
	
	
