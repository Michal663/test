(load "templates.clp")
(load "pytania.clp")
(load "dane.clp")

; pseudo regula do wykonania w programi glownym
(defrule zadajPytanie		
		?i<-(pyt ?id)
		(pytanie (id ?id) (tresc ?tresc))
	=>
		(retract ?i)
		(printout t ?tresc crlf)	; test only
		;?odp = odpowiedz przypisanie z javy czy cos
		;(assert (odp ?id 1))
)



; wyznaczenie ograniczen
(defrule odpowiedzial
		?i<-(odp ?id ?odp)
		?ii<-(pytanie (id ?id) (parametr ?param) (tak $?tak) (nie $?nie))
	=>
		(retract ?i ?ii)
		(assert (ograniczenieTak ?param $?tak))
		(assert (ograniczenieNie ?param $?nie))
		(assert (odpIf ?odp))
)
(defrule wyborOdpowiedziTak
		?i<-(odpIf ?odp)
		?ii<-(ograniczenieTak ?param $?tak)
		?iii<-(ograniczenieNie ?param $?nie)
		(test (= ?odp 1))
	=>
		(retract ?i ?ii ?iii)
		(assert (ograniczenie ?param $?tak))
)
(defrule wyborOdpowiedziNie
		?i<-(odpIf ?odp)
		?ii<-(ograniczenieTak ?param $?tak)
		?iii<-(ograniczenieNie ?param $?nie)
		(test (= ?odp 0))
	=>
		(retract ?i ?ii ?iii)
		(assert (ograniczenie ?param $?nie))
)



; usuniecie danych ze zbioru wyznaczonego przez odpowiedz
(defrule zastosujOgraniczenia
		(ograniczenie ?param ?aktualny $?reszta)
		?i<-(aparat (parametry $? ?param ?aktualny $?))
	=>
		(retract ?i)
)
(defrule nastepneOgraniczenie
		?i<-(ograniczenie ?param ?aktualny $?reszta)
	=>
		(retract ?i)
		(assert (ograniczenie ?param $?reszta))
)
(defrule zakonczOgraniczenie
		?i<-(ograniczenie ?)
	=>
		(retract ?i)
		(assert (wyznaczPytanie))
)



; wyznaczenie nowego pytania

(defrule wyznaczDobrePytaniaPre
		(wyznaczPytanie)
		?i<-(pytanie (doUsuniecia "nie"))
	=>
		(modify ?i(doUsuniecia "tak"))
)
(defrule wyznaczDobrePytaniaPreEnd
		?i<-(wyznaczPytanie)
		;(not (pytanie (doUsuniecia "nie")))
	=>
		(retract ?i)
		(assert (wyznaczPytanieA))
)
(defrule wyznaczDobrePytania
		(wyznaczPytanieA)
		?i<-(pytanie (parametr ?param) (tak $? ?tak $?) (nie $? ?nie $?) (doUsuniecia "tak"))
		(aparat (parametry $? ?param ?tak $?))
		(aparat (parametry $? ?param ?nie $?))
	=>
		(modify ?i(doUsuniecia "nie"))
)
(defrule zakonczWyznaczDobrePytania
		?i<-(wyznaczPytanieA)
	=>
		(retract ?i)
		(assert (usunStarePytania))
)
(defrule usunStarePytania
		(usunStarePytania)
		?i<-(pytanie (doUsuniecia "tak"))
	=>
		(retract ?i)
)
(defrule zakonczUsunStarePytania
		?i<-(usunStarePytania)
	=>
		(retract ?i)
)