
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
%%%%%%%%%%%%%%%%%%%%%%%% Oraciones Simples %%%%%%%%%%%%%%%%%%%%%%%%%%

%La oración simple es la que está formada por un sólo verbo.


%Oraciones-Impersonales(Saludos/despedidas)
oracion(Oracion,Vacio,'saludo'):-saludo(0,Genero,Oracion,Vacio),!.
oracion(Oracion,Vacio,'saludo'):-saludo(1,Genero,Oracion,Cuerpo),!,saludo(2,Genero,Cuerpo,Vacio).
oracion(Oracion,Vacio,'despedida'):-despedida(0,Oracion,Cuerpo),!.
oracion(Oracion,Vacio,'despedida'):-despedida(1,Oracion,Cuerpo),!,despedida(2,Cuerpo,Vacio).
oracion(Oracion,Vacio,'emergencia'):-emergencia(Oracion,Cuerpo),!,emergencia(Cuerpo,Vacio).


%Oraciones-Declarativas
%oracion(Oracion,Vacio):-sintagmaNominal(Genero,Numero,Oracion,Vacio).
%oracion(Oracion,Vacio):-sintagmaNominal(Genero,Numero,Oracion,Cuerpo),sintagmaVerbal(Genero,Numero,Cuerpo,Vacio).
%Oraciones-Imperativa
%oracion(Oracion,Vacio):-sintagmaVerbal(Genero,Numero,Oracion,Vacio).
%Oraciones-Interrogativas
%oracion(Oracion,Vacio):-signo(Oracion,Vacio).
%oracion(Oracion,Vacio):-signo(Oracion,Cuerpo),sintagmaNominal(Genero,Numero,Cuerpo,Intermedio),sintagmaVerbal(Genero,Numero,Intermedio,Intermedio2),signo(Intermedio2,Vacio).


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
sintagmaNominal(Genero,Numero,Oracion,Cuerpo):-sujeto(Genero,Numero,Intermedio,Intermedio),complemento(Genero,Numero,Intermedio,Cuerpo).
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
%%%%%%%%%%%%%%%%%%%%%%%%% Sintagma Adverbial %%%%%%%%%%%%%%%%%%%%%%%%

%El sintagma adverbial es un grupo de palabras que tiene como núcleo 
%un adverbio o una locución adverbial.

%La estructura basica es la siguiente:
%<sintagmaAdverbial> -> <cuantificador> <nucleo> <sintagmaPreposicional>

%El cuantificador y los complementos son opcionales y pueden colocarse 
%en cualquier lugar de la oración.



sintagmaAdverbial(Genero,Numero,Oracion,Cuerpo):-adverbio(Oracion,Cuerpo).
sintagmaAdverbial(Genero,Numero,Oracion,Cuerpo):-cuantificador(Genero2,Numero2,Oracion,Intermedio),adverbio(Intermedio,Cuerpo).
sintagmaAdverbial(Genero,Numero,Oracion,Cuerpo):-adverbio(Oracion,Intermedio),sintagmaPreposicional(Genero2,Numero2,Intermedio,Cuerpo).
sintagmaAdverbial(Genero,Numero,Oracion,Cuerpo):-cuantificador(Genero2,Numero2,Oracion,Intermedio),adverbio(Intermedio,Intermedio2),sintagmaPreposicional(Genero3,Numero3,Intermedio2,Cuerpo).


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
complemento(Genero,Numero,Oracion,Cuerpo):-sintagmaAdverbial(Genero,Numero,Oracion,Cuerpo).
complemento(Genero,Numero,Oracion,Cuerpo):-sintagmaPreposicional(Genero,Numero,Oracion,Cuerpo).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%% Sustantivos %%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Los sustantivos denominan o nombran a personas, animales o cosas.

%Sustantivos
sujeto(masculino,singular,[avion|Cuerpo],Cuerpo).
sujeto(masculino,singular,[permiso|Cuerpo],Cuerpo).
sujeto(masculino,singular,[aeropuerto|Cuerpo],Cuerpo).
sujeto(masculino,singular,[controlador|Cuerpo],Cuerpo).
sujeto(masculino,plural,[aviones|Cuerpo],Cuerpo).
sujeto(masculino,plural,[motores|Cuerpo],Cuerpo).
sujeto(masculino,singular,[capitan|Cuerpo],Cuerpo).
sujeto(masculino,singular,[mecanico|Cuerpo],Cuerpo).
sujeto(masculino,plural,[mecanicos|Cuerpo],Cuerpo).
sujeto(femenino,singular,[capitana|Cuerpo],Cuerpo).
sujeto(masculino,singular,[tipo|Cuerpo],Cuerpo).
%Pronombres
sujeto(masculino,singular,[mayCEy|Cuerpo],Cuerpo).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%% Determinantes %%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Los adjetivos determinativos concretan o limitan la extensión del
%sustantivo, y expresan una relación de la persona, animal o cosa 
%respecto al espacio, la posesión, la cantidad, etc. Forman, junto a 
%los artículos, una clase de palabras: los determinantes.



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
determinante(masculino,singular,[donde|Cuerpo],Cuerpo).
determinante(femenino,singular,[cuanta|Cuerpo],Cuerpo).
determinante(masculino,singular,[que|Cuerpo],Cuerpo).
determinante(masculino,singular,[cuando|Cuerpo],Cuerpo).
determinante(masculino,plural,[cuantos|Cuerpo],Cuerpo).
determinante(masculino,singular,[cuanto|Cuerpo],Cuerpo).
determinante(masculino,singular,[cual|Cuerpo],Cuerpo).
determinante(masculino,plural,[cuales|Cuerpo],Cuerpo).
determinante(femenino,plural,[cuales|Cuerpo],Cuerpo).
%Adjetivos-Calificativos
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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Verbos %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Los verbos son aquellas palabras que se utilizan para expresar 
%acciones, estados, actitudes, condiciones, sucesos de la naturaleza 
%o existencia.



%Verbos-Infinitivos
verbo([vuelar|Cuerpo],Cuerpo).
verbo([aterrizar|Cuerpo],Cuerpo).
verbo([despegar|Cuerpo],Cuerpo).
verbo([reparar|Cuerpo],Cuerpo).
verbo([solicitar|Cuerpo],Cuerpo).
verbo([identificar|Cuerpo],Cuerpo).
verbo([llamar|Cuerpo],Cuerpo).
%Verbos-Pasado
verbo([volo|Cuerpo],Cuerpo).
verbo([aterrizo|Cuerpo],Cuerpo).
verbo([despego|Cuerpo],Cuerpo).
verbo([reparo|Cuerpo],Cuerpo).
verbo([solicito|Cuerpo],Cuerpo).
verbo([quiero|Cuerpo],Cuerpo).
verbo([identifico|Cuerpo],Cuerpo).
verbo([llamo|Cuerpo],Cuerpo).
%Verbos-Presente
verbo([es|Cuerpo],Cuerpo).
verbo([vuela|Cuerpo],Cuerpo).
verbo([vuelan|Cuerpo],Cuerpo).
verbo([aterriza|Cuerpo],Cuerpo).
verbo([despega|Cuerpo],Cuerpo).
verbo([repara|Cuerpo],Cuerpo).
verbo([solicita|Cuerpo],Cuerpo).
verbo([solicito|Cuerpo],Cuerpo).
verbo([identifica|Cuerpo],Cuerpo).
verbo([llama|Cuerpo],Cuerpo).
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
verbo([volara|Cuerpo],Cuerpo).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%% Adverbios %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Los adverbios son palabras que complementan a los verbos, a los 
%adjetivos o incluso otros adverbios. Se utilizan para expresar lugar,
%cantidad, tiempo, modo, duda, afirmación, etc.



%Adverbios-Cantidad
cuantificador(masculino,singular,[mucho|Cuerpo],Cuerpo).
cuantificador(masculino,singular,[demasiado|Cuerpo],Cuerpo).
cuantificador(masculino,singular,[algo|Cuerpo],Cuerpo).
cuantificador(masculino,plural,[muchos|Cuerpo],Cuerpo).
cuantificador(femenino,plural,[muchas|Cuerpo],Cuerpo).
cuantificador(femenino,singular,[mucha|Cuerpo],Cuerpo).
cuantificador(masculino,singular,[mas|Cuerpo],Cuerpo).
cuantificador(femenino,singular,[mas|Cuerpo],Cuerpo).
cuantificador(masculino,singular,[muy|Cuerpo],Cuerpo).
cuantificador(femenino,singular,[muy|Cuerpo],Cuerpo).
cuantificador(masculino,singular,[enormemente|Cuerpo],Cuerpo).
cuantificador(femenino,singular,[enormemente|Cuerpo],Cuerpo).
%Adverbios-Lugar
adverbio([ahi|Cuerpo],Cuerpo).
adverbio([aqui|Cuerpo],Cuerpo).
adverbio([delante|Cuerpo],Cuerpo).
adverbio([detras|Cuerpo],Cuerpo).
adverbio([arriba|Cuerpo],Cuerpo).
adverbio([debajo|Cuerpo],Cuerpo).
adverbio([cerca|Cuerpo],Cuerpo).
adverbio([lejos|Cuerpo],Cuerpo).
adverbio([encima|Cuerpo],Cuerpo).
adverbio([afuera|Cuerpo],Cuerpo).
adverbio([dentro|Cuerpo],Cuerpo).
%Adverbios-Tiempo
adverbio([ya|Cuerpo],Cuerpo).
adverbio([aun|Cuerpo],Cuerpo).
adverbio([hoy|Cuerpo],Cuerpo).
adverbio([tarde|Cuerpo],Cuerpo).
adverbio([pronto|Cuerpo],Cuerpo).
adverbio([todavia|Cuerpo],Cuerpo).
adverbio([nunca|Cuerpo],Cuerpo).
adverbio([siempre|Cuerpo],Cuerpo).
adverbio([ahora|Cuerpo],Cuerpo).
%Adverbios-Modo
adverbio([mal|Cuerpo],Cuerpo).
adverbio([bien|Cuerpo],Cuerpo).
adverbio([regular|Cuerpo],Cuerpo).
adverbio([despacio|Cuerpo],Cuerpo).
adverbio([claro|Cuerpo],Cuerpo).
adverbio([mejor|Cuerpo],Cuerpo).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Enlaces %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%son la palabra que comienza el sintagma y puede ser una preposición
%o una locución preposicional.

enlace([a|Cuerpo],Cuerpo).
enlace([de|Cuerpo],Cuerpo).
enlace([del|Cuerpo],Cuerpo).
enlace([en|Cuerpo],Cuerpo).
enlace([para|Cuerpo],Cuerpo).
enlace([por|Cuerpo],Cuerpo).
enlace([con|Cuerpo],Cuerpo).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%% Interjecciones %%%%%%%%%%%%%%%%%%%%%%%%%%%

%Saludos
saludo(0,masculino,[hola|Cuerpo],Cuerpo).
saludo(2,masculino,[dias|Cuerpo],Cuerpo).
saludo(2,femenino,[tardes|Cuerpo],Cuerpo).
saludo(2,femenino,[noches|Cuerpo],Cuerpo).
saludo(1,masculino,[buenos|Cuerpo],Cuerpo).
saludo(1,femenino,[buenas|Cuerpo],Cuerpo).
%Despedidas
despedida(0,[gracias|Cuerpo],Cuerpo).
despedida(0,[adios|Cuerpo],Cuerpo).
despedida(1,[cambio|Cuerpo],Cuerpo).
despedida(2,[fuera|Cuerpo],Cuerpo).
%Emergencias
emergencia([mayday|Cuerpo],Cuerpo).
emergencia([7500|Cuerpo],Cuerpo).
%Signos de Puntuacion
signo([¿|Cuerpo],Cuerpo).
signo([?|Cuerpo],Cuerpo).