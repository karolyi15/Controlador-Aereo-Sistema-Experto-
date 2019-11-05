
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Gramaticas libres de contexto// Gramaticas de clausulas definidas

% Representadas formalmente como tuplas de la forma:
% (N,T,P,S)

% En donde N= conjunto de no terminales
% T= conjunto de terminales
% P= conjunto de producciones
% S= simbolo inicial (no terminal)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Validar-Oraciones
validar:-write('Ingrese oracion a validar: '),readln(Oracion),oracion(Oracion,[]).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Oracion
oracion(Oracion,Vacio):- sintagmaNominal(Genero,Numero,Oracion,Cuerpo),sintagmaVerbal(Genero,Numero,Cuerpo,Vacio).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

sintagmaNominal(Genero,Numero,Oracion,Cuerpo):-sujeto(Genero,Numero,Oracion,Cuerpo).
sintagmaNominal(Genero,Numero,Oracion,Cuerpo):- determinante(Genero,Numero,Oracion,Intermedio),sujeto(Genero,Numero,Intermedio,Cuerpo).
sintagmaNominal(Genero,Numero,Oracion,Cuerpo):- determinante(Genero,Numero,Oracion,Intermedio),sujeto(Genero,Numero,Intermedio,Intermedio2),complementoSN(Genero,Numero,Intermedio2,Cuerpo).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

sintagmaVerbal(Genero,Numero,Cuerpo,Vacio):- verbo(Cuerpo,Vacio).
sintagmaVerbal(Genero,Numero,Cuerpo,Vacio):- verbo(Cuerpo,Intermedio), complementoSN(Genero,Numero,Intermedio,Vacio).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

sintagmaAdjetival(Genero,Numero,Oracion,Cuerpo):-adjetivo(Genero,Numero,Oracion,Cuerpo).
sintagmaAdjetival(Genero,Numero,Oracion,Cuerpo):-cuantificador(Genero,Numero,Oracion,Intermedio),adjetivo(Genero,Numero,Intermedio,Cuerpo).
sintagmaAdjetival(Genero,Numero,Oracion,Cuerpo):-adjetivo(Genero,Numero,Oracion,Intermedio),complementoSN(Genero,Numero,Intermedio,Cuerpo).
sintagmaAdjetival(Genero,Numero,Oracion,Cuerpo):-cuantificador(Genero,Numero,Oracion,Intermedio),adjetivo(Genero,Numero,Intermedio,Intermedio2),complementoSN(Genero,Numero,Intermedio2,Cuerpo).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

sintagmaPreposicional():-.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

complementoSN(Genero,Numero,Oracion,Cuerpo):-sintagmaNominal(Genero,Numero,Oracion,Cuerpo).
complementoSN(Genero,Numero,Oracion,Cuerpo):-sintagmaAdjetival(Genero,Numero,Oracion,Cuerpo).
%complementoSN(Genero,Numero,Oracion,Cuerpo):-sintagmaPreposicional(Genero,Numero,Oracion,Cuerpo).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

sujeto(masculino,singular,[avion|Cuerpo],Cuerpo).
sujeto(masculino,plural,[aviones|Cuerpo],Cuerpo).
sujeto(masculino,singular,[capitan|Cuerpo],Cuerpo).
sujeto(masculino,singular,[mecanico|Cuerpo],Cuerpo).
sujeto(masculino,plural,[mecanicos|Cuerpo],Cuerpo).
sujeto(masculino,singular[mayCEy|Cuerpo],Cuerpo).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Determinantes-Articulos
determinante(masculino,singular,[el|Cuerpo],Cuerpo).
determinante(femenino,singular,[la|Cuerpo],Cuerpo).
determinante(masculino,plural,[los|Cuerpo],Cuerpo).
%Determinantes-Demostrativos
determinante(masculino,singular,[este|Cuerpo],Cuerpo).
determinante(masculino,singular,[aquel|Cuerpo],Cuerpo).
determinante(masculino,singular,[ese|Cuerpo],Cuerpo).
%Determinantes-Posesivos
determinante(masculino,singular,[mi|Cuerpo]Cuerpo).
determinante(masculino,singular,[tu|Cuerpo]Cuerpo).
determinante(masculino,singular,[su|Cuerpo],Cuerpo).
determinante(femenino,singular,[mi|Cuerpo]Cuerpo).
determinante(femenino,singular,[tu|Cuerpo]Cuerpo).
determinante(femenino,singular,[su|Cuerpo],Cuerpo).
%Determinantes-Numerales
determinante(masculino,singular,[uno|Cuerpo],Cuerpo).
determinante(masculino,plural,[dos|Cuerpo],Cuerpo).
determinante(masculino,plural,[tres|Cuerpo],Cuerpo).
determinante(femenino,plural,[dos|Cuerpo],Cuerpo).
determinante(femenino,plural,[tres|Cuerpo],Cuerpo).
%Determinantes-Indefinidos
determinante(masculino,plural,[pocos|Cuerpo],Cuerpo).
determinante(masculino,plural,[muchos|Cuerpo],Cuerpo).
determinante(masculino,singular,[ningun|Cuerpo],Cuerpo).
%Determinantes-Interrogativos/Exclamativos
determinante(masculino,plural,[cuantos|Cuerpo],Cuerpo).
determinante(masculino,singular,[cual|Cuerpo],Cuerpo).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Verbos-Infinitivos
verbo([aterrizar|Cuerpo],Cuerpo).
verbo([despegar|Cuerpo],Cuerpo).
verbo([reparar|Cuerpo],Cuerpo).
verbo([solicitar|Cuerpo],Cuerpo).
verbo([identificar|Cuerpo],Cuerpo).
verbo([llamar|Cuerpo],Cuerpo).
%Verbos-Pasado
verbo([aterrizo|Cuerpo],Cuerpo).
verbo([despego|Cuerpo],Cuerpo).
verbo([reparo|Cuerpo],Cuerpo).
verbo([solicito|Cuerpo],Cuerpo).
verbo([identifico|Cuerpo],Cuerpo).
verbo([llamo|Cuerpo],Cuerpo).
%Verbos-Futuro
verbo([aterrizara|Cuerpo],Cuerpo).
verbo([despegara|Cuerpo],Cuerpo).
verbo([reparara|Cuerpo],Cuerpo).
verbo([solicitara|Cuerpo],Cuerpo).
verbo([identificara|Cuerpo],Cuerpo).
verbo([llamara|Cuerpo],Cuerpo).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Adjetivos
adjetivo(masculino,singular,[grande|Cuerpo],Cuerpo).
adjetivo(femenino,singular,[grande|Cuerpo],Cuerpo).
adjetivo(masculino,singular,[malo|Cuerpo],Cuerpo).
adjetivo(masculino,singular,[bueno|Cuerpo],Cuerpo).
adjetivo(masculino,singular,[largo|Cuerpo],Cuerpo).
adjetivo(masculino,singular,[corto|Cuerpo],Cuerpo).
adjetivo(femenino,singular,[mala|Cuerpo],Cuerpo).
adjetivo(femenino,singular,[buena|Cuerpo],Cuerpo).
adjetivo(femenino,singular,[larga|Cuerpo],Cuerpo).
adjetivo(femenino,singular,[corta|Cuerpo],Cuerpo).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Adverbios-Cantidad
cuantificador(masculino,singular,[mucho|Cuerpo],Cuerpo).
cuantificador(masculino,plural,[muchos|Cuerpo],Cuerpo).
cuantificador(femenino,plural,[muchas|Cuerpo],Cuerpo).
cuantificador(femenino,singular,[mucha|Cuerpo],Cuerpo).
cuantificador(masculino,singular,[mas|Cuerpo],Cuerpo).
cuantificador(femenino,singular,[mas|Cuerpo],Cuerpo).
cuantificador(masculino,singular,[muy|Cuerpo],Cuerpo).
cuantificador(femenino,singular,[muy|Cuerpo],Cuerpo).
cuantificador(masculino,singular,[enormemente|Cuerpo],Cuerpo).
cuantificador(femenino,singular,[enormemente|Cuerpo],Cuerpo).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



interjeccion([hola|Cuerpo],Cuerpo).
interjeccion([hey|Cuerpo],Cuerpo).