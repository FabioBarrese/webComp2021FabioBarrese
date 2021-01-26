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
        <h1 class="mt-4">libGDX - Creiamo Snake, musica ed effetti sonori !</h1>

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
        <a href="articolo11.jsp">il mio precedente post</a> 
        per capire di cosa sto parlando e 
        il significato di alcuni termini che utilizzerÃ² :) , 
        puoi inoltre accedere alla lista di tutti i miei articoli <a href="indiceArticoli.html" target="_blank">qui</a> .
        </p>
<br>
<br>
<p class="lead">
Puoi anche aver creato un gioco mozzafiato dalla grafica stupenda curato nei minimi dettagli, 
ma un gioco senza musica Ã¨ un gioco senza vita, 
perciÃ² in questo articolo vedremo come aggiungere la musica e gli effetti sonori cosÃ¬ che il tuo fantastico gioco 
possa trovare il successo!
<br>
Per fare ciÃ²:
<br>
</p>
<ol>
	<li>Apri il tuo progetto.</li>
	<li>Nella cartella assets aggiungi due file audio (puoi scaricarli da internet), 
		il primo sarÃ  il sottofondo musicale e il secondo sarÃ  l'effetto sonoro 
		che si sentirÃ  ogni qualvolta il serpente mangia il cibo (deve perciÃ² essere un audio di pochi secondi).</li>
	<li>Dichiara le variabili nel tuo gioco scrivendo <code id=sfondoColorato>Music <var>musica</var>;</code> e 
		<code id=sfondoColorato>Sound <var>suono</var>;</code></li>
	<li>carica la musica e il suono, scrivendo, da qualche parte nel metodo <code id=sfondoColorato>show()</code>, 
		le seguenti due righe di codice:
		<br><br>
<pre>
<code id=variabile>musica</code> = Gdx.<var>audio</var>.newMusic(Gdx.<var>files</var>.internal(<code id=variabile>"musica.mp3"</code>));;
<code id=variabile>suono</code> = Gdx.<var>audio</var>.newSound(Gdx.<var>files</var>.internal(<code id=variabile>"punti.mp3"</code>));;
</pre>
		che prendono come parametri i file interni alla cartella assets specificati tra le virgolette.<br><br>
	</li>
	<li>
		Nel metodo <code id=sfondoColorato>show()</code> 
		fai partire la musica scrivendo <code id=sfondoColorato><code id=variabile>musica</code>.play()</code>;
	</li>
	<li>
		nel metodo <code id=sfondoColorato>render(<code id=parolaChiave>float</code> delta)</code> 
		scrivi <code id=sfondoColorato><code id=variabile>suono</code>.play()</code>; 
		all'interno dell'istruzione 
		<br>
		<code id=sfondoColorato>
		<code id=parolaChiave>if</code>
		(<code id=variabile>rettangolo</code>.overlaps(<code id=variabile>rettangolouovo</code>))</code>
		<br> 
		di cui ho parlato nel <a href="articolo11.jsp" target="_blank">precedente articolo</a>, 
		in modo tale da farlo partire ogni qualvolta il serpente entra in contatto con il cibo.
	</li>
</ol>
<br>
<p class="lead">
Ed ecco il video:
</p>
<div class="contenitore">
	<iframe class="responsive-iframe" src="https://www.youtube.com/embed/eebPyXtMa3s" allowfullscreen></iframe>
</div>
<br><br>
<p class="lead">
Per oggi Ã¨ tutto e <a href="articolo13.jsp">nel prossimo articolo</a> vedremo come uccidere il serpente o, 
per essere piÃ¹ precisi, come inserire il game over nel nostro gioco.
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
