const numArticoli = 21;

function setup() {
  noCanvas();
  var contenuto = JSON.parse(localStorage.getItem('contDaVis'));
  for(var i=0;i<contenuto.length;i++){
     var articolo = contenuto[i];
     console.log(articolo);
     var id = 1;
     for(var j=1;j<=numArticoli;j++)
     {
        if(articolo.search(j)!=-1)
           id=j;
     }
     console.log(id);
     var collegamento = select('#risposta'+id);
     collegamento.html(articolo);
  }
  
}