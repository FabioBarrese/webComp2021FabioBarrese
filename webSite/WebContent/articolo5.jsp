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
        <h1 class="mt-4">libGDX - Sprite e transizioni di gioco !</h1>

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
        <a href="articolo4.jsp">il mio precedente post</a> 
        per capire di cosa sto parlando e 
        il significato di alcuni termini che utilizzerÃ² :) , 
        puoi inoltre accedere alla lista di tutti i miei articoli <a href="indiceArticoli.html" target="_blank">qui</a> .
        </p>
<br>
<br>
<p class="lead">
Scegli un'immagine e trascinala all'interno della cartella assets che si trova nella cartella mygdx-game-core.<br>
Dichiarala e inizializzala nel gioco utilizzando gli step 1 e 2 di cui ti ho parlato nei miei precedenti articoli (ma non disegnarla) .
<br>
<strong>Oggi proveremo a far sparire la tua immagine</strong>, tranquilla/o non hai bisogno della lettera di Hogwarts per farlo :) .
</p>
<br>
<p class="lead">
Piuttosto andremo a modificare il canale alpha dell'immagine, 
operazione che puÃ² essere facilmente eseguita in libGDX utilizzando 
la classe Sprite che ci permette di modificare colore, posizione, 
canale alpha e dimensione di un'immagine.
Dichiara la classe scrivendo <code>Sprite sprite;</code> (step 1).
Inizzializzala nel metodo create() dopo l'inizializzazione dell'immagine 
che ti ho detto di inserire sopra , scrivendo <code>sprite = new Sprite(nuovaimmagine);</code> (step 2) 
e sotto questa linea di codice scrivi <code>sprite.setPosition(800/2,480/2);</code>
per posizionare l'immagine sullo schermo (in questo caso l'origine dell'immagine 
sarÃ  al centro dello schermo poichÃ¨ 800 e 480 sono la larghezza e l'altezza della viewport della telecamera impostate qui); 
nel render() tra il <code>batch.begin();</code> e il <code>batch.end();</code> 
scrivi <code>sprite.draw(batch);</code> per il disegno (step 3), 
che prende come parametro lo SpriteBatch su cui disegnare. 
Dichiara una variabile di tipo float scrivendo float magia; 
inizializzala nel metodo create () scrivendo <code>magia = 1;</code> e nel render() sotto <code>batch.end();</code> (dopo il disegno) scrivi :
</p>
<pre>
if (magia > 0 )  
      magia-=0.008 ;
   else 
      magia=0 ;
</pre>
<br>
<p class="lead"> Tradotto in lingua italiana: "se il valore di <b>magia</b> Ã¨ maggiore di <b>0</b> diminuisci <b>magia</b> altrimenti a <b>magia</b> dai il valore di <b>0</b>".</p>
<br>
<p class="lead">
E' necessario procedere in questo modo poichÃ© come ti ho giÃ  detto <a href="articolo4.jsp" target="_blank">qui</a>, 
in libGDX l'intervallo dei valori del colore e del canale alpha sono compresi tra 0 e 1 (le immagini di default in libGDX 
sono disegnate non trasparenti quindi con alpha uguale a 1 ed Ã¨ per questo che nel metodo <b>create</b> do il valore di <b>1</b> a <b>magia</b>).
Infine sopra <code>batch.begin();</code> scrivi <code>sprite.setAlpha(magia);</code> per impostare l'alpha dell'immagine e avvia il gioco.
</p>
<br><br>	
<img src="media/articolo5Imm1.jpg" class="img-fluid rounded">
<br><br>
<p class="lead">
Prova anche a sostituire <code>sprite.setAlpha(magia);</code> con <code>sprite.setScale(magia,magia);</code> che serve per scalare l'immagine e avvia il gioco.<br>
Ovviamente se vuoi cambiarÃ  la velocitÃ  di transizione non devi fare altro che modificare il valore di <b>magia</b>.<br>
Infine ecco due funzioni utili ma di cui non ho parlato in questo articolo:
</p>
<br>
<ul>
   <li><code>sprite.setSize(width,height);</code> <br>
   serve per decidere da codice le dimensioni dell'immagine, 
   infatti al posto di <b>width</b> inseriremo il valore della larghezza (in pixel) 
   e al posto di <b>height</b> inseriremo il valore dell' altezza (in pixel).</li>
   <li><code>sprite.setRotation(degrees);</code> <br>
   serve per ruotare l'immagine , al posto di <b>degrees</b> bisogna inserire il numero che rappresenta 
   l'angolo di rotazione (in gradi).</li>
</ul>
<br><br>
<p class="lead">
Per oggi Ã¨ tutto e <a href="articolo6.jsp">nel prossimo articolo</a> introdurrÃ² le api che libGDX 
mette a disposizione per permettere all'utente di interagire con il tuo gioco (su cellulari ios e android premendo 
con il dito e su computer usando il mouse o la tastiera).<br>
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
