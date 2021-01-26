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
        <h1 class="mt-4">libGDX - Input, interagisci con il tuo gioco !</h1>

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
        <a href="articolo5.jsp">il mio precedente post</a> 
        per capire di cosa sto parlando e 
        il significato di alcuni termini che utilizzerÃ² :) , 
        puoi inoltre accedere alla lista di tutti i miei articoli <a href="indiceArticoli.html" target="_blank">qui</a> .
        </p>
<br>
<br>
<p class="lead">
Un gioco per essere definito tale deve permettere all'utente di giocarci.
<br>
In poche parole <strong>un gioco deve essere INTERATTIVO</strong>.
</p>
<br>
<p class="lead">
PerciÃ² oggi vedremo nel dettaglio come rilevare da codice gli input dell'utente che sta 
usando il nostro gioco : pressione del tasto del mouse e dei tasti della tastiera per 
il computer e pressione del dito per dispositivi mobile touch screen (ios-android). 
Questo in libgdx, come vedremo, Ã¨ molto semplice. Come al solito apri il progetto che ti ho fatto creare <a href="articolo1.jsp" target="_blank">qui</a>.
<br>
Ricordi che nel mio precedente articolo ti ho spiegato come far sparire un'immagine ? 
In caso la risposta sia no ti consiglio di riguardare <a href="articolo5.jsp" target="_blank">qui</a> come fare , altrimenti prosegui nella lettura :) . 
In questo articolo infatti lasceremo tutto il processo di sparizione inalterato ma diremo al programma di eseguirlo 
solo se l'utente preme il pulsante del mouse (pressione del dito se sta utilizzando dispositivo mobile touch screen) 
o se preme un tasto della tastiera specifico.
<br> 
Come al solito dopo la spiegazione lascerÃ² in allegato una foto (anche se questa volta Ã¨ veramente semplice :) ).
</p>
<br>
<p class="lead">
Tutto quello che devi fare Ã¨:</p>
<br>
<ol>
<li>dichiarare una variabile di tipo <b>boolean</b> scrivendo <code>boolean inizia;</code></li>
<li>inizializzarla nel metodo <b>create()</b> scrivendo <code>inizia=false;</code></li>
<li>nel metodo <b>render()</b> sotto <code>batch.end;</code> scrivere<br>
<pre>
if (Gdx.input.justTouched()) 
    inizia=true;
</pre></li>
<li>racchiudere il codice riguardante la sparizione dell' immagine nella condizione cosÃ¬ facendo :<br>
<pre> 
if (inizia) 
{
   codice riguardante la sparizione dell'immagine
}
</pre>
</li>
</ol>
<p class="lead">
Si ma Fabio tradotto in italiano ?!?
Nessun problema eccoti la traduzione del punto <b>3</b>:<br>
"non fare niente finchÃ¨ l'utente non preme il tasto del mouse o non tocca lo schermo (in caso di cellulari android e ios)".
</p>
<br>
<p class="lead">
Ora modifica il punto 3 scrivendo:</p><br>
<pre>
if (Gdx.input.justTouched()||Gdx.input.isKeyJustPressed(Keys.A))
   inizia=true;
</pre><br>
<p class="lead">
traduzione : "se l'utente preme il mouse (o il dito nei cellulari ) oppure preme 
il tasto <b style="font-size:xx-large">a</b> della tastiera dai il valore <b style="font-size:x-large">true</b> (vero) a <b style="font-size:xx-large">inizia</b> 
e quindi fai partire il processo di sparizione dell'immagine.
</p>
<br><br>	
<img src="media/articolo6Imm1.png" class="img-fluid rounded">
<br><br>
<p class="lead">
Differenza tra</p>
<br>
<ol>
   <li><code>Gdx.input.isKeyJustPressed(Keys.tuo tasto)</code></li>
   <li><code>Gdx.input.isKeyPressed(Keys.tuo tasto)</code></li>
</ol>
<br>
<p class="lead">
il primo entra in azione quando l'utente preme il tasto in questione della tastiera mentre il secondo entra in 
azione quando l'utente <b style="font-size:x-large">tiene premuto</b> il tasto in questione della tastiera, 
Ã¨ una differenza sottile quanto importante .
</p>

<br><br>
<p class="lead">
Per oggi Ã¨ tutto e <a href="articolo7.jsp">nel prossimo articolo</a> introdurrÃ² la classe Rectangle che, 
nei giochi che non utilizzano box2D Ã¨ la candidata numero 1 per gestire le collisioni 
(tra giocatore e nemici, tra giocatore e oggetti, tra oggetti e nemici, tra oggetti).<br>
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
