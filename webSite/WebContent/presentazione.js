var img;
var canvas;
var alpha;
var logoPremuto;
var titolo;
var introduzione;
var testo;
var pulsanteSelezionato;
var pulsanteContatto;
var pulsanteAbout;
var pulsanteProgetti;
var pulsanteCasa;
var slider;
var colDestra;
var colSinistra;
var corpoPagina;

function preload(){
	img = loadImage("media/logo.png");	
}

function setup(){
	titolo = select('#titolo');
	introduzione = select('#introduzione');
	testo = select('#testo');
	titoloArticolo = select('#titoloArticolo');
	canvas = createCanvas(img.width,img.height);
	canvas.position(windowWidth/2-img.width/2,img.height/2);
	var logo = select('#gelato');
	pulsanteContatto = select('#contatto');
	pulsanteAbout = select('#riguardo');
	pulsanteProgetti = select('#progetti');
	pulsanteCasa = select('#casa');
	//pulsanteSelezionato mi serve per distinguere qual'è il pulsante selezionato nel codice.
	//inizialmente il pulsante Home è quello selezionato, quindi pulsanteSelezionato=pulsanteCasa.id()

	if (typeof(Storage) !== "undefined") {
		var datoConservato = localStorage.getItem("chiPremuto");
		if(datoConservato==="true"){
			//funzione asincrona
			loadJSON("media/contenutoAbout.json",fileJson);
			pulsanteSelezionato=pulsanteAbout.id();
			pulsanteAbout.style('background-color', '#000000');
			pulsanteCasa.style('background-color', '#3b5998');
		}
		else{
			//funzione asincrona
			loadJSON("media/contenutoHome.json",fileJson);
			pulsanteSelezionato=pulsanteCasa.id();
		}
	} else {
		console.log("il tuo browser non supporta le funzionalità dello Storage");
	}

	var pulsanteLogin = select('#pulsanteLogin');
	logo.mouseClicked(cambiaStato);
	inputUtente(logo);
	inputUtente(pulsanteAbout);
	inputUtente(pulsanteProgetti);
	inputUtente(pulsanteContatto);
	inputUtente(pulsanteCasa);
	inputUtente(pulsanteLogin);
	alpha=0;
	logoPremuto=false;
	colDestra = select('#colDestra');
	colSinistra = select('#colSinistra');
	corpoPagina = select('#corpoPagina');
}
//non appena ricevo i dati li posso utilizzare
function fileJson(datiCaricati){
	titolo.html(datiCaricati.titolo);
	introduzione.html(datiCaricati.introduzione);
	titoloArticolo.html(datiCaricati.titoloArticolo);
	testo.html(datiCaricati.testo);
	//adatto le colonne laterali all'altezza della pagina quando carico il testo
	colDestra.style('height',corpoPagina.size().height+200+'px');
	colSinistra.style('height',corpoPagina.size().height+200+'px');
	//creo lo slider per modificare le dimensioni del testo
	if(slider==null){
		slider=createSlider(10,100,18,1);
		slider.style('width', '100px');
		slider.input(dimensioneTesto);
		slider.parent('slider');
	}
	function dimensioneTesto(){
		console.log("ciao");
		var valore = slider.value();
		introduzione.style('font-size',valore+'px');
		testo.style('font-size',valore+'px');
		//adatto le colonne laterali all'altezza della pagina quando modifico le dimensioni del testo
		colDestra.style('height',corpoPagina.size().height+200+'px');
		colSinistra.style('height',corpoPagina.size().height+200+'px');
	}
}

function windowResized() {
	canvas.position(windowWidth/2-img.width/2,img.height/2);
	//adatto le colonne laterali all'altezza della pagina quando modifico le dimensioni della finestra
	colDestra.style('height',corpoPagina.size().height+200+'px');
	colSinistra.style('height',corpoPagina.size().height+200+'px');
}

function cambiaStato(){
	logoPremuto=true;
}

function inputUtente(elemento){
	//imposto il colore del testo degli elementi della navbar
	elemento.style('color','#ffffff');
	//se il mouse si trova sopra un elemento allora modifico il suo colore di sfondo
	elemento.mouseOver(diventaOpaco);
	//altrimenti ripristino il suo colore di sfondo
	elemento.mouseOut(diventaTrasparente);
	function diventaOpaco(){
		if(elemento.id()!=pulsanteSelezionato)
			elemento.style('background-color', '#304c82');
	}
	function diventaTrasparente(){
		if(elemento.id()!=pulsanteSelezionato)
			elemento.style('background-color', '#3b5998');
	}
	var id = elemento.id();
	//non voglio cambiare pagina quando premo i pulsanti logo e login
	if(id!="gelato" && id!="pulsanteLogin")
		elemento.mouseClicked(cambiaPagina);
	function cambiaPagina(){
		//console.log("cambiaPagina");
		if(id!=pulsanteSelezionato){
			//il pulsante precedentemente selezionato deve cambiare colore (da nero a blue)
			cambiaColore();
			// il pulsante appena cliccato deve cambiare colore (da blue a nero)
			elemento.style('background-color', '#000000');
			// in base al pulsante che premo viene caricato un contenuto diverso in modo asincrono
			if(id=="riguardo")
				loadJSON("media/contenutoAbout.json",fileJson);
			else if(id=="casa")
				loadJSON("media/contenutoHome.json",fileJson);
			else if(id=="progetti")
				loadJSON("media/contenutoProjects.json",fileJson);
			else if(id=="contatto")
				loadJSON("media/contenutoContact.json",fileJson);
			pulsanteSelezionato=elemento.id();
		}
	}
}

function cambiaColore(){
	if(pulsanteContatto.id()==pulsanteSelezionato)
		pulsanteContatto.style('background-color', '#3b5998');
	else if(pulsanteAbout.id()==pulsanteSelezionato)
		pulsanteAbout.style('background-color', '#3b5998');
	else if(pulsanteProgetti.id()==pulsanteSelezionato)
		pulsanteProgetti.style('background-color', '#3b5998');
	else if(pulsanteCasa.id()==pulsanteSelezionato)
		pulsanteCasa.style('background-color', '#3b5998');
}



function draw(){
	if(alpha<255){
		if(logoPremuto){
			tint(255,alpha);
			image(img,0,0);
			alpha+=10;
		}
	}
}
