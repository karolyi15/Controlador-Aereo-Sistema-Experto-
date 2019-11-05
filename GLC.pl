
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%% Gramaticas libres de contexto %%%%%%%%%%%%%%%%%%%

%Se dice que una gramática es libre de contexto si sus constituyentes
%son estructuralmente mutuamente independientes, es decir, la
%estructura de una parte no influye en la estructura de otra parte.

% Representadas formalmente como tuplas de la forma:
% (N,T,P,S)

% En donde N= conjunto de no terminales
% T= conjunto de terminales
% P= conjunto de producciones
% S= simbolo inicial (no terminal)

%%%%%%%%%%%%%%%%% Gramaticas de clausulas definidas %%%%%%%%%%%%%%%%%

%Las gramáticas de cláusulas definidas son una extensión de las 
%gramáticas libres de contexto en donde se permite a los no 
%terminales contener argumentos que representen la interdependencia 
%de los componentes de una frase.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%Validar-Oraciones
validar:-write('Ingrese oracion a validar: '),readln(Oracion),oracion(Oracion,[]).


%Oracion
oracion(Oracion,Vacio):-sintagmaNominal(Genero,Numero,Oracion,Vacio).
oracion(Oracion,Vacio):-sintagmaNominal(Genero,Numero,Oracion,Cuerpo),sintagmaVerbal(Genero,Numero,Cuerpo,Vacio).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%% Sintagma Nominal %%%%%%%%%%%%%%%%%%%%%%%%%%

%El sintagma nominal es un conjunto de palabras que forman un grupo,
%el elemento más importante de este sintagma es el núcleo que puede 
%ser un sustantivo, nombre propio, pronombre o una palabra 
%sustantivada.

%La estructura basica es la siguiente:
%<sintagmaNominal> -> <determinante> <nucleo> <complemento>

%El orden de estos elementos puede ser variable y no es necesario que
%aparezcan todos ellos



sintagmaNominal(Genero,Numero,Oracion,Cuerpo):-sujeto(Genero,Numero,Oracion,Cuerpo).
sintagmaNominal(Genero,Numero,Oracion,Cuerpo):- determinante(Genero,Numero,Oracion,Intermedio),sujeto(Genero,Numero,Intermedio,Cuerpo).
sintagmaNominal(Genero,Numero,Oracion,Cuerpo):- determinante(Genero,Numero,Oracion,Intermedio),sujeto(Genero,Numero,Intermedio,Intermedio2),complemento(Genero,Numero,Intermedio2,Cuerpo).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%% Sintagma Verbal %%%%%%%%%%%%%%%%%%%%%%%%%%

%El sintagma verbal es aquel sintagma o grupo de palabras cuyo núcleo
%es un verbo del que dependen una serie de complementos verbales.

%La estructura basica es la siguiente:
%<sintagmaVerbal> -> <nucleo> <complemento>

%El orden de estos elementos puede ser variable y los complementos 
%son opcionales.



sintagmaVerbal(Genero,Numero,Cuerpo,Vacio):- verbo(Cuerpo,Vacio).
sintagmaVerbal(Genero,Numero,Cuerpo,Vacio):- verbo(Cuerpo,Intermedio), complemento(Genero,Numero,Intermedio,Vacio).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%% Sintagma Adjetival %%%%%%%%%%%%%%%%%%%%%%%%

%El sintagma adjetival es aquel sintagma cuyo núcleo es un adjetivo.

%La estructura basica es la siguiente:
%<sintagmaAdjetival> -> <cuantificador> <adjetivo> <complemento>

%El cuantificador y los complementos son opcionales y pueden 
%colocarse en cualquier lugar de la oración.



sintagmaAdjetival(Genero,Numero,Oracion,Cuerpo):-adjetivo(Genero,Numero,Oracion,Cuerpo).
sintagmaAdjetival(Genero,Numero,Oracion,Cuerpo):-cuantificador(Genero,Numero,Oracion,Intermedio),adjetivo(Genero,Numero,Intermedio,Cuerpo).
sintagmaAdjetival(Genero,Numero,Oracion,Cuerpo):-adjetivo(Genero,Numero,Oracion,Intermedio),complemento(Genero,Numero,Intermedio,Cuerpo).
sintagmaAdjetival(Genero,Numero,Oracion,Cuerpo):-cuantificador(Genero,Numero,Oracion,Intermedio),adjetivo(Genero,Numero,Intermedio,Intermedio2),complemento(Genero,Numero,Intermedio2,Cuerpo).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%% Sintagma Preposicional %%%%%%%%%%%%%%%%%%%%%%%

%El sintagma preposicional es aquel formado por una preposición que
%a su vez va acompañado de otros sintagmas

%La estructura basica es la siguiente:
%<sintagmaPreposicional> -> <enlace> <complemento>

%Ambos elementos son obligatorios



sintagmaPreposicional(Genero,Numero,Oracion,Cuerpo):-enlace(Oracion,Intermedio),complemento(Genero2,Numero2,Intermedio,Cuerpo).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%% Complementos %%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Complementos para los diversos sintagmas utilizados, corresponden a
%otros sintagmas que dan sentido a la oracion. 



complemento(Genero,Numero,Oracion,Cuerpo):-sintagmaNominal(Genero,Numero,Oracion,Cuerpo).
complemento(Genero,Numero,Oracion,Cuerpo):-sintagmaAdjetival(Genero,Numero,Oracion,Cuerpo).
complemento(Genero,Numero,Oracion,Cuerpo):-sintagmaPreposicional(Genero,Numero,Oracion,Cuerpo).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%% Sustantivos %%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Sustantivos
sujeto(masculino,singular,[avion|Cuerpo],Cuerpo).
sujeto(masculino,singular,[aeropuerto|Cuerpo],Cuerpo).
sujeto(masculino,singular,[controlador|Cuerpo],Cuerpo).
sujeto(masculino,plural,[aviones|Cuerpo],Cuerpo).
sujeto(masculino,plural,[motores|Cuerpo],Cuerpo).
sujeto(masculino,singular,[capitan|Cuerpo],Cuerpo).
sujeto(masculino,singular,[mecanico|Cuerpo],Cuerpo).
sujeto(masculino,plural,[mecanicos|Cuerpo],Cuerpo).
sujeto(femenino,singular,[capitana|Cuerpo],Cuerpo).
%Pronombres
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
determinante(masculino,plural,[mis|Cuerpo]Cuerpo).
determinante(masculino,plural,[tus|Cuerpo]Cuerpo).
determinante(masculino,plural,[sus|Cuerpo]Cuerpo).
determinante(femenino,singular,[mi|Cuerpo]Cuerpo).
determinante(femenino,singular,[tu|Cuerpo]Cuerpo).
determinante(femenino,singular,[su|Cuerpo],Cuerpo).
determinante(femenino,plural,[mis|Cuerpo]Cuerpo).
determinante(femenino,plural,[tus|Cuerpo]Cuerpo).
determinante(femenino,plural,[sujetos|Cuerpo]Cuerpo).
%Determinantes-Numerales
determinante(masculino,singular,[uno|Cuerpo],Cuerpo).
determinante(masculino,plural,[dos|Cuerpo],Cuerpo).
determinante(masculino,plural,[tres|Cuerpo],Cuerpo).
determinante(femenino,plural,[dos|Cuerpo],Cuerpo).
determinante(femenino,plural,[tres|Cuerpo],Cuerpo).
determinante(femenino,singular,[una|Cuerpo],Cuerpo).
%Determinantes-Indefinidos
determinante(masculino,plural,[pocos|Cuerpo],Cuerpo).
determinante(masculino,plural,[muchos|Cuerpo],Cuerpo).
determinante(masculino,singular,[ningun|Cuerpo],Cuerpo).
%Determinantes-Interrogativos/Exclamativos
determinante(masculino,plural,[cuantos|Cuerpo],Cuerpo).
determinante(masculino,singular,[cual|Cuerpo],Cuerpo).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Verbos %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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
%Verbos-Presente
verbo([aterrizan|Cuerpo],Cuerpo).
verbo([despegan|Cuerpo],Cuerpo).
verbo([reparan|Cuerpo],Cuerpo).
verbo([solicitan|Cuerpo],Cuerpo).
verbo([identifican|Cuerpo],Cuerpo).
verbo([llaman|Cuerpo],Cuerpo).
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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Enlaces %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

enlace([a|Cuerpo],Cuerpo).
enlace([de|Cuerpo],Cuerpo).
enlace([del|Cuerpo],Cuerpo).
enlace([en|Cuerpo],Cuerpo).
enlace([para|Cuerpo],Cuerpo).
enlace([por|Cuerpo],Cuerpo).
enlace([con|Cuerpo],Cuerpo).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%% Interjecciones %%%%%%%%%%%%%%%%%%%%%%%%%%%

interjeccion([hola|Cuerpo],Cuerpo).
interjeccion([hey|Cuerpo],Cuerpo).