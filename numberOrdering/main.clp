;;TECNOLOGICO DE COSTA RICA
;;Inteligencia Artificial
;;Carlos Fernández Jiménez
;;programa para ordenar números de menor a mayor
;;Comandos para ejecutar el programa
;;(load ./main.clp)
;;(reset)
;;(run)


;;?varible
;;? es un comodin, toma el valor de un campo dentro de un hecho
;;$? s un comodin, toma el valor de 0 o varios campos en un hecho

;;hechos iniciales se guardan en la lista de hechos de clips
(deffacts facts
        (data -1 2 5)
        (data 0 3)
        (results)
)

(defrule ordering
        ;;antecedente, tomar valores acá se llama emparejamiento de patrones
        ?h1 <- (results $?r);;asigna a una variable
        ?h2 <- (data ?x $?d)
        (not (data ?y&:(< ?y ?x) $?))
        =>
        ;;consecuente
        ;;(printout t "-h1- " ?h1 )
        ;;(printout t "-h2- " ?h2 )
        (retract ?h1 ?h2)
        ;;(printout t ".res" $?r )
        ;;(printout t " -dat" "x-" ?x " d-" $?d "___:")
        (assert (results $?r ?x) (data ?d))
)

