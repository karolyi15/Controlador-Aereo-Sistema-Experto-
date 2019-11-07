
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%% Import Files %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
consult(GLC.pl).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%% MayCEy Chat %%%%%%%%%%%%%%%%%%%%%%%%%%%%%

mayCEy:- write('*****************************\nInicializando Sistema Experto\n          ( MayCEy )         \n*****************************\n'),
		 solicitud.

solicitud:-write('A la espera de solicitud..\n\n'),chat.

chat:-readln(Oracion),oracion(Oracion,[],Identificador),
	  consulta(Identificador),chat.

consulta(Identificador):-(pregunta(Identificador,Respuesta) -> write(Respuesta); write('No tengo respuesta para la solicitud\n')).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%% Preguntas %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%pregunta(Pregunta,Respuesta)

pregunta('saludo','Hola ¿ En que lo puedo ayudar ?\n').
pregunta('despedida','Fue un gusto ayudarle\n Cambio y fuera').
%pregunta([aterrizar],)
%pregunta([identificar],)



