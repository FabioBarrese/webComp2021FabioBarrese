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
        <h1 class="mt-4">libGDX - classe Animation, dai vita al tuo gioco !</h1>

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
        <a href="articolo7.jsp">il mio precedente post</a> 
        per capire di cosa sto parlando e 
        il significato di alcuni termini che utilizzerÃ² :) , 
        puoi inoltre accedere alla lista di tutti i miei articoli <a href="indiceArticoli.html" target="_blank">qui</a> .
        </p>
<br>
<br>
<p class="lead">
"Le animazioni non sono altro che il rapido accostamento in successione di immagini per dare lâillusione del movimento."
</p>
<br>
<p class="lead">
Questo Ã¨ ciÃ² che ho detto nella parte 2 di questa guida e tutto quello che faremo oggi si basa su questa frase e sul suo significato.
<br>
<br>
Scarica la foto di seguito, trascinala nella cartella assets e caricala da codice dichiarando e 
inizializzando una variabile di tipo <b>Texture</b> che in questo articolo chiamerÃ² <b><i>imm_corsa</i></b> 
(ma tu puoi chiamarla come vuoi).
<br><br>	
<img src="media/articolo8Imm1.gif" class="img-fluid rounded">
<br><br>
<p class="lead">
Per creare un'animazione in realtÃ  utilizzeremo due classi di libGDX:<br></p>
<ul>
   <li>la classe <b>Animation</b> che serve per impostare la velocitÃ  e disegnare il tutto.</li>
   <li>la classe <b>TextureRegion</b> che serve per scomporre l'immagine di sopra in piÃ¹ parti rettangolari, 
   le quali verranno sovrapposte per dare vita all'animazione.</li>
</ul>
<br>
<p class="lead">
Detto questo passiamo all'azione :) .
<br>
<br>
Dichiara le variabili scrivendo:<br></p>
<pre>
<b>
	TextureRegion[] regione ;
	Animation animazione ;
	Texture imm_corsa ;
	float statoframe;</b>
</pre><br>
<p class="lead">
poi nel metodo <b>create()</b> scrivi:<br></p>
<pre>
<b> 
	imm_corsa = new Texture("sprite-animazione.png");
	regione = new TextureRegion[30];
	TextureRegion[][] matrice_regione = TextureRegion.split(imm_corsa,imm_corsa.getWidth()/6,imm_corsa.getHeight()/5);
	int indice=0;
	for (int i =0; i&lt;5; i++) {
		for (int j=0; j&lt;6; j++){
			regione[indice++]=matrice_regione[i][j];
		}
	}
	animazione = new Animation(0.025f,regione);
	statoframe=0;</b>
</pre><br>
<p class="lead">
Con la variabile <b>regione</b> creo un'array di <b>TextureRegion</b> 
(di dimensione 30 perchÃ¨ l'immagine Ã¨ composta da 30 "regioni") 
e utilizzo la variabile <b>matrice_regione</b> per suddividere l'immagine 
in parti rettangolari di dimensioni uguali (divido la larghezza dell'immagine per 6, 
che rappresenta il numero di colonne e divido l'altezza dell'immagine per 5, che rappresenta il numero di righe), 
poi nel ciclo for aggiungo al mio array <b>regione</b> la regione contenuta nella matrice e infine con la variabile 
<b>animazione</b> imposto la velocitÃ  e l'array da cui attingere per creare l'animazione.
</p>
<br>
<p class="lead">
Nel metodo <b>render()</b> dopo <code>Gdx.gl.glClear(GL20.GL_COLOR_BUFFER_BIT);</code> scrivi 
<code>statoframe+=Gdx.graphics.getDeltaTime();</code> 
che serve ad aumentare la variabile passando come parametro la differenza tra l'ultimo frame del metodo <b>render()</b> 
e il suo precedente (in poche parole serve per contare i secondi trascorsi dalla prima chiamata del metodo <b>render()</b> 
in poi) e disegna l'animazione prima di <code>batch.end();</code> scrivendo 
<code>batch.draw(animazione.getKeyFrame(statoframe,true), 800/2, 480/2-200);</code> 
che prende come parametri il frame corrente (l'immagine) dell'animazione, il quale a sua volta prende come parametri 
i valori <b><i>statoframe</i></b> (per cambiare il frame al passare dei secondi) e <b>true</b> 
(per ripeterla all'infinito, se avessi messo <b>false</b> sarebbe finita dopo la prima esecuzione), 
e le coordinate della <b>x</b> e della <b>y</b> per posizionare l'animazione sullo schermo.
</p>
<br><br>	
<img src="media/articolo8Imm2.png" class="img-fluid rounded">
<br><br>	
<img src="media/articolo8Imm3.png" class="img-fluid rounded">
<br><br>
<p class="lead">
Per oggi Ã¨ tutto e <a href="articolo9.jsp">nel prossimo articolo</a> introdurrÃ² le classi <b>Game</b> e <b>Screen</b> 
con le quali Ã¨ possibile generare diverse schermate di gioco (menu principale, schermata punteggi, schermata delle regole, 
schermata principale di gioco).<br>
Come sempre se il post ti Ã¨ piaciuto metti mi piace o commenta in caso contrario per farmi migliorare :) .
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
