<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%
		if(session.getAttribute("uname")==null){
			response.sendRedirect("login.jsp");
		}
%>
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Fabio Barrese - libGDX tutorials</title>
  
  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/blog-post.css" rel="stylesheet">
  <!-- mio CSS -->
  <link href="css/mioStile.css" rel="stylesheet">
  <!-- script files -->
  <script src="p5.min.js"></script>
  <script src="p5.dom.min.js"></script>
  <script src="p5.sound.min.js"></script>
  <script src="orologio.js"></script>
</head>

<body>

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="index.html">Pensiero Tecnologico</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="presentazione.html" target="_blank">Home 
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="https://www.udemy.com/user/fabio-barrese-2/" target="_blank">About</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#" id='contatto'>Contact</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <!-- Page Content -->
  <div class="container">

    <div class="row">

      <!-- Post Content Column -->
      <div class="col-lg-8">

        <!-- Title -->
        <h1 class="mt-4">libGDX - Creiamo Snake, mangia !</h1>

        <!-- Author -->
        <p class="lead">
          by
          <a href="https://www.udemy.com/user/fabio-barrese-2/" target="_blank">Fabio Barrese</a>
        </p>

        <hr>

        <!-- Date/Time -->
        <p>Posted on January 1, 2019 at 12:00 PM</p>

        <hr>

        <!-- Preview Image -->
        <img class="img-fluid rounded" src="media/immArticolo.jpg" alt="">

        <hr>

        <!-- Post Content -->
        <h3>Descrizione</h3>
        <p class="lead">Prima di proseguire nella lettura ti consiglio di leggere 
        <a href="articolo15.jsp">il mio precedente post</a> 
        per capire di cosa sto parlando e 
        il significato di alcuni termini che utilizzerÃ² :) , 
        puoi inoltre accedere alla lista di tutti i miei articoli <a href="indiceArticoli.html" target="_blank">qui</a> .
        </p>
<br>
<br>
<p class="lead">
Di seguito ti insegnerÃ² come inserire un nuovo tipo di cibo che, 
se mangiato dal serpente, darÃ  piÃ¹ punti, tuttavia ci sarÃ  un tempo limite : 
<i id=sottolineato>dopo 5 secondi il cibo sparirÃ </i>.
<br>
Inserisci nella cartella assets un'immagine che rappresenti il nuovo cibo (io ho inserito l'immagine di un uovo piÃ¹ grande).
<br>
Caricala e inizializzala come abbiamo sempre fatto e utilizza un rettangolo per disegnarla sullo schermo, in modo tale da poter gestire le collisioni.
<br> 
Per far apparire il nuovo cibo dobbiamo aggiungere un contatore e aumentarlo di uno ogni volta che il serpente mangia il cibo normale e quando il contatore arriva a 5 
posizioneremo sullo schermo il cibo grande per 5 secondi in una posizione casuale all'interno dello schermo 
(come abbiamo fatto per il cibo normale): se il rettangolo del nuovo cibo entra in contatto con il rettangolo del serpente, 
aumenta di due elementi la lunghezza di quest'ultimo (non piÃ¹ di uno come per il cibo normale), 
fai partire l'effetto sonoro, aumenta il contatore dei punti di trenta, 
imposta il testo della label con il punteggio aggiornato e infine posiziona il cibo appena mangiato fuori dallo schermo.
<br>
Per calcolare il tempo trascorso dall'apparizione del nuovo cibo dobbiamo utilizzare la funzione 
<code id=sfondoColorato>TimeUtils.nanoTime()</code> , 
che calcola i nanosecondi trascorsi dal'avvio del programma, e una variabile di tipo <code id=fusione>long</code> 
che in questo post chiamerÃ² <code id=fusioneV>tempo</code> che conterrÃ  il valore dei nanosecondi dall'avvio del gioco al momento dell'apparizione del nuovo cibo: 
se la differenza tra la funzione vista sopra e la variabile <code id=fusioneV>tempo</code> sarÃ  maggiore di o uguale a 5 secondi l'uovo grande scomparirÃ .
<br>
Ecco il codice completo del metodo <code id=sfondoColorato>show()</code> :
<br>
</p>
<pre>
<code id=variabile>uovogrande</code> = new Texture (<code id=variabile>"uovo_grande.png"</code>);
<code id=variabile>rectuovogrande</code> = <code id=parolaChiave>new</code> Rectangle();
<code id=variabile>rectuovogrande</code>.width=<code id=variabile>uovogrande</code>.getWidth();
<code id=variabile>rectuovogrande</code>.height=<code id=variabile>uovogrande</code>.getHeight();
<code id=variabile>rectuovogrande</code>.x=850;
<code id=variabile>rectuovogrande</code>.y=0;
<code id=variabile>conta</code>=0;
<code id=variabile>countdown</code>=<code id=parolaChiave>false</code>;
</pre>
<br>
<p class="lead">
Ecco il codice completo del metodo <code id=sfondoColorato>render(<code id=parolaChiave>float</code> delta)</code> :
<br>
</p>
<pre>
<code id=parolaChiave>if</code> (<code id=variabile>countdown</code>){
    <code id=parolaChiave>if</code> (TimeUtils.nanosToMillis(TimeUtils.nanoTime())-TimeUtils.nanosToMillis(<code id=variabile>tempo</code>)>=5000){
	    <code id=variabile>rectuovogrande</code>.x=850;
	    <code id=variabile>rectuovogrande</code>.y=0;
	    <code id=variabile>countdown</code>=<code id=parolaChiave>false</code>;
    }
}
<code id=parolaChiave>if</code> (<code id=variabile>rettangolo</code>.overlaps(<code id=variabile>rectuovogrande</code>)){
    <code id=variabile>suono</code>.play();
    <code id=variabile>punti</code>+=30;
    <code id=variabile>label</code>.setText(String.valueOf(<code id=variabile>punti</code>));
    <code id=variabile>rectuovogrande</code>.x=850;
    <code id=variabile>rectuovogrande</code>.y=0;
    <code id=variabile>immagini</code>.add(new Sprite(<code id=variabile>Snake</code>));
    <code id=variabile>rettangoli</code>.add(new Rectangle());
    <code id=variabile>ultimo</code>+=1;
    <code id=variabile>rettangoli</code>.get(<code id=variabile>ultimo</code>).x=-20
    <code id=variabile>immagini</code>.add(new Sprite(<code id=variabile>Snake</code>));
    <code id=variabile>rettangoli</code>.add(new Rectangle());
    <code id=variabile>ultimo</code>+=1;
    <code id=variabile>rettangoli</code>.get(<code id=variabile>ultimo</code>).x=-20;
    <code id=variabile>countdown</code>=<code id=parolaChiave>false</code>;
}
<code id=parolaChiave>if</code> (<code id=variabile>rettangolo</code>.overlaps(<code id=variabile>rettangolouovo</code>)) {
    <code id=variabile>immagini</code>.add(new Sprite(<code id=variabile>Snake</code>));
    <code id=variabile>rettangoli</code>.add(new Rectangle());
    <code id=variabile>ultimo</code>+=1;
    <code id=variabile>rettangoli</code>.get(<code id=variabile>ultimo</code>).x=-20;
    <code id=variabile>rettangolouovo</code>.x= MathUtils.random(0, 800-<code id=variabile>uovo</code>.getWidth());
    <code id=variabile>rettangolouovo</code>.y= MathUtils.random(0, 480-<code id=variabile>uovo</code>.getHeight());
    <code id=variabile>suono</code>.play();
    <code id=variabile>punti</code>+=5;
    <code id=variabile>label</code>.setText(String.valueOf(<code id=variabile>punti</code>));
    <code id=parolaChiave>if</code> (<code id=variabile>conta</code>&lt;5)
    	<code id=variabile>conta</code>+=1; 
    <code id=parolaChiave>if</code> (<code id=variabile>conta</code>==5){
    	<code id=variabile>rectuovogrande</code>.x=MathUtils.random(0, 800-<code id=variabile>uovogrande</code>.getWidth()); 
    	<code id=variabile>rectuovogrande</code>.y=MathUtils.random(0, 480-<code id=variabile>uovogrande</code>.getHeight());
    	<code id=variabile>conta</code>=1;
    	<code id=variabile>countdown</code>=<code id=parolaChiave>true</code>;
    	<code id=variabile>tempo</code>=TimeUtils.nanoTime();
    }
}
</pre>
<br>
<p class="lead">
La funzione <code id=sfondoColorato>TimeUtils.nanosToMillis(nanosecondi)</code> serve per trasformare i nanosecondi in millisecondi 
(altrimenti dovrei utilizzare numeri troppo grandi.
Prima di leggere il mio prossimo articolo guarda lo <a href="specialeScoiattoli.jsp" target="_blank">SPECIALE SCOIATTOLI !</a>
</p>

<br><br>
<p class="lead">
Per oggi Ã¨ tutto e <a href="articolo17.jsp">nel prossimo articolo</a> vedremo come 
inserire il menÃ¹ di pausa nel nostro gioco !
<br><br>
<b>ALLA PROSSIMA :)</b></p>
        <hr>

        

        <!-- Single Comment -->
        <div class="media mb-4">
          
          <div class="media-body">
           
          </div>
        </div>

        <!-- Comment with nested comments -->
        <div class="media mb-4">
          <div class="media-body">
            <div class="media mt-4">
              
            </div>

            <div class="media mt-4">
              
            </div>

          </div>
        </div>

      </div>

      <!-- Sidebar Widgets Column -->
      <div class="col-md-4">

        <!-- Search Widget -->
        <div class="card my-4">
          <h5 class="card-header">Search</h5>
          <div class="card-body">
            <div class="input-group">
              <input type="text" class="form-control" placeholder="Search for..." id=domanda>
              <span class="input-group-btn">
                <button class="btn btn-secondary" type="button" id=pGo>Go!</button>
              </span>
            </div>
          </div>
        </div>

        <!-- Categories Widget -->
        <div class="card my-4">
          <h5 class="card-header">Categories</h5>
          <div class="card-body">
            <div class="row">
              <div class="col-lg-6">
                <ul class="list-unstyled mb-0">
                  <li>
                    <a href="https://www.google.com/search?q=GameDev">Game Dev</a>
                  </li>
                  <li>
                    <a href="https://www.google.com/search?q=HTML">HTML</a>
                  </li>
                  <li>
                    <a href="https://www.google.com/search?q=libGDX">libGDX</a>
                  </li>
                </ul>
              </div>
              <div class="col-lg-6">
                <ul class="list-unstyled mb-0">
                  <li>
                    <a href="https://www.google.com/search?q=JavaScript">JavaScript</a>
                  </li>
                  <li>
                    <a href="https://www.google.com/search?q=CSS">CSS</a>
                  </li>
                  <li>
                    <a href="https://www.google.com/search?q=Tutorials">Tutorials</a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>

        <!-- Side Widget -->
        <div >
          <h5 ></h5>
          <div id='orologio' >
            
          </div>
        </div>

      </div>

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->

  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Fabio Barrese</p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
