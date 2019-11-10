

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%% MayCEy Chat %%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Inicia la comunicacion con el usuario, toma el input y es pasado al
%analizador gramatical, de esta forma se obtiene un identificador 
%semantico.

mayCEy:- consult('c:/Users/karol/Documents/ITCR II 2019/Compiladore y Lenguajes/Lenguajes/_Proyectos/MayCEy/GLC.pl'),
		 consult('c:/Users/karol/Documents/ITCR II 2019/Compiladore y Lenguajes/Lenguajes/_Proyectos/MayCEy/Agenda.pl'),
		 write('*****************************\nInicializando Sistema Experto\n          ( MayCEy )         \n*****************************'),
		 solicitud.

solicitud:-write('\n\nA la espera de solicitud..\n\n'),chat.

chat:-readln(Oracion),(oracion(Oracion,[],Identificador) -> pregunta(Identificador);write('**No comprendo la solicitud**\n'),chat).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%% Preguntas %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Analizan el identificador semantico producido por el analizador 
%gramatical y ejecuta un procedimiento respuesta.

%La estructura de esta regla es la siguiente:
%pregunta(Identificador)

pregunta('saludo'):-write('Hola ¿En que lo puedo ayudar?\n'),chat.
pregunta('despedida'):-write('Fue un gusto ayudarle\n Cambio y fuera'),despedida,solicitud.
pregunta('emergencia'):-emergencia,chat.
pregunta('aterrizar'):-aterrizaje,chat.
pregunta('despegar'):-despegue,chat.
pregunta('solicitar'):-write('Inicia procedimiento de solicitud\n'),chat.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%% Procedimientos %%%%%%%%%%%%%%%%%%%%%%%%%%%

%Son ejecutados como procedimiento respuesta a partir, del 
%identificador semantico. No requieren argumrntos.

aterrizaje:-write('Por favor, identifiquese:\n'),readln(PlaneID),
			write('Gracias, ¿Qué tipo de aeronave es?\n'),readln(PlaneModel),
			write('Indique su dirección:\n'),readln(Direccion),
			write('Indique la hora de aterrizaje:\n'),readln(HoraSalida),
			(assign(PlaneModel,Direccion,Pista,HoraSalida) -> write(' a las:'),write(HoraSalida),write('horas\n'); write('espere en linea,no hay pistas')).

despegue:-write('Por favor, identifiquese:\n'),readln(PlaneID),
		  write('Gracias, ¿Qué tipo de aeronave es?\n'),readln(PlaneModel),
		  write('Indique la hora de salida:\n'),readln(HoraSalida),
		  write('Indique la direccion de salida:\n'),readln(Direccion),
		  (assign(PlaneModel,Direccion,Pista,HoraSalida) -> write(' a las:'),write(HoraSalida),write('horas\n'); write('espere en linea,no hay pistas')).

emergencia:-write('Buenas, ¿Cual es su emergencia?\n'),readln(Emergencia),
			write('Por favor, identifiquese:\n'),readln(PlaneID),
			write('Gracias, ¿Qué tipo de aeronave es?\n'),readln(PlaneModel),
			write('Indique la hora de aterrizaje:\n'),readln(HoraSalida),
			(assign(PlaneModel,Direccion,Pista,HoraSalida) -> write(' a las:'),write(HoraSalida),write('horas\n'); write('espere en linea,no hay pistas')),write('\nEquipo de soporte enviado.'),nl.

despedida:-lectura('c:/Users/karol/Documents/ITCR II 2019/Compiladore y Lenguajes/Lenguajes/_Proyectos/MayCEy/Agenda.pl',Output),
					 tell('c:/Users/karol/Documents/ITCR II 2019/Compiladore y Lenguajes/Lenguajes/_Proyectos/MayCEy/Agenda.pl'), 
					 writeList(Output),
  					 listing(evento), 
  					 told.

writeList([]):-write('').
writeList([end_of_file|_]):-write('').
writeList([Cabeza|Cuerpo]):-write(Cabeza),write('.'),nl,writeList(Cuerpo).


lectura(FilePath,Output) :-
    open(FilePath, read, Str),
    read_file(Str,Output),
    close(Str).

read_file(Stream,[]) :-
    at_end_of_stream(Stream).

read_file(Stream,[X|L]) :-
    \+ at_end_of_stream(Stream),
    read(Stream,X),
    read_file(Stream,L).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Asignar %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Reglas/procedimeintos que permiten la asignacion y guardo de las pistas.
%La estructura que permite la asignacion es assign y se presenta a 
%continuacion:

%assign(ModeloAvion, Direccion , Pista)


assign(Plane,Dir,Track,[Time|_]):-airplane(Plane,Size),track(Track,Size,Dir),disponibilidad(Track,Time),!,assert(evento(Track,Time)),write('Su pista asignada es : '),write(Track).

disponibilidad(Pista,Hora):-not(evento(Pista,Hora)),!.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Aviones %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Hechos que describen los modelos de aviones disponibles y su tamaño
%Estos hechos ayudan a assignar las pistas de aterrizaje a los usuarios

%Su estructura basica es la siguiente:
%airplane(ModeloAvion,Tamaño)


airplane([cessna|_],small).
airplane([embraerPhenom|_],small).
airplane([beechcraft|_],small).
airplane([boing717|_],medium).
airplane([embraer190|_],medium).
airplane([airBusA220|_],medium).
airplane([boing747|_],big).
airplane([airBusA340|_],big).
airplane([airBusA380|_],big).
airplane([oruga|_],superbig).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Pistas %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Hechos que describen las pistas de aterrizaje disponibles y su tamaño.

track(p1,small,[nortexsur|_]).
track(p2_1,small,[estexoeste|_]).
track(p2_1,medium,[estexoeste|_]).
track(p2_2,medium,[oestexeste|_]).
track(p2_2,small,[oestexeste|_]).
track(p3,small,[nortexsur|_]).
track(p3,medium,[nortexsur|_]).
track(p3,big,[nortexsur|_]).
track(p3,small,[surxnorte|_]).
track(p3,medium,[surxnorte|_]).
track(p3,big,[surxnorte|_]).
track(p3,small,[estexoeste|_]).
track(p3,medium,[estexoeste|_]).
track(p3,big,[estexoeste|_]).
track(p3,small,[oestexeste|_]).
track(p3,medium,[oestexeste|_]).
track(p3,big,[oestexeste|_]).
track(p4,superbig,[nortexsur|_]).

