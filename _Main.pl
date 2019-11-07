
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%% Import Files %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
consult(GLC.pl).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%% MayCEy Chat %%%%%%%%%%%%%%%%%%%%%%%%%%%%%

mayCEy:- write('*****************************\nInicializando Sistema Experto\n          ( MayCEy )         \n*****************************'),
		 solicitud.

solicitud:-write('\n\nA la espera de solicitud..\n\n'),chat.

chat:-readln(Oracion),(oracion(Oracion,[],Identificador) -> consulta(Identificador);write('**No tengo respuesta para la solicitud**\n'),chat).

consulta(Identificador):-pregunta(Identificador).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%% Preguntas %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%pregunta(Pregunta,Respuesta)

pregunta('saludo'):-write('Hola ¿En que lo puedo ayudar?\n'),chat.
pregunta('despedida'):-write('Fue un gusto ayudarle\n Cambio y fuera'),solicitud.
pregunta('emergencia'):-write('Inicia procedimiento de emergencia\n'),chat.
%pregunta([identificar],)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%% Procedimientos %%%%%%%%%%%%%%%%%%%%%%%%%%%

