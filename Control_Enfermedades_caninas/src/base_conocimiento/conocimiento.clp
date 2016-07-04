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
    (?opciones add  "Fiebre leve e intermitente")
    
    ; Aquie esta la respuesta obtenida y nos muestra el cuadro de informacion
    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))
    
    ;Aqui la opcion seleccionada de la interface preguntas
    (if (eq ?respuesta "Fiebre Alta")
         then (assert(dolor_muscular_articular)))
    (if (eq ?respuesta "Fiebre Leve")
             then (assert(Tiene Sarpullidos )))
    (if (eq ?respuesta "Fiebre leve e intermitente")
             then (assert(dolor_muscular_articular)))
     
)

(defrule regla2
    (dolor_muscular_articular)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Estas son algunas de las sintomas que podria presentar")

    (bind ?pregunta "Elije un sintoma")
    (bind ?opciones (new ArrayList))
    (?opciones add  "Dolor muscular intenso")
    (?opciones add  "Dolor muscular leve")
    (?opciones add  "Dolor muscular y de articulaciones")
 
    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "Dolor muscular intenso")
            then (assert(presenta dolor de cabeza) ))
    (if (eq ?respuesta "Dolor muscular leve")
            then (assert(escalosfrios o Reaccion alergica en la piel) ));;;;;;;;;;;regla12
    (if (eq ?respuesta "Dolor muscular y de articulaciones")
            then (assert(tipo de dolor de cabeza) ));;;regla 7
   
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
      SE DESCONOCE SU ENFERMEDAD")   
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
       SE DESCONOCE SU ENFERMEDAD")   
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
    (if (eq ?respuesta "Exantema(Erupciones en la piel)")
           then (?*VENTANA* setImagenResp "sarna_sarcoptica.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema :La Enfermedad que tiene el can es:
       SE DESCONOCE SU ENFERMEDAD")   
    )
)


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
           then (assert(presenta vomitos o alergica en la piel) ))
    (if (eq ?respuesta "Dolor de cabeza intenso")
        then (assert(presenta vomitos o alergica en la piel) ))
)

(defrule regla8
    (presenta vomitos o alergica en la piel)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Eliga un sintoma?")

    (bind ?pregunta "Eliga un sintoma?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "Vomitos")
    (?opciones add  "Náuseas y vómitos")
    (?opciones add  "Reaccion alergica en la piel")
    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))
    ;;;;;;;;; PONER LA IMAGEN DE ZIKA
    (if (eq ?respuesta "Vomitos")
           then (?*VENTANA* setImagenResp "leptospirosis_canina.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema :La Enfermedad que tiene el paciente es:
       ZIKA")   
    )
    (if (eq ?respuesta "Náuseas y vómitos")
           then (assert(presenta perdida de apetito) ))
    (if (eq ?respuesta "Reaccion alergica en la piel")
           then (assert(ardor en las palmas de los pies de las manos) ))
)

(defrule regla9
    (presenta perdida de apetito)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Tiene perdida de apetito? ")

    (bind ?pregunta "Tiene perdida de apetito?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "si")
    (?opciones add  "no")
    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))
    
    (if (eq ?respuesta "si")
             then (assert(presenta dolor de garganta) ));;regla10
    (if (eq ?respuesta "no")
           then (?*VENTANA* setImagenResp "moquillo.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema :La Enfermedad que tiene el can es:
       SE DESCONOCE SU ENFERMDEDAD")   
    )
)



;;;;;;;;;;; REGLAS DE LAS ENFERMEDADES DEL OIDO
(printout t "REGLAS DE LAS ENFERMEDADES DEL OIDO" crlf)

(defrule regla10
    (presenta dolor de garganta)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : presenta dolor de garganta?")

    (bind ?pregunta "presenta dolor de garganta?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "Si")
    (?opciones add  "No")
    
    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "Si")
         then (assert(presenta cansancio) )) ;;regla 11
    (if (eq ?respuesta "No")
           then (?*VENTANA* setImagenResp "otitis_en_perros.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema :La Enfermedad que tiene el can es:
       SU ENFERMEDAD SE DESCONOCE")   
    )

)

;;;;;;;;;;; REGLAS DE LAS ENFERMEDADES EN LOS OJOS
(printout t "REGLAS DE LAS ENFERMEDADES EN LOS OJOS" crlf)


(defrule regla11
    (presenta cansancio)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Presenta cansancio?")

    (bind ?pregunta "Presenta cansancio?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "Si")
    (?opciones add  "No")
    
    
    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))
    ;; PONER LA IMAGEN DE LA ENFERMEDAD DE DENGUE
    (if (eq ?respuesta "Si")
              then (?*VENTANA* setImagenResp "otitis_en_perros.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema :La Enfermedad que tiene el paciente es:
       DENGUE")   
    )
    (if (eq ?respuesta "No")
            then (assert(Pupilas dilatadas) ))
   
)


(defrule regla12
    (escalosfrios)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Tiene escalosfrios?")

    (bind ?pregunta "Tiene escalosfrios?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "Si")
    (?opciones add  "No")
   
    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))
    
    (if (eq ?respuesta "Si")
           then (assert(tiene vomitos) ));;; arreglar regla13
    (if (eq ?respuesta "No")
           then (?*VENTANA* setImagenResp "conjuntivitis_en_perros.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema :La Enfermedad que tiene el can es:
       SU ENFERMEDAD SE DESCONOCE")   
    )
  
)

(defrule regla13
    (tiene vomitos)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Presenta vomitos?")

    (bind ?pregunta "Presenta vomitos?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "Si")
    (?opciones add  "No")
    
    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))
    
    (if (eq ?respuesta "Si")
        then (assert(presenta sintomas gripales) ));;; arreglar regla14
    (if (eq ?respuesta "No")
           then (?*VENTANA* setImagenResp "glaucoma.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema :La Enfermedad que tiene el can es:
       SU ENFERMEDAD SE DESCONOCE")   
    )
   
)



(defrule regla14
    (presenta sintomas gripales)
    =>
    (?*VENTANA* setMemoriaTrabajo "presenta sintomas gripales?")

    (bind ?pregunta "presenta sintomas gripales?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "Si")
    (?opciones add  "No")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "Si")
            then (?*VENTANA* setImagenResp "piometra.png" );;IMAGEN DE MALARIA
       (?*VENTANA* setMemoriaTrabajo "Sistema :La Enfermedad que tiene el Paciente es:
       MALARIA")   
    )
    (if (eq ?respuesta "No")
            then (assert() ))
    
    
)

(defrule regla15
    (ardor en las palmas de los pies de las manos)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Tiene ardor en las palmas de los pies de las manos? ")

    (bind ?pregunta " Tiene ardor en las palmas de los pies de las manos?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "Si")
    (?opciones add  "No")
    
    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))
    
    (if (eq ?respuesta "Si")
         then (assert(presenta cansacio y depresion) ))
    (if (eq ?respuesta "No")
           then (?*VENTANA* setImagenResp "piometra.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema :La Enfermedad que tiene el can es:
       SU ENFERMEDAD SE DESCONOCE")   
    )
   
)

(defrule regla16
    (presenta cansacio y depresion)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : presenta cansacio y depresion? ")

    (bind ?pregunta "presenta cansacio y depresion?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "Si")
    (?opciones add  "No")
    
    
    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))
    
    (if (eq ?respuesta "Si")
           then (?*VENTANA* setImagenResp "tumor_venereo.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema :La Enfermedad que tiene el paciente es:
       CHIKUNGUNA")   
    )
    (if (eq ?respuesta "No")
           then (?*VENTANA* setImagenResp "tumor_venereo.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema :La Enfermedad que tiene el can es:
      ES PROBABLE QUE TENGA CHIKUNGUNA")   
    )
    
    
)
