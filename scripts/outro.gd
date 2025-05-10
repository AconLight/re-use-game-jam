extends Node2D

@export var naglowek: Label
@export var akapit: Label

func _ready():
	prosze_pokazac_artykul(2)

#1 bardzo dobrze #2 srednio #3 zle #4 tramwaj nie dojechal
func prosze_pokazac_artykul(wariant : int):
	if(wariant == 1):
		naglowek.text = ("Kurs bez zarzutu!")
		akapit.text =("Jan Kowalski poprowadził dziś pierwszy tramwaj elektryczny przez Warszawę bez najmniejszych problemów. Pasażerowie chwalili spokój i pewną rękę motorniczego. Nowa era rozpoczęta z klasą!")
	elif(wariant == 2):
		naglowek.text = ("Postęp z drobnymi zgrzytami")
		akapit.text = ("Pierwszy kurs tramwaju elektrycznego zakończył się z drobnymi opóźnieniami. Jan Kowalski poradził sobie nieźle, choć nie obyło się bez nerwowych momentów. Początek obiecujący, ale wymaga szlifu.")
	elif(wariant == 3):
		naglowek.text = ("Trudny początek – ale dotarł")
		akapit.text =("Pierwszy kurs tramwaju elektrycznego nie obył się bez problemów. Jan Kowalski miał trudności z obsługą pojazdu – gwałtowne hamowanie, opóźnienia i nerwowa atmosfera wśród pasażerów.")
	elif (wariant == 4):
		naglowek.text = ("Tramwaj stanął – kurs przerwany")
		akapit.text =("Pierwszy elektryczny tramwaj utknął na trasie. Jan Kowalski nie zapanował nad maszyną, co wywołało zamieszanie wśród pasażerów. Przejazd przerwany – przyszłość elektryki pod znakiem zapytania.")
