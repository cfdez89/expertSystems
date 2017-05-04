;;TECNOLOGICO DE COSTA RICA
;;Inteligencia Artificial
;;Carlos Fernández Jiménez

;;Comandos para ejecutar el programa
;;(load ./main.clp)
;;(reset)
;;(run)



;;hechos iniciales
(deffacts hechosIniciales
        "Hechos iniciales del programa"
        (animal Tucky)
        (animal Piolin)
        (esqueleto Piolin si)
        (esqueleto Tucky si)
        (ladra Tucky)
)

(defrule GetOriginal
   (declare (salience 100))
   =>
   (printout t "Enter String: ")
)
;;reglas
(defrule regla1
    (animal ?nombre)
    (esqueleto ?nombre si)
    =>
    (assert (vertebrado ?nombre))
)

(defrule regla2
    (animal ?nombre)
    (esqueleto ?nombre no)
    =>
    (assert (invertebrado ?nombre))
)

(defrule regla3
    (vertebrado ?nombre)
    (ladra ?nombre)
    =>
    (assert (perro ?nombre))
)

(defrule regla4
    (perro ?nombre)
    =>
    (printout t 'si es perro' crlf)
)

(defrule regla5
    (not (perro ?nombre))
    =>
    (printout t 'otro animal' crlf)
)




;;funciones
(deffunction Animal(?a)
   ;;(bind ?res ?a)
   ;;(printout t ?res crlf)
   (assert (animal ?a))

)