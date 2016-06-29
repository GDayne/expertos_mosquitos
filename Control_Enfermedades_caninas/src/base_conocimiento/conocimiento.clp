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
;;;;;;;;;;;;;;;;;;;;;; INICIO REGLAS BASE DEL CONOCIMIENTO ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defrule regla1
    (Elija_Parte_Afectada)
    =>
   
   (?*VENTANA* setMemoriaTrabajo "Sistema :  QUE PARTE AFECTADA PRESENTA EL  CAN?")

    (bind ?pregunta "Que parte afectada presenta el Perro?")
    (bind ?opciones (new ArrayList))
    ;;;;;;;;;;;;;;;; Aqui elejimos la parte afectada
    (?opciones add  "PIEL")
    (?opciones add  "RESPIRATORIAS")
    (?opciones add  "OIDOS")
    (?opciones add  "OJOS")
    (?opciones add  "APARTO URUGENITAL")
    (?opciones add  "OTRAS")
    ; Aquie esta la respuesta obtenida y nos muestra el cuadro de informacion
    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))
    
    ;Aqui la opcion seleccionada de la interface preguntas
    (if (eq ?respuesta "PIEL")
         then (assert(Sintomas_que_presenta_en_la_piel)))
    (if (eq ?respuesta "RESPIRATORIAS")
             then (assert(Sintomas_respiratorias)))
    (if (eq ?respuesta "OIDOS")
             then (assert(Sintomas_de_los_oidos)))
     (if (eq ?respuesta "OJOS")
             then (assert(Sintomas_en_los_ojos)))
     (if (eq ?respuesta "APARTO URUGENITAL")
             then (assert(Sintomas_urugenitales)))
     (if (eq ?respuesta "OTRAS")
             then (assert(Otros_sintomas)))
)

(defrule regla2
    (Sintomas_que_presenta_en_la_piel)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Estas son algunas de las sintomas que podria presentar")

    (bind ?pregunta "Elije un sintoma")
    (bind ?opciones (new ArrayList))
    (?opciones add  "Cojera o dolor al caminar")
    (?opciones add  "Zonas sin pelo de forma circular")
    (?opciones add  "Inflamacion")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "Cojera o dolor al caminar")
            then (assert(Cojera o dolor al caminar) ))
    (if (eq ?respuesta "Zonas sin pelo de forma circular")
            then (assert(Zonas sin pelo de forma circular) ))
   (if (eq ?respuesta "Inflamacion")
            then (assert(Inflamacion) ))
)

(defrule regla3
    (Cojera o dolor al caminar)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Elija un nuevo sintoma para saber la enfermedad ")

    (bind ?pregunta "Elije un nuevo sintoma que presenta en la piel ")
    (bind ?opciones (new ArrayList))
    (?opciones add  "Pus infeccion y sangre")
    (?opciones add  "Llagas y grietas")
    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))
    
    (if (eq ?respuesta "Pus infeccion y sangre")
           then (?*VENTANA* setImagenResp "pododermatitis.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema :La Enfermedad que tiene el can es:
       PADODERMATITIS")   
    )
    (if (eq ?respuesta "Llagas y grietas")
           then (?*VENTANA* setImagenResp "pododermatitis.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema :La Enfermedad que tiene el can es:
       PADODERMATITIS")   
    )
)

(defrule regla4
    (Zonas sin pelo de forma circular)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Elija un nuevo sintoma para saber la enfermedad ")

    (bind ?pregunta "Elije un nuevo sintoma que presenta en la piel ")
    (bind ?opciones (new ArrayList))
    (?opciones add  "Piel lesionada o Piel abultada")
    (?opciones add  "Lesiones cutaneas benignas")
    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))
    
    (if (eq ?respuesta "Piel lesionada o Piel abultada")
           then (?*VENTANA* setImagenResp "tina_en_perros.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema :La Enfermedad que tiene el can es:
       TIÑA EN PERROS")   
    )
    (if (eq ?respuesta "Lesiones cutaneas benignas")
           then (?*VENTANA* setImagenResp "tina_en_perros.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema :La Enfermedad que tiene el can es:
       TIÑA EN PERROS")   
    )
)

(defrule regla5
    (Inflamacion)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Elija un nuevo sintoma para saber la enfermedad ")

    (bind ?pregunta "Elije un nuevo sintoma que presenta en la piel ")
    (bind ?opciones (new ArrayList))
    (?opciones add  "Enrojecimiento o Caida de pelo")
    (?opciones add  "Picazon")
    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))
    
    (if (eq ?respuesta "Enrojecimiento o Caida de pelo")
           then (?*VENTANA* setImagenResp "sarna_sarcoptica.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema :La Enfermedad que tiene el can es:
       SARNA SARCOPTICA")   
    )
    (if (eq ?respuesta "Picazon")
           then (?*VENTANA* setImagenResp "sarna_sarcoptica.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema :La Enfermedad que tiene el can es:
       SARNA SARCOPTICA")   
    )
)



;;;;;;;;;;; REGLAS DE LAS ENFERMEDADES RESPIRATORIAS
(printout t "REGLAS DE LAS ENFERMEDADES RESPIRATORIAS" crlf)

(defrule regla6
    (Sintomas_respiratorias)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Estas son algunas de los sintomas de ENFERMEDADES RESPIRATORIAS")

    (bind ?pregunta "Elije un sintoma Respiratorio ")
    (bind ?opciones (new ArrayList))
    (?opciones add  "Secresiones Nasales")
    (?opciones add  "Vomitos")
    (?opciones add  "Diarrea")
    
    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "Secresiones Nasales")
            then (assert(Secresiones Nasales) ))
    (if (eq ?respuesta "Vomitos")
            then (assert(Vomitos) ))
   (if (eq ?respuesta "Diarrea")
            then (assert(Diarrea) ))
)

(defrule regla7
    (Secresiones Nasales)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Elija un nuevo sintoma para saber la enfermedad ")

    (bind ?pregunta "Elije un nuevo sintoma que presenta")
    (bind ?opciones (new ArrayList))
    (?opciones add  "Conjuntivitis")
    (?opciones add  "Tos seca")
    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))
    
    (if (eq ?respuesta "Conjuntivitis")
           then (?*VENTANA* setImagenResp "tos_de_las_perreras.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema :La Enfermedad que tiene el can es:
       TOS DE LAS PERRERAS")   
    )
    (if (eq ?respuesta "Tos seca")
           then (?*VENTANA* setImagenResp "tos_de_las_perreras.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema :La Enfermedad que tiene el can es:
       TOS DE LAS PERRERAS")   
    )
)

(defrule regla8
    (Vomitos)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Elija un nuevo sintoma para saber la enfermedad ")

    (bind ?pregunta "Elije un nuevo sintoma que presenta")
    (bind ?opciones (new ArrayList))
    (?opciones add  "Dolor muscular o fiebre")
    (?opciones add  "Problemas respiratorios")
    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))
    
    (if (eq ?respuesta "Dolor muscular o fiebre")
           then (?*VENTANA* setImagenResp "leptospirosis_canina.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema :La Enfermedad que tiene el can es:
       LEPTOSPIROSIS CANINA")   
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