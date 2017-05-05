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
        (parent juana mary)
        (parent mary james)
        (parent mary evelyn)
        (parent george juan)
        (female donna)
        (male george)
        (female juana)
        (female mary)
        (female evelyn)
        (male james)
        (male juan)
        (male john)
)

;;===============objects needed=============================================
;;(deftemplate RelationShip(slot grandFather))


;;===============reglas de inputs===========================================
(defrule getNames
   (declare (salience 100))
   =>
   (printout t "Enter first name: ")
   (bind ?name1 (read))
   (printout t "Enter second name: ")
   (bind ?name2 (read))
   (printout t "--------Results--------" crlf)

  ;;(assert (RelationShip (grandFather ?name1 ?name2))))
   (assert (abuelo ?name1))
   ;;(assert (nieto ?name2))
)

;;===============reglas=====================================================

(defrule brotherRelation
    (male ?x)
    (parent ?z ?x)
    (parent ?z ?y)
    (test (not (eq ?y ?x)))
   =>
    (assert (brother ?x ?y))
)

(defrule sisterRelation
    (female ?x)
    (parent ?z ?x)
    (parent ?z ?y)
    (test (not (eq ?y ?x)))
   =>
    (assert (sister ?x ?y))
)

(defrule brother0rSisterRelation
    (parent ?z ?x)
    (parent ?z ?y)
    (test (not (eq ?y ?x)))
   =>
    (assert (brother-sister ?x ?y))
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
    (male ?x)
   =>
    (assert (grandFather ?x ?y))
)

(defrule grandMotherRelation
    (parent ?x ?z)
    (parent ?z ?y)
    (female ?x)
   =>
    (assert (grandMother ?x ?y))
)

(defrule grandChildRelation
    (grandFather ?z ?x)
    (male ?x)   
   =>
    (assert (grandChild ?x ?z))
)

(defrule grandDaugtherRelation
    (grandFather ?z ?x)
    (female ?x)   
   =>
    (assert (grandDaugther ?x ?z))
)


(defrule uncleRelation
    (parent ?z ?x)
    (brother ?y ?z)  
   =>
    (assert (brother ?y ?x))
)

(defrule auntRelation
    (parent ?z ?x)
    (sister ?y ?z)  
   =>
    (assert (aunt ?y ?x))
)


(defrule grandFatherOrGrandMotherRelation
    (parent ?x ?z)
    (parent ?z ?y)
   =>
    (assert (grandFather-grandMother ?x ?y))
)



;;===============reglas para evaluar estados finales===============================================
(defrule isGrandFather
    ;;?b <- (abuelo ?x)
    ;;(bind ?r2 ((facts  ?resp2)))
    ;;(grandFather ?a ?b)
    (grandFather ?a ?b)
   =>
    (printout t ?a " is GrandFather of: " ?b crlf)
)

(defrule isNotGrandFather
   (not (grandFather ?resp1 ?resp2))
   =>
    (printout t "Not is grand father" crlf)
)

(defrule isGrandMother
   (grandMother ?a ?b)
   =>
    (printout t ?a " is GrandMother of: " ?b crlf)
)

(defrule isNotGrandMother
    (not (grandMother ?resp1 ?resp2))
   =>
    (printout t "Not is grand mother" crlf)
)


