;;TECNOLOGICO DE COSTA RICA
;;Inteligencia Artificial
;;Carlos Fernández Jiménez

;;Comandos para ejecutar el programa
;;(load ./main.clp)
;;(reset)
;;(run)

;;programa para consultar el parentesco entre personas

;;===============hechos iniciales===========================================
;;relaciones entre personas que se asumen como una verdad absoluta
;;ejem: el padre de donna es john, donna es de sexo femenino
(deffacts initialFacts
        "Hechos iniciales del programa"
        (parent john donna)
        (parent john george)
        (parent john mary)
        (parent mary james)
        (parent george juan)
        (female donna)
        (male george)
        (female mary)
        (male james)
        (male juan)
)


;;===============reglas=====================================================

(defrule isBrother
    (male ?x)
    (parent ?z ?x)
    (parent ?z ?y)
   =>
    (assert (brother ?x ?y))
)

(defrule isCousing
    (parent ?w ?x)
    (parent ?z ?y)
    (brother ?w ?z)
   =>
    (assert (cousing ?x ?y))
)

(defrule isGrandFather
    (parent ?x ?z)
    (parent ?z ?y)
   =>
    (printout t ?x " is GrandFather of: " ?y)
)
