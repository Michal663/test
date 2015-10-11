(deftemplate MAIN::aparat
	(multislot parametry
		(type STRING)
	)
)

(deftemplate MAIN::pytanie
	(slot id
		(type INTEGER)
	)
	
	(slot tresc
		(type STRING)
	)
	
	(slot parametr
		(type STRING)
	)
	
	(multislot nie
		(type STRING)
	)
	
	(multislot tak
		(type STRING)
	)
	
	(slot doUsuniecia
		(type STRING)
	)
)


	