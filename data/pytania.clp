(deffacts pytania
	(pytanie
		( id 1 )
		( tresc "Czy jestes mezczyzna\?" )
		( parametr "kolor" )
		( nie "czarny" "szary" )
		( tak "zolty" )
		( doUsuniecia "nie" )
	)
	
	(pytanie
		( id 2 )
		( tresc "Czy jestes profesjonalista\?" )
		( parametr "typ" )
		( nie "analog" "lustrzanka" )
		( tak "analog" "hybryda" "kompakt" )
		( doUsuniecia "nie" )
	)
	
	(pytanie
		( id 3 )
		( tresc "Czy posiadasz komputer\?" )
		( parametr "typ" )
		( nie "hybryda" "kompakt" "lustrzanka" )
		( tak "analog" )
		( doUsuniecia "nie" )
	)
	
	(pytanie
		( id 4 )
		( tresc "Czy interesujesz sie portretami\?" )
		( parametr "dluga_ogniskowa" )
		( nie "100" "105" "158" "165" "216" "250" "392" "432" "500" "504" "560" "600" "840" )
		( tak "35" "40" "42" "50" "52" "70" "75" "83" "95" )
		( doUsuniecia "nie" )
	)
	
	(pytanie
		( id 5 )
		( tresc "Czy interesujesz sie krajobrazami\?" )
		( parametr "krotka_ogniskowa" )
		( nie "22" "24" "25" "27" "28" )
		( tak "30" "33" "35" "40" "50" "52" "70" "95" )
		( doUsuniecia "nie" )
	)
	
	(pytanie
		( id 6 )
		( tresc "Czy interesujesz sie dokumentem\?" )
		( parametr "przyslona" )
		( nie "1.2" "1.4" "1.8" "2.0" "2.5" "2.7" "2.8" )
		( tak "3.1" "3.2" "3.3" "3.5" "4,0" )
		( doUsuniecia "nie" )
	)
	
	(pytanie
		( id 7 )
		( tresc "Czy planujesz robic zdjecia w trudnych warunkach oswietleniowych w pomieszczeniu\?" )
		( parametr "lampa_blyskowa" )
		( nie "wbudowana" "zewnetrzna" )
		( tak "brak" )
		( doUsuniecia "nie" )
	)
	
	(pytanie
		( id 8 )
		( tresc "Czy w przyszlosci chcesz inwestowac w rozbudowe akcesoriow\?" )
		( parametr "typ" )
		( nie "analog" "bezlusterkowy" "lustrzanka" )
		( tak "kompakt" "hybryda" )
		( doUsuniecia "nie" )
	)
	
	(pytanie
		( id 9 )
		( tresc "Czy planujesz drukowac zdjecia w duzych formatach\?" )
		( parametr "mpx" )
		( nie "0.0" "16.0" "16.1" "16.2" "18.0" "20.2" "21.1" "28.0" "37.5" )
		( tak "10.0" "10.2" "12.0" "12.1" "12.2" "14.0" "14.1" "14.2" )
		( doUsuniecia "nie" )
	)
	
	(pytanie
		( id 10 )
		( tresc "Czy interesujesz sie fotografowaniem ptakow lub samolotow\?" )
		( parametr "dluga_ogniskowa" )
		( nie "392" "432" "500" "504" "560" "600" "840" )
		( tak "35" "40" "42" "50" "52" "70" "75" "83" "95" "100" "105" "158" "165" "216" "250" )
		( doUsuniecia "nie" )
	)
	
	(pytanie
		( id 11 )
		( tresc "Czy interesujesz sie astrofotografia\?" )
		( parametr "max_iso" )
		( nie "3200" "6400" "12800" "16000" "25600" )
		( tak "800" "1250" "1600" )
		( doUsuniecia "nie" )
	)
	
	(pytanie
		( id 12 )
		( tresc "Czy jedynymi wykonywanymi zdjeciami beda astrofotografie\?" )
		( parametr "model" )
		( nie "20da" )
		( tak "5D Mark II" "Bessa R3A" "D3000" "D5100" "DMC-GF2K" "DMC-LX7" "DSC-HX20V" "DSC-RX100" "EOS M" "FinePix AX500" "FinePix S2980" "Fun_Saver" "Instax-210" "Lumix DMC-FZ200" "M7" "NX100" "Pen E-P3" "PowerShot SX1 IS" "Powershot SX40 HS" "S2" "SLT-A57" "SX220" "WB150F" "X5" "X-Pro1" )
		( doUsuniecia "nie" )
	)

	(pytanie
		( id 13 )
		( tresc "Czy bedziesz wykonywac zdjecia w trudnych warunkach oswietleniowych na zewnatrz\?" )
		( parametr "stabilizacja" )
		( nie "cyfrowa" "optyczna" )
		( tak "brak" )
		( doUsuniecia "nie" )
	)
	
	(pytanie
		( id 14 )
		( tresc "Czy aparat bedzie podstawowym aparatem\?" )
		( parametr "zoom" )
		( nie "3.0" "3.06" "3.6" "4.38" "5.0" "5.83" "7.71" "10.0" "14.0" "18.0" "20.0" "24.0" "26.4" "36.0" )
		( tak "1.0" "2.5" )
		( doUsuniecia "nie" )
	)
	
	(pytanie
		( id 15 )
		( tresc "Czy aparat bedzie czesto noszony\?" )
		( parametr "waga" )
		( nie "116" "119" "130" "1410" "188" "213" "215" "221" "282" "321" "340" )
		( tak "437" "475" "485" "507" "530" "537" "539" "585" "600" "610" "630" "685" "800" "810" )
		( doUsuniecia "nie" )
	)
	
	(pytanie
		( id 16 )
		( tresc "Czy planujesz wydac na aparat wiecej niz 1000 zlotych\?" )
		( parametr "cena" )
		( nie "1270" "1300" "1350" "1800" "1925" "2180" "2400" "2444" "2500" "2890" "4200" "5650" "600" "7500" "11950" "78000" "130000" )
		( tak "14" "160" "170" "300" "486" "520" "922" "995" )
		( doUsuniecia "nie" )
	)
	
	(pytanie
		( id 17 )
		( tresc "Czy aparat powinien byc bardziej wytrzymaly\?" )
		( parametr "marka" )
		( nie "Canon" "Fuji" "Leica" "Nikon" "Olympus" "Voigtlander" )
		( tak  )
		( doUsuniecia "nie" )
	)
	
	(pytanie
		( id 18 )
		( tresc "Czy interesujesz sie zdjeciami makro\?" )
		( parametr "min_ostrosc" )
		( nie "10" "15" "20" "30" "50" "70" "100" "280" "300" )
		( tak "370" "400" "450" "480" "500" "550" "900" )
		( doUsuniecia "nie" )
	)
	
	(pytanie
		( id 19 )
		( tresc "Czy wazna jest jakosc obrazu [brak szumow itp.]\?" )
		( parametr "rozmiar_matrycy" )
		( nie "0.0" "1.0" "1.06" "1.11" "1.33" "1.70" "2.13" )
		( tak "0.429" "0.434" )
		( doUsuniecia "nie" )
	)
)