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
        <h1 class="mt-4">libGDX - Creiamo Snake, pausa !</h1>

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
        <a href="articolo16.jsp">il mio precedente post</a> 
        per capire di cosa sto parlando e 
        il significato di alcuni termini che utilizzerÃ² :) , 
        puoi inoltre accedere alla lista di tutti i miei articoli <a href="indiceArticoli.html" target="_blank">qui</a> .
        </p>
<br>
<br>
<p class="lead">
Se hai seguito il mio articolo sulla schermata del game over e lo hai compreso appieno, 
allora inserire la pausa nel gioco per te sarÃ  una passeggiata: dovrai fare esattamente le stesse cose.
<br>
Trascina un'immagine che rappresenti il testo "pausa" nel gioco. Dichiara le variabili di tipo <code id=sfondoColorato>Texture</code> , <code id=sfondoColorato>Sprite</code> , 
<code id=fusione>boolean</code> e <code id=fusione>float</code> :
le prime due servono per caricare e disegnare l'immagine, 
la variabile booleana serve per fare in modo che il gioco si interrompa alla pressione del tasto invio, mentre la variabile di tipo float serve per far aumentare l'alpha 
del testo "pausa" quando questo apparirÃ .
<br>
<b id=sottolineato>step 1</b>, dichiarazione variabili:
<br>
</p>
<pre>
Texture <var>timeout</var>;
Sprite <var>timeouts</var>;
<code id=parolaChiave>float</code> <var>timeoutalpha</var>;
</pre>
<br>
<p class="lead">
<b id=sottolineato>step 2</b>, inizializzazione (metodo <code id=sfondoColorato>show()</code> ):
<br>
</p>
<pre>
<code id=variabile>pausa</code> = <code id=parolaChiave>false</code>;
<code id=variabile>timeout</code> = <code id=parolaChiave>new</code> Texture(<code id=variabile>"pausa.png"</code>);
<code id=variabile>timeouts</code> = <code id=parolaChiave>new</code> Sprite(<code id=variabile>timeout</code>);
<code id=variabile>timeouts</code>.setAlpha(0);
<code id=variabile>timeoutalpha</code> = 0;
<code id=variabile>timeouts</code>.setPosition(800/2-<code id=variabile>timeout</code>.getWidth()/2,480/2);
</pre>
<br>
<p class="lead">
<b id=sottolineato>step 3</b>, metodo <code id=sfondoColorato>render(<code id=parolaChiave>float</code> delta)</code> , 
all'interno della condizione <code id=sfondoColorato><code id=parolaChiave>if</code> (!<code id=variabile>fine</code>)</code> :
<br>
</p>
<pre>
<code id=parolaChiave>if</code>(!<code id=variabile>pausa</code>){
	<code id=parolaChiave>if</code> (<code id=variabile>timeoutalpha</code>!=0)
		<code id=variabile>timeoutalpha</code>=0;
	<code id=commento>//codice scritto nei precedenti articoli ;</code>
	<code id=parolaChiave>if</code> (Gdx.<var>input</var>.isKeyJustPressed(Keys.<var>ENTER</var>))
		<code id=variabile>pausa</code> = <code id=parolaChiave>true</code>;
}
<code id=parolaChiave>else</code> {
	<code id=parolaChiave>if</code> (<code id=variabile>timeoutalpha</code>&lt;1)
		<code id=variabile>timeouts</code>.setAlpha(<code id=variabile>timeoutalpha</code>+=0.2);
	<code id=parolaChiave>else</code>
		<code id=variabile>timeouts</code>.setAlpha(1);
	<code id=variabile>batch</code>.begin();
	<code id=variabile>timeouts</code>.draw(<code id=variabile>batch</code>);
	<code id=variabile>batch</code>.end();
	<code id=parolaChiave>if</code> (Gdx.<var>input</var>.isKeyJustPressed(Keys.<var>ENTER</var>))
		<code id=variabile>pausa</code> = <code id=parolaChiave>false</code>;
}
</pre>
<br>
<p class="lead">
Il codice sopra significa:
<br>
"Se premi invio metti in pausa , aumenta il canale alpha del testo e disegnalo".
<br>
"Se premi invio ma sei giÃ  in pausa riprendi il gioco e dai al canale alpha il valore di 0".
<br>
<br>
Ed ecco il video completo:
</p>
<div class="contenitore">
	<iframe class="responsive-iframe" src="https://www.youtube.com/embed/hCMqfi_S5_I" allowfullscreen></iframe>
</div>
<br><br>
<p class="lead">
Per oggi Ã¨ tutto e <a href="articolo18.jsp">nel prossimo articolo</a> vedremo come inserire il menÃ¹ nel nostro gioco !
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
