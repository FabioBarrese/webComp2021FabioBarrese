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
        <h1 class="mt-4">libGDX - Una telecamera virtuale per il tuo gioco !</h1>

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
        <p class="lead">Prima di proseguire nella lettura ti consiglio di leggere <a href="articolo3.jsp">il mio precedente post</a> 
        per capire di cosa sto parlando e 
        il significato di alcuni termini che utilizzerÃ² :) , 
        puoi inoltre accedere alla lista di tutti i miei articoli <a href="indiceArticoli.html" target="_blank">qui</a> .
        </p>
<br>
<br>
<p class="lead">
<a href="articolo3.jsp" target="_blank">Nell'articolo precedente</a> ti ho detto che la creazione delle immagini Ã¨ composta da tre step , 
ma avrei dovuto anche dirti che in realtÃ  tutti gli oggetti in libgdx prevedono questi step, cioÃ¨:
</p>
<br>
<ol>
<li><b>la dichiarazione (step 1 )</b></li>
<li><b>lâinizializzazione (step 2 )</b></li>
<li><b>lâutilizzo (step 3 ) dell'oggetto</b></li>
</ol>
<br>
<p class="lead"> Adesso che lo sai, puoi continuare a leggere.</p>
<br>
<p class="lead">
Per comprendere la classe <b>OrthographicCamera</b> immagina le funzioni di una telecamera reale : 
nel nostro gioco potremo fare lo zoom sulle immagini , muovere la telecamera ( per esempio per seguire il giocatore ) , 
possiamo persino capovolgerla in modo tale che tutte le immagini vengano visualizzate a testa in giÃ¹ ; 
in poche parole avremo una "telecamera virtuale" a disposizione del nostro gioco 
(dopo la spiegazione come sempre allegherÃ² le foto per farti capire meglio). <br>
Nellâaltro articolo ti ho detto che la telecamera Ã¨ molto importante ,
infatti Ã¨ presente nel 99 percento dei giochi creati in libGDX   , 
serve inoltre nei giochi che utilizzano <b>box2d</b> per convertire i pixel in metri 
( ma ne parlerÃ² nel dettaglio quando farÃ² lâarticolo su <b>box2D</b> ).<br>
Ora apri il progetto che hai creato <a href="articolo1.jsp" target="_blank">qui</a> e:</p>
<ol>
<li>apri il file <b>MyGdxGame.java</b></li>
<li>dichiara l' oggetto scrivendo <code>OrthographicCamera camera;</code> (step 1)<br>
(qui la chiamo camera ma naturalmente puoi chiamarla come vuoi)</li>
<li>inizializza la videocamera scrivendo <code>camera = new OrthographicCamera();</code> nel metodo <b>create()</b> (step 2)</li>
<li>Imposta la larghezza e lâaltezza della viewport della telecamera (lo schermo visibile dallâutente) scrivendo 
<code>camera.setToOrtho(false,800,480);</code> che prende tre parametri:<br>
   <ol>
       <li>il primo mi permette di decidere se lâorigine della y dello schermo sarÃ  nellâangolo in basso a sinistra (false) 
       o in alto a sinistra (true, in questo caso lâimmagine verrÃ  visualizzata capovolta)</li>
       <li>il secondo Ã¨ la larghezza della viewport</li>
       <li>il terzo Ã¨ l'altezza della viewport</li>
   </ol>
   (in questo caso coincidono con la larghezza e 
   lâaltezza della finestra in modo tale da riuscire a visualizzare tutto lo schermo). 
</li>
<li> Scrivi <code>camera.update();</code> e <code>batch.setProjectionMatrix(camera.combined);</code> nel <b>render()</b> 
     sopra il disegno dellâimmagine. Il primo codice serve ad aggiornare la telecamera in continuazione,
      mentre con il secondo dici allo <b>SpriteBatch</b> di utilizzare la telecamera e quindi di utilizzare le sue coordinate di proiezione.
</li> 
</ol>
	<br><br>	
<img src="media/articolo4Imm1.png" class="img-fluid rounded">
<br><br>
<p class="lead">Ora prova a utilizzare la funzione di zoom della telecamera dopo <code>camera.update();</code> 
scrivendo <code>camera.zoom=a;</code>.<br>
Ti ricordo che <b>a</b> Ã¨ la variabile creata in questo articolo e aumenta in continuazione quindi allâumentare di <b>a</b> diminuisce lo zoom
 e lâeffetto sarÃ  il rimpicciolimento dellâimmagine che in realtÃ  ha sempre le stesse dimensioni ma Ã¨ come se la telecamera 
 si allontanasse quindi agli occhi dellâutente risulta piÃ¹ piccola .</p>
<br><br>
<img src="media/articolo4Imm2.png" class="img-fluid rounded">  
<br><br>
<p class="lead">Ecco alcune funzioni che possiamo utilizzare ma di cui non ho parlato in questo articolo<br>
(ne parlerÃ² nel dettaglio piÃ¹ avanti quando le utilizzeremo all'interno del nostro gioco):
</p>
<br>
<ul>
   <li><code>camera.unproject( Vector3 );</code> <br>
   serve a trasformare le coordinate della schermata di gioco in coordinate di proiezione della telecamera
    e prende come parametro un vettore 3d (ne parlerÃ² piÃ¹ avanti).</li>
   <li><code>camera.position.set(float x, float y, float z);</code> <br>
   serve per posizionare la telecamera, utile per esempio se vogliamo che la telecamera segua il giocatore , 
   ne parlerÃ² piÃ¹ dettagliatamente in futuro.</li>
   <li><code>camera.rotate(float angolo);</code><br>
    serve per ruotare la telecamera, prende come parametro l'angolo di rotazione 
    (utilizzando questa funzione tutte le immagini del gioco verranno ruotate).</li>
</ul>
<br><br>
<p class="lead">
Per oggi Ã¨ tutto e <a href="articolo5.jsp">nel prossimo articolo</a> introdurrÃ² la classe Sprite che ci permetterÃ  di modificare in modo facile le dimensioni,
 il canale alpha, il colore e la posizione dellâimmagine, possiamo quindi utilizzarla per creare transizioni ed effetti di vario tipo nel nostro gioco. 
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
