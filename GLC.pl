
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Gramaticas libres de contexto// Gramaticas de clausulas definidas

% Representadas formalmente como tuplas de la forma:
% (N,T,P,S)

% En donde N= conjunto de no terminales
% T= conjunto de terminales
% P= conjunto de producciones
% S= simbolo inicial (no terminal)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

oracion(Oracion,Vacio):- sintagmaNominal(Genero,Numero,Oracion,Cuerpo),sintagmaVerbal(Genero,Numero,Cuerpo,Vacio).

sintagmaNominal(Genero,Numero,Oracion,Cuerpo):- determinante(Genero,Numero,Oracion,Intermedio),sujeto(Genero,Numero,Intermedio,Cuerpo).

sintagmaVerbal(Genero,Numero,Cuerpo,Vacio):- verbo(Cuerpo,Intermedio), sintagmaNominal(Genero,Numero,Intermedio,Vacio).
sintagmaVerbal(Genero,Numero,Cuerpo,Vacio):- verbo(Cuerpo,Vacio).

determinante(masculino,singular,[el|Cuerpo],Cuerpo).
determinante(femenino,singular,[la|Cuerpo],Cuerpo).
determinante(masculino,plural,[los|Cuerpo],Cuerpo).
determinante(masculino,singular,[este|Cuerpo],Cuerpo).
determinante(masculino,singular,[aquel|Cuerpo],Cuerpo).
determinante(masculino,singular,[ese|Cuerpo],Cuerpo).
%determinante(neutro,singular,[mi|Cuerpo]Cuerpo).
%determinante(neutro,singular,[tu|Cuerpo]Cuerpo).
%determinante(neutro,singular,[su|Cuerpo],Cuerpo).

sujeto(masculino,singular,[avion|Cuerpo],Cuerpo).
sujeto(masculino,plural,[aviones|Cuerpo],Cuerpo).
sujeto(masculino,singular,[capitan|Cuerpo],Cuerpo).
sujeto(masculino,singular,[mecanico|Cuerpo],Cuerpo).
sujeto(masculino,plural,[mecanicos|Cuerpo],Cuerpo).
sujeto(masculino,singular[mayCEy|Cuerpo],Cuerpo).

verbo([aterrizar|Cuerpo],Cuerpo).
verbo([despegar|Cuerpo],Cuerpo).
verbo([reparar|Cuerpo],Cuerpo).
verbo([solicitar|Cuerpo],Cuerpo).
verbo([identificar|Cuerpo],Cuerpo).

%conjugacion(Verbo):-(  Verbo==solicito; Verbo==identifiquese    ).

interjeccion([hola|Cuerpo],Cuerpo).
interjeccion([hey|Cuerpo],Cuerpo).