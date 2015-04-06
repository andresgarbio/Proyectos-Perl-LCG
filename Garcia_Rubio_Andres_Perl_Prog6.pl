#!usr/bin/perl 

print"Bienvenid@ al ANALIZADOR DE REDES!
Para usar este programa necesitas renombrar tus nodos empezando por '0', luego '1' , luego '2'...
Cuenta cuantas conecciones existen en tu red de antemano por favor,
Cuantos nodos tiene tu red?\n";
$nodos_totales = <STDIN>;
checar_tamano_nodos();
preguntar_usuario();
imprimir_analisis();


sub checar_tamano_nodos{
	while($nodos_totales <= 0){
		print"Da un numero razonable de nodos, por favor:\n";
		$nodos_totales = <STDIN>;	
	}return($nodos_totales);
}

sub preguntar_usuario{
	print"Vamos a especificar las conexiones de tu red\nTu red esta muy conectada? responde si/no\n";
	$respuesta = <STDIN>;
	if($respuesta eq "si\n"){
		generar_conexiones1();
	}
	elsif($respuesta eq "no\n"){
		generar_conexiones2();
	}
	else{
		preguntar_usuario();
	}
}

sub checar_si_es_nodo{
	my($nodo) = $_[0];
	while($nodo < 0 || $nodo >= $nodos_totales ){
		print"Ese nodo no existe en tu red, ingresa uno que si";
		$nodo = <STDIN>;
	}return($nodo);		
}		

sub generar_conexiones1{
	for($nodo1 = 0, $nodo2 = 0; $nodo1 < $nodos_totales ; $nodo1++){
		for($nodo2 = $nodo1 ; $nodo2 < $nodos_totales ; $nodo2++){
			print("Si los nodos estan conectados inserta 1 (o cualquier caracter)
			\rSi no estan conectados inserta 0\nNodo ", $nodo1, " esta conectado a ", $nodo2, " ?\n");
			$RED[$nodo1][$nodo2] = int(<STDIN>);	
			$RED[$nodo2][$nodo1] = $RED[$nodo1][$nodo2];
		}		
	}
}

sub generar_conexiones2{
	print"Cuantas conexiones tiene tu red?\n";
	$conexiones = <STDIN>;
	for($nodo = 0 ; $nodo < $conexiones ; $nodo++){
		print"Inserta un nodo que este conectado\n";
		$conectadode = <STDIN>;
		checar_si_es_nodo($conectadode);
		print"A que nodo esta conectado?\n";
		$conectadoa = <STDIN>;
		checar_si_es_nodo($conectadoa);	
		$RED[$conectadode][$conectadoa] = 1;	
		$RED[$conectadoa][$conectadode] = 1;
	}
}

sub imprimir_analisis{
	print"Aqui va el ANALISIS:\n";	
	for( $nodo = 0 ; $nodo < $nodos_totales ; $nodo++){
		print("Nodo ", $nodo ,"\n");
		$grados = conseguir_grados($nodo);
		print("tiene ", $grados, " grados\n");
		$coeficiente_clustering = generar_coeficiente_clustering($nodo,$grados);
		print("Su coeficiente de clustering es ",$coeficiente_clustering,"\n") 
		
	}
}

sub conseguir_grados{
	my($nodo) = $_[0];
	$grados = 0;	
	for($vecino = 0; $vecino < $nodos_totales; $vecino++){
		if($RED[$nodo][$vecino]){
			$grados++;
			if($nodo == $vecino ){
				$grados++;
			}
		}
	}return($grados);
}

sub generar_coeficiente_clustering{
	my($nodo, $grados) = @_;
	$vecindades = 0;
	for($vecino = 0; $vecino < $nodos_totales; $vecino++){
		if($RED[$nodo][$vecino] && $nodo != $vecino){
			for($vecino_indirecto = $vecino + 1; $vecino_indirecto < $nodos_totales; $vecino_indirecto++){
				if($RED[$vecino][$vecino_indirecto] && $vecino_indirecto != $nodo){
					if($RED[$nodo][$vecino_indirecto]){
					$vecindades++;
					}
				}
			}			
		}
	}
	return((2*$vecindades)/($grados*($grados -1)));
}

