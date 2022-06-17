/* 
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra.
Almacene los resultados separados por comas. 

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
ejercicio = LOAD 'data.csv' USING PigStorage(',') 
    AS ( 
            id: int, 
            nombre:chararray, 
            apellido:chararray, 
            fecha:chararray, 
            color:chararray, 
            numer:chararray 
    ); 
 
sub_conjunto= FOREACH ejercicio GENERATE nombre, color; 
filtro_B= FILTER sub_conjunto BY (nombre MATCHES '.*^[kK].*') OR (color == 'blue'); 
STORE filtro_B INTO 'output' USING PigStorage(',');
