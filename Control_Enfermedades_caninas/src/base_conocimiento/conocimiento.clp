(import java.util.*)
(defglobal ?*VENTANA* = (fetch VENTANA))

(deffacts hechos_iniciales
    (Tarea ES iniciada)
)

(defrule reglaInicial
    (Tarea ES iniciada)
    =>
    (assert(Elija_Parte_Afectada)
)
)
;;;;;;;;;;;;;;;;;;;;;; INICIO REGLAS DE LA BASE DE CONOCIMIENTO ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defrule regla1
    (Elija_Parte_Afectada)
    =>
   
   (?*VENTANA* setMemoriaTrabajo "Sistema :  EL PACIENTE PRESENTA FIEBRE, DE QUE TIPO?")

    (bind ?pregunta "El paciente presenta fiebre, de que tipo?");Que parte afectada presenta el Perro
    (bind ?opciones (new ArrayList))
    ;;;;;;;;;;;;;;;; Aqui elejimos el tipo de fiebre
    
    (?opciones add  "Fiebre Alta")
    (?opciones add  "Fiebre Leve")
    (?opciones add  "Fiebre Intermitente")
    
    ; Aquie esta la respuesta obtenida y nos muestra el cuadro de informacion
    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))
    
    ;Aqui la opcion seleccionada de la interface preguntas
    (if (eq ?respuesta "Fiebre Alta")
         then (assert(dolor_muscular_articular)))
    (if (eq ?respuesta "Fiebre Leve")
             ;then (assert(Sintomas_respiratorias)))
             then (assert(Tiene Sarpullidos )))
    (if (eq ?respuesta "Fiebre Intermitente")
             then (assert(Sintomas_de_los_oidos)))
     
)

(defrule regla2
    ;;;;;;;;;(Sintomas_que_presenta_en_la_piel)
    (dolor_muscular_articular)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Estas son algunas de las sintomas que podria presentar")

    (bind ?pregunta "Elije un sintoma")
    (bind ?opciones (new ArrayList))
    (?opciones add  "Dolor muscular intenso")
    (?opciones add  "Dolor muscular y de articulaciones")
 
    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "Dolor muscular intenso")
            then (assert(presenta dolor de cabeza) ))
    (if (eq ?respuesta "Dolor muscular de articulaciones")
            then (assert(Zonas sin pelo de forma circular) ))
   
)
(defrule regla3
    (presenta dolor de cabeza)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Tiene escalosfrios?")

    (bind ?pregunta "Tiene escalosfrios")
    (bind ?opciones (new ArrayList))
    (?opciones add  "si")
    (?opciones add  "no")
    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))
    
    (if (eq ?respuesta "si")
          then (assert(el paciente presenta perdida de apetitos nauseas y vomitos) ))
    
    (if (eq ?respuesta "no")
           then (?*VENTANA* setImagenResp "pododermatitis.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema :La Enfermedad que tiene el can es:
       PADODERMATITIS")   
    )
)

;;;;;;;;;anterior
(defrule regla4
    (el paciente presenta perdida de apetitos nauseas y vomitos)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : el paciente presenta perdida de apetitos nauseas y vomitos ?")

    (bind ?pregunta "el paciente presenta perdida de apetitos nauseas y vomitos")
    (bind ?opciones (new ArrayList))
    (?opciones add  "si")
    (?opciones add  "no")
    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))
    ;;PONER LA IMAGEN DE LA ENFERMEDAD FIEBRE AMARILLA
    (if (eq ?respuesta "si")
           then (?*VENTANA* setImagenResp "pododermatitis.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema :La Enfermedad que tiene el paciente es:
       FIEBRE AMARILLA")   
    )
    (if (eq ?respuesta "no")
           then (?*VENTANA* setImagenResp "pododermatitis.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema :La Enfermedad que tiene el can es:
       PADODERMATITIS")   
    )
)



(defrule regla5
    (Tiene Sarpullidos)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Presenta problemas en la piel ? ")

    (bind ?pregunta "Presenta problemas en la piel ? ")
    (bind ?opciones (new ArrayList))
    (?opciones add  "Sarpullidos")
    (?opciones add  "Exantema(Erupciones en la piel)")
    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))
    
    (if (eq ?respuesta "Sarpullidos")
       then (assert(conjuntivitis) ))
    (if (eq ?respuesta "Picazon")
           then (?*VENTANA* setImagenResp "sarna_sarcoptica.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema :La Enfermedad que tiene el can es:
       SARNA SARCOPTICA")   
    )
)



;;;;;;;;;;; REGLAS DE LAS ENFERMEDADES RESPIRATORIAS
(printout t "REGLAS DE LAS ENFERMEDADES RESPIRATORIAS" crlf)

(defrule regla6
    (conjuntivitis)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : El paciente presenta conjuntivitis?")

    (bind ?pregunta "El paciente presenta conjuntivitis?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "Si")
    (?opciones add  "No")
        
    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "Si")
            then (assert(tipo de dolor de cabeza) ))
    (if (eq ?respuesta "No")
            then (assert(Vomitos) ))

)

(defrule regla7
    (tipo de dolor de cabeza)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Intensidad de dolor de cabeza ?")

    (bind ?pregunta "Intensidad de dolor de cabeza ?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "Dolor de cabeza leve")
    (?opciones add  "Dolor de cabeza intenso")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))
    
    (if (eq ?respuesta "Dolor de cabeza leve")
           then (assert(presenta vomitos) ))
    (if (eq ?respuesta "Tos seca")
           then (?*VENTANA* setImagenResp "tos_de_las_perreras.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema :La Enfermedad que tiene el can es:
       TOS DE LAS PERRERAS")   
    )
)

(defrule regla8
    (presenta vomitos)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : El paciente presenta vomitos?")

    (bind ?pregunta "El paciente presenta vomitos?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "Si")
    (?opciones add  "No")
    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))
    ;;;;;;;;; PONER LA IMAGEN DE ZIKA
    (if (eq ?respuesta "Si")
           then (?*VENTANA* setImagenResp "leptospirosis_canina.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema :La Enfermedad que tiene el paciente es:
       ZIKA")   
    )
    (if (eq ?respuesta "Problemas respiratorios")
           then (?*VENTANA* setImagenResp "leptospirosis_canina.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema :La Enfermedad que tiene el can es:
       LEPTOSPIROSIS CANINA")   
    )
)

(defrule regla9
    (Diarrea)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Elija un nuevo sintoma para saber la enfermedad ")

    (bind ?pregunta "Elije un nuevo sintoma que presenta")
    (bind ?opciones (new ArrayList))
    (?opciones add  "Lagrimas")
    (?opciones add  "Tos y vomitos")
    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))
    
    (if (eq ?respuesta "Lagrimas")
           then (?*VENTANA* setImagenResp "moquillo.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema :La Enfermedad que tiene el can es:
       MOQUILLO")   
    )
    (if (eq ?respuesta "Tos y vomitos")
           then (?*VENTANA* setImagenResp "moquillo.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema :La Enfermedad que tiene el can es:
       MOQUILLO")   
    )
)


;;;;;;;;;;; REGLAS DE LAS ENFERMEDADES DEL OIDO
(printout t "REGLAS DE LAS ENFERMEDADES DEL OIDO" crlf)

(defrule regla10
    (Sintomas_de_los_oidos)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Estas son algunas de los sintomas de ENFERMEDADES EN LOS OIDOS")

    (bind ?pregunta "Elije un sintoma en los oidos")
    (bind ?opciones (new ArrayList))
    (?opciones add  "Rascado de orejas")
    (?opciones add  "Sacude la cabeza")
    
    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "Rascado de orejas")
           then (?*VENTANA* setImagenResp "otitis_en_perros.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema :La Enfermedad que tiene el can es:
       OTITIS EN PERROS")   
    )
    (if (eq ?respuesta "Sacude la cabeza")
           then (?*VENTANA* setImagenResp "otitis_en_perros.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema :La Enfermedad que tiene el can es:
       OTITIS EN PERROS")   
    )

)

;;;;;;;;;;; REGLAS DE LAS ENFERMEDADES EN LOS OJOS
(printout t "REGLAS DE LAS ENFERMEDADES EN LOS OJOS" crlf)


(defrule regla11
    (Sintomas_en_los_ojos)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Estas son algunas de los sintomas de las ENFERMEDADES EN LOS OJOS")

    (bind ?pregunta "Elije un sintoma que presenta en los ojos ")
    (bind ?opciones (new ArrayList))
    (?opciones add  "Enrojecimiento")
    (?opciones add  "Pupilas dilatadas")
    
    
    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "Enrojecimiento")
            then (assert(Enrojecimiento) ))
    (if (eq ?respuesta "Pupilas dilatadas")
            then (assert(Pupilas dilatadas) ))
   
)


(defrule regla12
    (Enrojecimiento)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Elija un nuevo sintoma para saber la enfermedad ")

    (bind ?pregunta "Elije un nuevo sintoma que presenta en los ojos")
    (bind ?opciones (new ArrayList))
    (?opciones add  "Laganias")
    (?opciones add  "Picazon")
    (?opciones add  "Lagrimeo")
    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))
    
    (if (eq ?respuesta "Laganias")
           then (?*VENTANA* setImagenResp "conjuntivitis_en_perros.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema :La Enfermedad que tiene el can es:
       CONJUNTIVITIS EN PERROS")   
    )
    (if (eq ?respuesta "Picazon")
           then (?*VENTANA* setImagenResp "conjuntivitis_en_perros.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema :La Enfermedad que tiene el can es:
       CONJUNTIVITIS EN PERROS")   
    )
    (if (eq ?respuesta "Lagrimeo")
           then (?*VENTANA* setImagenResp "conjuntivitis_en_perros.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema :La Enfermedad que tiene el can es:
       CONJUNTIVITIS EN PERROS")   
    )
)

(defrule regla13
    (Pupilas dilatadas)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Elija un nuevo sintoma para saber la enfermedad ")

    (bind ?pregunta "Elije un nuevo sintoma que presenta en los ojos")
    (bind ?opciones (new ArrayList))
    (?opciones add  "Cornea opaca")
    (?opciones add  "Dolor en los ojos")
    (?opciones add  "Mirada enrojecida")
    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))
    
    (if (eq ?respuesta "Cornea opaca")
           then (?*VENTANA* setImagenResp "glaucoma.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema :La Enfermedad que tiene el can es:
       GLAUCOMA")   
    )
    (if (eq ?respuesta "Dolor en los ojos")
           then (?*VENTANA* setImagenResp "glaucoma.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema :La Enfermedad que tiene el can es:
       GLAUCOMA")   
    )
    (if (eq ?respuesta "Mirada enrojecida")
           then (?*VENTANA* setImagenResp "glaucoma.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema :La Enfermedad que tiene el can es:
       GLAUCOMA")   
    )
)


;;;;;;;;;;; REGLAS DE LAS ENFERMEDADES URUGENITALES
(printout t "REGLAS DE LAS ENFERMEDADES URURGENITALES" crlf)

(defrule regla14
    (Sintomas_urugenitales)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Estas son algunas de las sintomas que podria presentar")

    (bind ?pregunta "Elije un sintoma")
    (bind ?opciones (new ArrayList))
    (?opciones add  "Falta de apetito")
    (?opciones add  "Crecimiento anormal en los testiculos")
    (?opciones add  "Esterilidad")
    (?opciones add  "Orina lechosa")
    (?opciones add  "Mucosidad vaginal")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "Falta de apetito")
            then (assert(Falta de apetito) ))
    (if (eq ?respuesta "Crecimiento anormal en los testiculos")
            then (assert(Crecimiento anormal en los testiculos) ))
    (if (eq ?respuesta "Esterilidad")
            then (assert(Esterilidad) ))
    (if (eq ?respuesta "Orina lechosa")
            then (assert(Orina lechosa) ))
    (if (eq ?respuesta "Mucosidad vaginal")
            then (assert(Mucosidad vaginal) ))
    
)

(defrule regla15
    (Falta de apetito)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Elija un nuevo sintoma para saber la enfermedad ")

    (bind ?pregunta "Elije un nuevo sintoma que presenta:")
    (bind ?opciones (new ArrayList))
    (?opciones add  "Mucha sed")
    (?opciones add  "Dificultad de movimiento")
    (?opciones add  "Mucha orina")
    (?opciones add  "Diarrea")
    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))
    
    (if (eq ?respuesta "Mucha sed")
           then (?*VENTANA* setImagenResp "piometra.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema :La Enfermedad que tiene el can es:
       PIOMETRA")   
    )
    (if (eq ?respuesta "Dificultad de movimiento")
           then (?*VENTANA* setImagenResp "piometra.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema :La Enfermedad que tiene el can es:
       PIOMETRA")   
    )
    (if (eq ?respuesta "Mucha orina")
           then (?*VENTANA* setImagenResp "piometra.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema :La Enfermedad que tiene el can es:
       PIOMETRA")   
    )
    (if (eq ?respuesta "Diarrea")
           then (?*VENTANA* setImagenResp "piometra.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema :La Enfermedad que tiene el can es:
       PIOMETRA")   
    )
)

(defrule regla16
    (Crecimiento anormal en los testiculos)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Elija un nuevo sintoma para saber la enfermedad ")

    (bind ?pregunta "Elije un nuevo sintoma que presenta:")
    (bind ?opciones (new ArrayList))
    (?opciones add  "Zona enrojecida")
    (?opciones add  "Inflamacion")
    (?opciones add  "Dolor en los testiculos")
    
    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))
    
    (if (eq ?respuesta "Zona enrojecida")
           then (?*VENTANA* setImagenResp "tumor_venereo.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema :La Enfermedad que tiene el can es:
       TUMOR VENEREO CONTAGIOSO TVT")   
    )
    (if (eq ?respuesta "Inflamacion")
           then (?*VENTANA* setImagenResp "tumor_venereo.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema :La Enfermedad que tiene el can es:
       TUMOR VENEREO CONTAGIOSO TVT")   
    )
    (if (eq ?respuesta "Dolor en los testiculos")
           then (?*VENTANA* setImagenResp "tumor_venereo.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema :La Enfermedad que tiene el can es:
       TUMOR VENEREO CONTAGIOSO TVT")   
    )
    
)

(defrule regla17
    (Esterilidad)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Elija un nuevo sintoma para saber la enfermedad ")

    (bind ?pregunta "Elije un nuevo sintoma que presenta:")
    (bind ?opciones (new ArrayList))
    (?opciones add  "Abortos")
    (?opciones add  "Inflamacion testicular")
    
    
    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))
    
    (if (eq ?respuesta "Abortos")
           then (?*VENTANA* setImagenResp "brucelosis.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema :La Enfermedad que tiene el can es:
       BRUCELOSIS")   
    )
    (if (eq ?respuesta "Inflamacion testicular")
           then (?*VENTANA* setImagenResp "brucelosis.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema :La Enfermedad que tiene el can es:
       BRUCELOSIS")   
    )
    
    
)

(defrule regla18
    (Orina lechosa)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Elija un nuevo sintoma para saber la enfermedad ")

    (bind ?pregunta "Elije un nuevo sintoma que presenta:")
    (bind ?opciones (new ArrayList))
    (?opciones add  "Mal olor en la orina")
    (?opciones add  "Infeccion en la vejiga")
    (?opciones add  "Perdida de apetito")
    (?opciones add  "Dolor al orinar")
    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))
    
    (if (eq ?respuesta "Mal olor en la orina")
           then (?*VENTANA* setImagenResp "urolitiasis.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema :La Enfermedad que tiene el can es:
       UROLITIASIS")   
    )
    (if (eq ?respuesta "Infeccion en la vejiga")
           then (?*VENTANA* setImagenResp "urolitiasis.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema :La Enfermedad que tiene el can es:
       UROLITIASIS")   
    )
    (if (eq ?respuesta "Perdida de apetito")
           then (?*VENTANA* setImagenResp "urolitiasis.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema :La Enfermedad que tiene el can es:
       UROLITIASIS")   
    )
    (if (eq ?respuesta "Dolor al orinar")
           then (?*VENTANA* setImagenResp "urolitiasis.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema :La Enfermedad que tiene el can es:
       UROLITIASIS")   
    )
)

(defrule regla19
    (Mucosidad vaginal)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Elija un nuevo sintoma para saber la enfermedad ")

    (bind ?pregunta "Elije un nuevo sintoma que presenta:")
    (bind ?opciones (new ArrayList))
    (?opciones add  "Infeccion")
    (?opciones add  "Mal olor")
    (?opciones add  "Color amarillento")
    
    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))
    
    (if (eq ?respuesta "Infeccion")
           then (?*VENTANA* setImagenResp "vaginitis.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema :La Enfermedad que tiene el can es:
       VAGINITIS")   
    )
    (if (eq ?respuesta "Mal olor")
           then (?*VENTANA* setImagenResp "vaginitis.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema :La Enfermedad que tiene el can es:
       VAGINITIS")   
    )
    (if (eq ?respuesta "Color amarillento")
           then (?*VENTANA* setImagenResp "vaginitis.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema :La Enfermedad que tiene el can es:
       VAGINITIS")   
    )
)

;;;;;;;;;;; REGLAS DE OTRAS ENFERMEDADES
(printout t "REGLAS DE REGLAS DE OTRAS ENFERMEDADES" crlf)

(defrule regla20
    (Otros_sintomas)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Estas son algunas de las sintomas que podria presentar")

    (bind ?pregunta "Elije un sintoma")
    (bind ?opciones (new ArrayList))
    (?opciones add  "Ansiedad")
    (?opciones add  "Hemoragias")
    (?opciones add  "Dolor abdominal")
    (?opciones add  "Anorexia")
    

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "Ansiedad")
            then (assert(Ansiedad) ))
    (if (eq ?respuesta "Hemoragias")
            then (assert(Hemoragias) ))
    (if (eq ?respuesta "Dolor abdominal")
            then (assert(Dolor abdominal) ))
    (if (eq ?respuesta "Anorexia")
            then (assert(Anorexia) ))
)

(defrule regla21
    (Ansiedad)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Elija un nuevo sintoma para saber la enfermedad ")

    (bind ?pregunta "Elije un nuevo sintoma que presenta:")
    (bind ?opciones (new ArrayList))
    (?opciones add  "Agresividad")
    (?opciones add  "Hormigueos")
    (?opciones add  "Espuma en la boca")
    (?opciones add  "Paralisis en  las extremidades")
    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))
    
    (if (eq ?respuesta "Agresividad")
           then (?*VENTANA* setImagenResp "rabia.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema :La Enfermedad que tiene el can es:
       RABIA")   
    )
    (if (eq ?respuesta "Hormigueos")
           then (?*VENTANA* setImagenResp "rabia.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema :La Enfermedad que tiene el can es:
       RABIA")   
    )
    (if (eq ?respuesta "Espuma en la boca")
           then (?*VENTANA* setImagenResp "rabia.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema :La Enfermedad que tiene el can es:
       RABIA")   
    )
    (if (eq ?respuesta "Paralisis en  las extremidades")
           then (?*VENTANA* setImagenResp "rabia.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema :La Enfermedad que tiene el can es:
       RABIA")   
    )
)

(defrule regla22
    (Hemoragias)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Elija un nuevo sintoma para saber la enfermedad ")

    (bind ?pregunta "Elije un nuevo sintoma que presenta:")
    (bind ?opciones (new ArrayList))
    (?opciones add  "Dolores musculares")
    (?opciones add  "Diarrea")
    (?opciones add  "Vomitos")
    
    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))
    
    (if (eq ?respuesta "Dolores musculares")
           then (?*VENTANA* setImagenResp "parvovirosis.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema :La Enfermedad que tiene el can es:
       PARVOVIROSIS CANINA")   
    )
    (if (eq ?respuesta "Diarrea")
           then (?*VENTANA* setImagenResp "parvovirosis.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema :La Enfermedad que tiene el can es:
       PARVOVIROSIS CANINA")   
    )
    (if (eq ?respuesta "Vomitos")
           then (?*VENTANA* setImagenResp "parvovirosis.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema :La Enfermedad que tiene el can es:
       PARVOVIROSIS CANINA")   
    )
    
)

(defrule regla23
    (Dolor abdominal)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Elija un nuevo sintoma para saber la enfermedad ")

    (bind ?pregunta "Elije un nuevo sintoma que presenta:")
    (bind ?opciones (new ArrayList))
    (?opciones add  "Conjuntivitis")
    (?opciones add  "Hemorragias")
    (?opciones add  "Fiebre")
    
    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))
    
    (if (eq ?respuesta "Conjuntivitis")
           then (?*VENTANA* setImagenResp "hepatitis_infecciosa.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema :La Enfermedad que tiene el can es:
       HEPATITIS INFECCIOSA")   
    )
    (if (eq ?respuesta "Hemorragias")
           then (?*VENTANA* setImagenResp "hepatitis_infecciosa.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema :La Enfermedad que tiene el can es:
       HEPATITIS INFECCIOSA")   
    )
    (if (eq ?respuesta "Fiebre")
           then (?*VENTANA* setImagenResp "hepatitis_infecciosa.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema :La Enfermedad que tiene el can es:
       HEPATITIS INFECCIOSA")   
    )
    
)

(defrule regla24
    (Anorexia)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Elija un nuevo sintoma para saber la enfermedad ")

    (bind ?pregunta "Elije un nuevo sintoma que presenta:")
    (bind ?opciones (new ArrayList))
    (?opciones add  "Perdida de peso")
    (?opciones add  "Cojeras")
    (?opciones add  "Abultamiento en las mamas")
    
    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))
    
    (if (eq ?respuesta "Perdida de peso")
           then (?*VENTANA* setImagenResp "tumor_mamario.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema :La Enfermedad que tiene el can es:
       TUMOR MAMARIO")   
    )
    (if (eq ?respuesta "Cojeras")
           then (?*VENTANA* setImagenResp "tumor_mamario.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema :La Enfermedad que tiene el can es:
       TUMOR MAMARIO")   
    )
    (if (eq ?respuesta "Abultamiento en las mamas")
           then (?*VENTANA* setImagenResp "tumor_mamario.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema :La Enfermedad que tiene el can es:
       TUMOR MAMARIO")   
    )
    
)