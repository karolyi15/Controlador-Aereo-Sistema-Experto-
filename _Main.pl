
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
		  write('Su pista asignada es :....\n').

emergencia:-write('Buenas, ¿Cual es su emergencia?'),readln(Emergencia),
			write('Por favor, identifiquese:\n'),readln(PlaneID),
			write('Pista .... asignada y equipo de ayuda enviado!\n').