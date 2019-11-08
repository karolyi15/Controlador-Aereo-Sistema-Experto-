
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%% Import Files %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
consult(GLC.pl).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%% MayCEy Chat %%%%%%%%%%%%%%%%%%%%%%%%%%%%%

mayCEy:- write('*****************************\nInicializando Sistema Experto\n          ( MayCEy )         \n*****************************'),
		 solicitud.

solicitud:-write('\n\nA la espera de solicitud..\n\n'),chat.

chat:-readln(Oracion),(oracion(Oracion,[],Identificador) -> consulta(Identificador);write('**No comprendo la solicitud**\n'),chat).

consulta(Identificador):-pregunta(Identificador).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%% Preguntas %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%pregunta(Pregunta,Respuesta)

pregunta('saludo'):-write('Hola ¿En que lo puedo ayudar?\n'),chat.
pregunta('despedida'):-write('Fue un gusto ayudarle\n Cambio y fuera'),solicitud.
pregunta('emergencia'):-emergencia,chat.
pregunta('aterrizar'):-aterrizaje,chat.
pregunta('despegar'):-despegue,chat.
pregunta('solicitar'):-write('Inicia procedimiento de solicitud\n'),chat.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%% Procedimientos %%%%%%%%%%%%%%%%%%%%%%%%%%%

aterrizaje:-write('Por favor, identifiquese:\n'),readln(PlaneID),
			write('Gracias, ¿Qué tipo de aeronave es?\n'),readln(PlaneModel),
			write('Indique, velocidad, distancia con la pista y dirección:\n'),readln(Datos),
			write('Su pista asignada es :....\n').

despegue:-write('Por favor, identifiquese:\n'),readln(PlaneID),
		  write('Gracias, ¿Qué tipo de aeronave es?\n'),readln(PlaneModel),
		  write('Indique la hora de salida:\n'),readln(HoraSalida),
		  write('Indique la direccion de salida:\n'),readln(Direccion),
		  assign(PlaneModel,Direccion,Pista), 
		  write('Su pista asignada es : '),write(Pista),nl.

emergencia:-write('Buenas, ¿Cual es su emergencia?\n'),readln(Emergencia),
			write('Por favor, identifiquese:\n'),readln(PlaneID),
			write('Pista .... asignada y equipo de ayuda enviado!\n').



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Asignar %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


assign(Plane,Dir,Track):-airplane(Plane,Size),track(Track,Size,Dir),!.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Aviones %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


airplane([cessna|_],small).
airplane([embraerPhenom|_],small).
airplane([beechcraft|_],small).
airplane([boing717|_],medium).
airplane([embraer190|_],medium).
airplane([airBusA220|_],medium).
airplane([boing747|_],big).
airplane([airBusA340|_],big).
airplane([airBusA380|_],big).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Pistas %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Eventos %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%