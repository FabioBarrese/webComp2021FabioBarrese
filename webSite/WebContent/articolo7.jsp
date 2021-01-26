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
        <h1 class="mt-4">libGDX - Input, classe Rectangle, gestisci le collisioni nel tuo gioco !</h1>

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
        <a href="articolo6.jsp">il mio precedente post</a> 
        per capire di cosa sto parlando e 
        il significato di alcuni termini che utilizzerÃ² :) , 
        puoi inoltre accedere alla lista di tutti i miei articoli <a href="indiceArticoli.html" target="_blank">qui</a> .
        </p>
<br>
<br>
<p class="lead">
Nei giochi che non utilizzano box2D la classe Rectangle puÃ² essere una valida alternativa per gestire le collisioni e, 
anche se quando introdurrÃ² box2d vedremo altri metodi piÃ¹ validi, 
per adesso Ã¨ bene conoscerla e capirne il funzionamento. 
Come dice la parola stessa <b>"Rectangle"</b>, noi utilizzeremo un rettangolo per gestire le collisioni 
(tramite la funzione <b><i>overlaps</i></b> di cui parlerÃ² in questo post) 
e disegneremo l'immagine sostituendo la x e la y con le coordinate del rettangolo in modo tale che il rilevamento della collisione 
del rettangolo coincida con la collisione dell'immagine.
<br><br>
Nel dettaglio oggi faremo le seguenti operazioni:
</p>
<br>
<ol>
<li>aggiungere un rettangolo per ciascuna immagine creata nei precedenti articoli, 
le quali in questo caso sono due.</li>
<li>utilizzare la classe <b>Sprite</b> per disegnare il logo di libGDX.</li>
<li>utilizzare le coordinate <b>x</b> e <b>y</b> del rettangolo per disegnare le immagini.</li>
<li>utilizzare la funzione <b><i>overlaps</i></b> per gestire le collisioni.</li>
<li>se c'Ã¨ il contatto tra le due immagini fai sparire il logo di libGDX 
utilizzando una delle funzioni della classe Sprite viste nell'articolo <a href="articolo5.jsp" target="_blank">Sprite e transizioni di gioco !</a></li>
</ol>
<br>
<p class="lead">
Per fare tutto ciÃ² dichiara i due oggetti <b>Rectangle</b> scrivendo
<br><br>
<code>Rectangle rect_img,rect_nuovaimmagine;</code>
<br><br>
(java permette di raggruppare variabili dello stesso tipo in una sola riga di codice per rendere la vita piÃ¹ facile al programmatore, 
tuttavia se preferisci dichiararle separatamente come abbiamo sempre fatto finora fai pure :) ).
<br><br>
Dichiara una variabile di tipo <b>boolean</b> scrivendo <code>boolean contatto;</code>
<br><br>
Dichiara una variabile di tipo <b>Sprite</b> scrivendo <code>Sprite sprite_img;</code>
<br><br>
Infine dichiara una variabile di tipo <b>float</b> scrivendo <code>float sparisci_logo;</code>
</p>
<br>
<p class="lead">
Nel metodo <b><i>create()</i></b> inizializza le variabili scrivendo:</p><br>
<pre>
<b>rect_img = new Rectangle ();
rect_nuovaimmagine = new Rectangle();
sprite_img = new Sprite (img);
contatto = false;
sparisci_logo=1;</b>
</pre><br>
<p class="lead">
Sempre nel metodo <b><i>create()</i></b> sotto l'inizializzazione della variabile <b>sparisci_logo</b> 
imposta la larghezza e l'altezza dei rettangoli e la <b>x</b> e la <b>y</b> 
di <b>rect_nuovaimmagine</b> (che corrisponde alla posizione di <b>sprite</b>) scrivendo:</p><br>
<pre>
<b>rect_img.width=img.getWidth();
rect_img.height=img.getHeight();
rect_nuovaimmagine.width=nuovaimmagine.getWidth();
rect_nuovaimmagine.height=nuovaimmagine.getHeight();
rect_nuovaimmagine.x=800/2;
rect_nuovaimmagine.y=480/2;</b>
</pre><br><br>	
<p class="lead">
La prima riga serve a impostare la larghezza del rettangolo passando come parametro la larghezza dell'immagine in questione, 
la seconda riga come la prima ma per l'altezza, la terza e la quarta come le prime due e infine la quinta e la sesta 
servono per posizionare il rettangolo in modo tale che coincida con la posizione di <b>sprite</b> 
(infatti nei precedenti articoli abbiamo posizionato <b>sprite</b> scrivendo <b><i>sprite.setPosition(800/2,480/2);</i></b> 
e quindi la posizione del rettangolo deve essere la stessa).
</p>
<br><br>
<p class="lead">
Nel metodo <b><i>render()</i></b> scrivi:
</p><br>
<pre>
<b>rect_img.x=a;
rect_img.y=a;
sprite_img.setPosition(rect_img.x,rect_img.y);
sprite_img.setScale(sparisci_logo,sparisci_logo);</b>
</pre><br>
<br>
<p class="lead">
Le prime due righe servono a far muovere il rettangolo, 
la terza serve ad "incollare" l'immagine al rettangolo (la disegno alle stesse coordinate del rettangolo) 
e la quarta serve a scalare l'immagine utilizzando come parametro la variabile <b>sparisci_logo</b> 
(finchÃ© sarÃ  uguale a <b>1</b> le dimensioni dell'immagine resteranno invariate).
</p>
<br><br>
<p class="lead">
<b>IMPORTANTE</b>: anche se scali o modifichi le dimensioni dell'immagine il rettangolo rimarrÃ  delle stesse dimensioni, 
devi perciÃ² usare le funzioni che servono per impostare larghezza/altezza rettangolo che abbiamo visto sopra per 
poter modificare le sue dimensioni.
</p>
<br><br>
<p class="lead">
Infine sempre nel <b><i>render()</i></b> sotto <code>batch.end();</code> scrivi :
</p><br>
<pre>
<b>
if (rect_img.overlaps(rect_nuovaimmagine)){
   contatto = true;
}
if (contatto) {
   if (sparisci_logo>0)  
      sparisci_logo-=0.008;
   else 
      sparisci_logo=0;
}</b>
</pre><br>
<br>
<p class="lead">
che tradotto significa:
<br>
"Se avviene un contatto tra il rettangolo della prima immagine e quello della seconda fai sparire la prima immagine ".
</p>
<br><br>	
<img src="media/articolo7Imm1.png" class="img-fluid rounded">
<br><br>	
<img src="media/articolo7Imm2.png" class="img-fluid rounded">
<br><br>
<p class="lead">
Ed ecco il video del risultato:
</p>
<br><br>	
<iframe allowfullscreen="true" width="320" height="266" src="https://www.blogger.com/video.g?token=AD6v5dzW5Xb0VK8TgT9aKYZyiCFu61jnLlwVR1oSm6NEu0c0ILiXOGX1QoEttEwLNoefyNEhaDPicEAxhrhuGJFnKA" class="b-hbp-video b-uploaded"></iframe>
<br><br>
<p class="lead">
Per oggi Ã¨ tutto e <a href="articolo8.jsp">nel prossimo articolo</a> introdurrÃ² la classe Animation che utilizzeremo 
per dare vita ai personaggi che popoleranno il nostro gioco.<br>
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
