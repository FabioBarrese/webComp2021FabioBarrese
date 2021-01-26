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
  <script src="p5.min.js"></script>
  <script src="p5.dom.min.js"></script>
  <script src="p5.sound.min.js"></script>
  <script src="orologio.js"></script>
</head>

<body>

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="index.html" target="_blank">Pensiero Tecnologico</a>
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
        <h1 class="mt-4">libGDX - Disegna il tuo gioco !</h1>

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
        <p class="lead">Prima di proseguire nella lettura ti consiglio di leggere <a href="articolo2.jsp">il mio precedente post</a> per capire di cosa sto parlando e il significato di alcuni termini che utilizzerÃ² :) , puoi inoltre accedere alla lista di tutti i miei articoli <a href="indiceArticoli.html" target="_blank">qui</a> .
Per comprendere quello che sto per spiegare devi inoltre entrare nella giusta logica perciÃ² ti faccio una domanda : che cosâÃ© un gioco per te ? (rispondi commentando perchÃ© sono curioso :) ) .
Sostanzialmente un gioco Ã¨ un susseguirsi di immagini che  vengono mostrate a schermo .
Certo potresti ribattere dicendomi che Ã¨ una spiegazione riduttiva e superficiale in quanto un gioco comprende animazioni , effetti particellari , transizioni tra diverse schermate di gioco e chi piÃ¹ ne ha piÃ¹ ne metta ; bene , tutto vero ma ripeto tutte queste cose non sono altro che un susseguirsi di immagini , nel dettaglio :

-Le animazioni non sono altro che il rapido accostamento in successione di immagini per dare lâillusione del movimento.  
-Gli effetti particellari , che creeremo in futuro utilizzando il Particle Editor , sono basati anchâ essi su unâimmagine che deve essere appositamente caricata da codice .
-Le transizioni si ottengono modificando le dimensioni , il colore e il canale alfa di unâimmagine . 

Quindi in poche parole il nostro gioco in libGDX si basa sul âdisegnoâ e la modifica a runtime (durante lâesecuzione del gioco) di immagini caricate da codice ; detto questo voglio introdurti le classi SpriteBatch e Texture che servono a tale scopo : il primo serve per disegnare le immagini ( che verranno disegnate in continuazione nel render () ) , la seconda rappresenta lâimmagine vera e propria ( ci permette di caricare lâimmagine da codice e altre operazioni ) .
Il disegno di unâimmagine prevede <b>TRE STEP</b> :
</p>
<br>
<ol>
   <li> Dichiarazione delle variabili  </li>
   <li> Inizializzazione delle variabili </li>
   <li> Disegno </li>
</ol>
<img src="media/articolo3Imm1.png" class="img-fluid rounded">
<br><br><br>
<p class="lead">Lo step 2 Ã¨ importante perchÃ© se non si inizializza una variabile il programma darÃ  errore , una <b>NullPointerException</b> per lâesattezza . 

Per farti capire meglio facciamo unâesempio pratico.<br><br> 

Apri il progetto che ti ho fatto creare nel <a href="articolo1.jsp" target="_blank">mio primo post</a> e accedi al file DesktopLauncher.java nella cartella mygdx-game-desktop.<br>
Tra le due righe di codice inserisci:</p>
<br>
<ul>
<li>config.width = 800 ;</li>
<li>config.height = 480 ;</li>
</ul>
<br><br>
<img src="media/articolo3Imm2.png" class="img-fluid rounded">
<br><br>
<p class="lead">
CosÃ¬ facendo abbiamo stabilito da codice le dimensioni della finestra allâavvio del programma (800 X 480) .<br>
Come dimostra la foto dello step 2 , il codice per caricare lâimmagine  Ã¨ img = new Texture (ânometuaimmagine.formatoâ);  (ovviamente non devi chiamarla per forza img )  , mentre lo step 3 Ã¨ il seguente :</p>
<ul>
<li><b>batch.begin();</b></li>           
<li><b>batch.draw (img,0,0);</b></li>
<li><b>batch.end();</b> </li>
</ul>
<br><br>
<p class="lead"> <b>batch.begin();</b> e <b>batch.end();</b>  non vanno mai omessi infatti non Ã¨ possibile disegnare le immagini al di fuori di queste due righe altrimenti il programma da errore . <br>
<b>batch.draw(img,0,0);</b> consiste nel âdisegnoâ vero e proprio dellâimmagine e prende come parametri lâimmagine che hai caricato e la posizione della x e della y da dove partire a disegnare :<br>
le coordinate dello schermo in libGDX vengono calcolate con la y che va verso lâalto e la x che va verso destra ( la normalitÃ  )  quindi in questo caso abbiamo una x con valore 0 e anche la y , che coincidono con lâangolo in basso a sinistra della finestra ; tutte le immagini vengono disegnate a partire dallâangolo in basso a sinistra , perciÃ² in questo caso lâangolo in basso a sinistra dellâ immagine e lâangolo in basso a sinistra della finestra coincidono .<br>
Adesso facciamo unâesperimento  (dopo la spiegazione allegherÃ² le foto tranquilla/o).<br>

Dichiara la variabile <b>float a</b>  e nel metodo <b>create ()</b> inizializza la variabile scrivendo <b>a=0;</b> .  Nel <b>render ()</b> dopo il disegno aumenta il valore di a di 1 scrivendo <b>a+=1;</b> e aggiungi i valori di larghezza e altezza scrivendo <b>batch.draw(img,0,0,a,a);</b> , avvia il programma e guarda cosa succede :) .</p>
	<br><br>	
<img src="media/articolo3Imm3.png" class="img-fluid rounded">
<br><br>
<p class="lead">Ora prova invece a lasciare invariate larghezza e altezza e sostituisci la x e la y con la variabile <b>a</b> scrivendo <b>batch.draw (img,a,a);</b> , avvia il programma e vedi cosa succede :) .</p>
<br><br>
<img src="media/articolo3Imm4.png" class="img-fluid rounded">  
<br><br>
<p class="lead">Complimenti hai creato le tue prime animazioni utilizzando libGDX  :) .
<br>
Prima di concludere voglio parlarti di queste due linee di codice :</p>
<ul>
<li> <b>Gdx.gl.glClearColor(1,0,0,1);</b><br>
serve per colorare lo schermo e deve essere sempre allâinizio del render (); in libGDX i parametri rgba del colore sono compresi nellâintervallo 0-1 perciÃ² in questo caso abbiamo 1 rosso (il massimo ) 0 verde , 0 blu e 1 il canale alpha (0 = trasparente 1=opaco al massimo) , quindi lo schermo sarÃ  rosso ( non serve se utilizzi un âimmagine di sfondo che copre tutto lo schermo ).
 <br></li>
<li> <b>Gdx.gl.glClear(GL20.COLOR_BUFFER_BIT); </b><br>
questo Ã¨ importantissimo e non deve mai mancare in quanto pulisce il buffer , se manca ci saranno seri problemi nel disegno delle immagini , deve essere sempre allâinizio del render () .
</li>
</ul>
<br><br>
<p class="lead">
Per oggi Ã¨ tutto e nella <a href="articolo4.jsp">prossima guida</a> introdurrÃ² la classe OrthographicCamera (una sorta di âtelecamera virtuale â) poichÃ© eâ importantissima per lo sviluppo del tuo gioco e dal prossimo articolo non ne potrai fare piÃ¹ a meno ( ti permette di fare lo zoom , di seguire il giocatore e tanto altro ) .
Metti mi piace se il post ti Ã¨ piaciuto , in caso contrario dimmi la tua opinione nei commenti ;)
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
