function Particella(x,y,colore){
  this.posizione=createVector(random(width),random(height));
  //target per arrival behaviour è la posizione dei punti
  this.targetArrival=createVector(x,y);
  //target per flee behaviour da cui la particella vuole fuggire è il mouse
  this.targetFlee=createVector(mouseX,mouseY);
  this.velocita=p5.Vector.random2D();
  this.accelerazione=createVector();
  //velocita desiderata dall'Arrival behaviour
  this.velocitaDesiderataArrival=createVector();
  //velocita desiderata dal flee behaviour
  this.velocitaDesiderataFlee=createVector();
  this.steering=createVector();
  this.max_Velocity=5;
  this.raggioArrivo=100;
  this.colore=colore;
  this.flag=false;
  this.id=0;
}
// disegno
Particella.prototype.show=function(larghezza){
		stroke(this.colore);
		strokeWeight(larghezza);
		point(this.posizione.x,this.posizione.y);
}
// aggiungo incremento la posizione con la velocità e
// la velocità con l'accelerazione
Particella.prototype.update=function(){
		this.targetFlee.set(mouseX,mouseY);
		this.comportamento();
		this.posizione.add(this.velocita);
		this.velocita.add(this.accelerazione);
		//pulisco il vettore accelerazione
		this.accelerazione.mult(0);
}

//implemento il comportamento della particella
Particella.prototype.comportamento=function(){
  if(!this.fleeBehaviour()){
		  this.arrivalBehaviour();
  }
}

// comportamento per fare allontanare i punti dal mouse
Particella.prototype.fleeBehaviour=function(){
	if(!this.flag)
		return false;
    this.velocitaDesiderataFlee=p5.Vector.sub(this.posizione,this.targetFlee);
    var distanza = this.velocitaDesiderataFlee.mag();
    // se supero una certa distanza comincio a rallentare
  	if(distanza<this.raggioArrivo){
       //voglio che la velocità desiderata di fuga sia maggiore della velocità desiderata di arrivo
       this.velocitaDesiderataFlee.setMag(this.max_Velocity+3);
  	   this.steering=p5.Vector.sub(this.velocitaDesiderataFlee,this.velocita);
       this.accelerazione.add(this.steering);
       return true;
    }
    return false;
}
  
// comportamento per fare tornare i punti alla loro posizione iniziale
Particella.prototype.arrivalBehaviour=function(){
    this.velocitaDesiderataArrival=p5.Vector.sub(this.targetArrival,this.posizione);
    //mag() restituisce la lunghezza del vettore 
    //che in questo caso coincide con la distanza tra target e posizione della particella 
    //(target-posizione) 
    var distanza = this.velocitaDesiderataArrival.mag();
    // se mi trovo nel raggio in cui devo rallentare riduco progressivamente la velocità
  	if(distanza<this.raggioArrivo){  
       this.velocitaDesiderataArrival.setMag(this.max_Velocity*(distanza/this.raggioArrivo)); 
       if(distanza>=0 && distanza<=0.1){
    	   this.id=1;
    	   this.posizione.set(this.targetArrival.x,this.targetArrival.y);
    	   this.accelerazione.mult(0);
    	   this.velocita.mult(0);
    	   return;
       }
       else this.id=0;
  	}
  	else
       this.velocitaDesiderataArrival.setMag(this.max_Velocity);
  	this.steering=p5.Vector.sub(this.velocitaDesiderataArrival,this.velocita);
  	this.steering.limit(0.3);
    this.accelerazione.add(this.steering);
}

Particella.prototype.getId=function(){
	return this.id;
}

Particella.prototype.attivaFlag=function(){
	this.flag=true;
}
