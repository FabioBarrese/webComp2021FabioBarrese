var testo;
var canvas;
var orologio;
var larghezza;
var ask;
var pulsanteGo;
var contenuto;
var possoUtilizzare;
var contenutoDaVisualizzare;
function preload() {
 testo=loadFont("media/LemonMilk.otf");
}

function setup() {
	// mostra l'email (non riguarda l'orologio)
	var pulsante = select('#contatto');
	 pulsante.mouseClicked(mostraemail);
	 
	larghezza = windowWidth/6;
  orologio = select('#orologio');
  canvas=createCanvas(larghezza,larghezza);
  canvas.parent(orologio);
  textFont(testo);
  textSize(larghezza/10);
  angleMode(DEGREES);
  
  //imposto le variabili che riguardano la ricerca (non riguarda l'orologio)
  cercaSetup();
    
}

// mostro l'email , (non riguarda l'orologio)
function mostraemail(){
	window.alert("fabiobarrese1996@gmail.com");
}

function draw() {
	clear();
	var ore = hour();
	var col = color(0,220,120);
	disegnaOrologio(ore,24,canvas.width-8,canvas.height-8,col);
	var minuti=minute();
	col = color(120,0,220);
	disegnaOrologio(minuti,60,canvas.width-20,canvas.height-20,col);
	var secondi=second();
	col = color(220,0,120);
	disegnaOrologio(secondi,60,canvas.width-32,canvas.height-32,col);
	var testo='';
	testo+=formatta(ore);
	testo+=':'+formatta(minuti);
	testo+=':'+formatta(secondi);
  text(testo,canvas.width/2-larghezza/5,canvas.height/2+10);

    
}

function disegnaOrologio(dato,tempo,Largh,Alte,colore){
	strokeWeight(5);
	stroke(colore);
	var end = map(dato,0,tempo,0,360);
	arc(canvas.width/2,canvas.height/2,Largh,Alte,0,end);
	noStroke();
}

function formatta(dato){
	if(dato<10)
		return '0'+dato;
	return dato;
}

function windowResized() {
  larghezza=windowWidth/6;
  canvas.size(larghezza,larghezza);
  textSize(larghezza/10);
}
//riguarda la barra di ricerca, non l'orologio
function cercaSetup(){
   possoUtilizzare=false;
   loadJSON("media/articoli.json",fileJson);
   ask = select('#domanda');
   pulsanteGo = select('#pGo');
   pulsanteGo.mouseClicked(cerca);
}

//non appena ricevo i dati li posso utilizzare. riguarda la barra di ricerca, non l'orologio
function fileJson(articoliCaricati){
   contenuto = articoliCaricati.contenuto;
   possoUtilizzare = true;
}
//effettua la ricerca quando premo il pulsante
function cerca(){
	if(possoUtilizzare){
		var domandaOriginale = ask.value();
		var domanda = domandaOriginale.toLowerCase();
		console.log(domanda.length);
        if(domanda.length>0){
           contenutoDaVisualizzare = [];
           for(var i=0;i<contenuto.length;i++){
                var contenutoPiccolo = contenuto[i].toLowerCase();
           		if(contenutoPiccolo.search(domanda)!=-1)
           		   contenutoDaVisualizzare.push(contenutoPiccolo);
           }
           var lunghezza = contenutoDaVisualizzare.length;
           console.log(lunghezza);
           if(lunghezza>0){
                localStorage.removeItem("contDaVis");
           		localStorage.setItem("contDaVis",JSON.stringify(contenutoDaVisualizzare));
           		open('articoliRicercati.html', '_blank');
           }
        }
    }
   
}