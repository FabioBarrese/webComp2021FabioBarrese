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
        <h1 class="mt-4">libGDX - Il ciclo di vita di un'applicazione</h1>

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
        <p class="lead">Apri il progetto che ti ho fatto creare <a href="articolo1.jsp">nel mio post precedente</a> in eclipse (o nel tuo ide) e nella cartella mygdx-game-core , allâ interno della sottocartella src , nel package com.mygdx.game clicca due volte sul file MyGdxGame.java , sulla destra apparirÃ  il codice .</p>

		<p class="lead">Aggiungiamo questo codice sotto il metodo render () :<br><br><br>


        @Override<br>
 public void resize(int width, int height) {  <br>
  <br>
 }<br>
        @Override <br>
 public void pause(){<br>
  <br>
 }<br>
 @Override<br>
 public void resume(){<br>
  <br>
 }<br>
 @Override <br>
 public void dispose(){<br>
  <br>
 }<br>
<br>
<br>
Ed esaminiamo la seguente riga <br>
<br>
<br>
<code>public class MyGdxGame extends ApplicationAdapter</code>
<br>
<br>
<br>
La classe MyGdxGame estende la classe ApplicationAdapter che Ã¨ âgemellaâ dellâ interfaccia ApplicationListener , la quale ci permette di utilizzare le funzioni create () , render () , pause () , resume () e dispose () :
<br>lâunica differenza tra la prima e la seconda Ã¨ che la prima ti permette di utilizzare anche solo alcune di queste funzioni  (in realtÃ  in Java si chiamano metodi ma io ho la licenza poetica :) ) mentre se si utilizza la seconda bisogna utilizzarle tutte e al posto di âextendsâ bisogna scrivere âimplementsâ.</p>
        <p class="lead">Ma ti starai chiedendo â a cosa servono queste funzioni? â , scopriamolo insieme .</p>
      
      <p class="lead">Nel titolo di questo post ho parlato di ciclo di vita di unâapplicazione e infatti qualsiasi gioco creato in libGDX , dal piÃ¹ semplice al piÃ¹ complesso , segue un percorso identico a tutti gli altri che puÃ² avere variazioni , perciÃ² un gioco qualsiasi nasce, fa il suo lavoro , e âmuoreâ quando lâutente lo arresta . 
<br>Nel dettaglio :</p>  
        
        <p class="lead"><code>1) Public  void Create ()  {</code><br>
<br>Eâ dove il gioco viene inizializzato e creato , Ã¨ infatti la prima funzione ad essere eseguita dal programma , qui inseriremo e inizializzeremo tutte le variabili che utilizzeremo nel gioco ( per esempio se vuoi inserire unâimmagine nel gioco , qui Ã¨ dove lâimmagine verrÃ  creata e caricata nel programma )
<br><br>}
<br>
<br>
2) <code>Public void Resize(int width , int height) {</code><br>
<br>Eâ la seconda funzione richiamata dal programma , subito dopo la funzione create () ,  viene inoltre richiamata ogni qual volta lâutente cambia la grandezza della finestra e le variabili width e height rappresentano la larghezza e lâaltezza della finestra aggiornate dopo lâultimo resize ( per esempio se il gioco inizialmente ha una finestra di 800 pixel di larghezza e 480 di altezza ma successivamente  lâutente ingrandisce la finestra a schermo intero il programma richiamerÃ  il resize() e width e height non saranno piÃ¹ 800 e 480 ma saranno i nuovi valori della finestra a schermo intero) 
<br><br>}
<br>
<br>
3) <code>Public void render () {</code><br>
<br>Ã il cuore del programma nonchÃ¨ la funzione che utilizzeremo di piÃ¹ nel nostro gioco , tutte le variabili inizializzate nel metodo create () saranno usate qui ( per esempio se nel metodo create () creo lâimmagine Ã¨ nel metodo render () che la disegno per renderla visibile allâutente )  inoltre questa funzione ha la particolaritÃ  di essere richiamata allâinfinito dal programma ( Ã¨ diciamo il fratello maggiore del ciclo while con una velocitÃ  e delle prestazioni migliori :) )
<br><br>}
<br>
<br>
4) <code>Public void pause () {</code><br>
<br>Viene richiamata quando il gioco viene messo in pausa ( nei cellulari quando si preme il tasto home o quando si riceve una chiamata )
<br><br>}
<br>
<br>
5) <code>Public void resume() {</code><br>
<br>Viene richiamata quando si riprende il gioco <br><br>
}
<br>
<br>
6) <code>Public void dispose () {</code><br>
<br>Viene richiamata quando il gioco termina , serve per liberare la memoria e arrestare lâapplicazione in maniera âpulitaâ . Qui dentro elimineremo dalla memoria tutte quelle classi che sono state caricate allâavvio del gioco ma che libGDX non elimina in automatico ( sono tutte quelle classi che implementano lâinterfaccia disposable , ne parlerÃ² in un altro articolo ) <br><br>
}</p>

		<p class="lead">Per oggi Ã¨ tutto e dedicherÃ² <a href="articolo3.jsp">il prossimo articolo</a> alle classi SpriteBatch e Texture , che servono per inserire e disegnare le immagini nel nostro gioco .</p>
        
        <p class="lead">Alla prossima !!! :)</p>
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
