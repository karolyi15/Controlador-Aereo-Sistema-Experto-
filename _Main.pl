
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%% Import Files %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
consult(GLC.pl).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%% MayCEy Chat %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mayCEy:- write('*****************************\nInicializando Sistema Experto\n*****************************\n'),
		 waiting.

waiting:- write('\n\nA la espera de solicitud.....\n\n'),readln(Oracion),(oracion(Oracion,[]) -> write('\nbuscar respuesta');write("\nNo entiendo, revise la gramática")),waiting.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%% Preguntas %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

inicio:-write('Ingrese pregunta:\n'),readln(Pregunta),consulta(Pregunta).

consulta(Pregunta):-pregunta(Pregunta,Respuesta),write(Respuesta).

%pregunta(Pregunta,Respuesta)

pregunta([hola],'Hola ¿ En que lo puedo ayudar ?').


