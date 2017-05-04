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
        (parent mary1 james)
        (parent george juan)
        (female donna)
        (male george)
        (female mary)
        (male james)
        (male juan)
)

;;===============objects needed=============================================
;;(deftemplate RelationShip(slot relation))


;;===============reglas de inputs===========================================
(defrule getNames
   (declare (salience 100))
   =>
   (printout t "Enter first name: ")
   (bind ?name1 (read))
   (printout t "Enter second name: ")
   (bind ?name2 (read))


   (assert (abuelo ?name1))
   (assert (nieto ?name2))
)

;;===============reglas=====================================================

(defrule brotherRelation
    (male ?x)
    (parent ?z ?x)
    (parent ?z ?y)
   =>
    (assert (brother ?x ?y))
)

(defrule cousingRelation
    (parent ?w ?x)
    (parent ?z ?y)
    (brother ?w ?z)
   =>
    (assert (cousing ?x ?y))
)

(defrule grandFatherRelation
    (parent ?x ?z)
    (parent ?z ?y)
   =>
    (assert (grandFather ?x ?y))
)
;;===============ending rules===============================================
(defrule isGrandFather
    (grandFather ?x ?y)
   =>
    (printout t "Yes, " ?x " is GrandFather of: " ?y)
)

(defrule isNotGrandFather
   (not (grandFather ?a ?b))
   =>
    (printout t "Not is")
)


