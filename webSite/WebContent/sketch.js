var particelle=[];
var immagine;
var canvas;
var elementoDom;
var posizioneDom;
var surrogatoImg;
var numParticelleArrivate;
var disegnaImmagine;
var alpha;
var mouseSopra;
var tutteFerme;
function preload() {
	immagine = loadImage('media/fabio.png');
	surrogatoImg = loadImage('media/surrogatoImmagine.png');

}

function setup() {
	canvas=createCanvas(immagine.width,immagine.height);

	if (typeof(Storage) !== "undefined") {
		//uso l'oggetto predefinito localStorage che mi consente di conservare i dati localmente
		//così da poterli condividere tra le pagine web
		localStorage.setItem("chiPremuto","false");
		//seleziono il pulsante 'chi'
		var pulsChi = select('#pulsChi');
		// aggiungo un ascoltatore di eventi per il pulsante 'chi'
		pulsChi.mouseClicked(modificaDato);
		function modificaDato(){
			//se il pulsante è stato cliccato chiPremuto diventa true
			localStorage.setItem("chiPremuto","true");
		}
		//seleziono il pulsante cosa
		var pulsCosa = select('#pulsCosa');
		// aggiungo un ascoltatore di eventi per il pulsante 'cosa'
		pulsCosa.mouseClicked(mostraHome);
		function mostraHome(){
			//se il pulsante è stato cliccato chiPremuto diventa false
			localStorage.setItem("chiPremuto","false");
		}
	} else {
		console.log("il tuo browser non supporta le funzionalità dello Storage");
	}

	elementoDom = select('#fabioId');
	posizioneDom = elementoDom.position();
	canvas.position(posizioneDom.x,posizioneDom.y);
	surrogatoImg.loadPixels();
	var inizio=0;
	for(let i=0;i<surrogatoImg.width;i++){
		for(let j=0;j<surrogatoImg.height;j++){
			var pixel = surrogatoImg.get(i,j);
			var colore = color(pixel);
			particelle[inizio++]=new Particella(immagine.width*i/surrogatoImg.width,immagine.height*j/surrogatoImg.height,colore);
		}
	}
	numParticelleArrivate=0;
	disegnaImmagine=false;
	alpha=0;
	mouseSopra=false;
	canvas.mouseOver(on);
	canvas.mouseOut(off);
	tutteFerme=false;
}

function on(){
	mouseSopra=true;
	if(tutteFerme)
		tutteFerme=false;
}
function off(){
	mouseSopra=false;
}

function windowResized() {
	posizioneDom = elementoDom.position();
	canvas.position(posizioneDom.x,posizioneDom.y);
}

function draw() {
	if(!tutteFerme || mouseSopra){
		clear();
		if(disegnaImmagine){
			if(alpha<255)
				alpha+=10;
			tint(255,alpha);
			image(immagine,0,0);
		}
		tutteFerme=true;
		for(let i=0;i<particelle.length;i++){
			particelle[i].update();
			particelle[i].show(15);
			if(particelle[i].getId()==0)
				tutteFerme=false;
			if(particelle[i].getId()==1 && numParticelleArrivate<particelle.length)
				numParticelleArrivate++;
			else if(numParticelleArrivate==particelle.length){
				particelle[i].attivaFlag();
				disegnaImmagine=true;
			}
		}
	}
}