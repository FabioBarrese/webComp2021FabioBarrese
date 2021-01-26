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
        <h1 class="mt-4">libGDX - Game e Screen, schermate multiple per il tuo gioco !</h1>

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
        <a href="articolo8.jsp">il mio precedente post</a> 
        per capire di cosa sto parlando e 
        il significato di alcuni termini che utilizzerÃ² :) , 
        puoi inoltre accedere alla lista di tutti i miei articoli <a href="indiceArticoli.html" target="_blank">qui</a> .
        </p>
<br>
<br>
<p class="lead">
Un gioco che si rispetti di solito Ã¨ composto da due o piÃ¹ schermate collegate tra loro nel modo piÃ¹ semplice ed 
efficiente possibile per migliorare l'esperienza dell'utente, per esempio un gioco potrebbe essere composto 
dalle seguenti schermate:<br></p>
<ol>
	<li>Titolo</li>
	<li>Menu principale, che al suo interno contiene:<br>
		<ol>
			<li>Schermata punteggi</li>
			<li>Menu Livelli, ciascun livello al suo interno contiene:<br>
				<ul>
					<li>Schermata di Gioco</li>
				</ul>
			</li>
		</ol>
	</li>
</ol>
<br>
<p class="lead">
Tutte collegate fra di loro tramite pulsanti o pressione di tasto invio della tastiera.
<br>
<br>
Quindi, se stai creando un gioco in libGDX e vuoi arricchirlo di titolo, menu, punteggi, livelli, 
informazioni e tanto altro sei nel posto giusto.
<br>
<br>
Come al solito apri il progetto (se non sai di cosa sto parlando guarda i miei precedenti articoli). 
<br>
Nel package <code>com.mygdx.game</code> crea due classi facendo come nell'immagine di seguito.
</p>
<br><br>	
<img src="media/articolo9Imm1.png" class="img-fluid rounded">
<br><br>
<p class="lead">
In questo articolo le chiamerÃ² <b><i>schermo_principale</i></b> e <b><i>schermo_titolo</i></b> e alla fine della spiegazione allegherÃ² 
come sempre le foto per una maggiore comprensione.
<br>
In entrambe le classi implementa l'interfaccia <b>Screen</b> e, dopo averla importata, 
aggiungi i metodi relativi alla classe trascinando il mouse sulla parola <b>schermo_principale</b> e cliccando 
"Add unimplemented methods". Ora apri il file <code>MyGdxGame.java</code> e invece di implementare la classe 
<b>ApplicationListener</b> (o estendere la classe <b>ApplicationAdapter</b>) come abbiamo fatto finora, 
estendi la classe <b>Game</b>.
Taglia tutto il codice riguardante le dichiarazioni delle variabili e gli <code>import</code> e incollalo, 
nella stessa posizione, nella classe <b>schermo_principale</b> e fai la stessa cosa con il codice presente nel metodo 
<b>create()</b> e nel metodo <b>render()</b> incollandolo rispettivamente nel metodo <b>show()</b> e nel metodo 
<code>render(float delta)</code> di suddetta classe. 
Infine nella classe <b>MyGdxGame</b>  nel metodo <b>create()</b> scrivi 
<code>setScreen(new schermo_titolo());</code> e negli altri metodi scrivi <code>super().nome_metodo</code> 
e analizziamo il tutto. 
La funzione <b>setScreen</b> serve per impostare la nuova schermata di gioco 
(puÃ² essere utilizzata solo estendendo la classe <b>Game</b>) 
e scrivendo <code>super().nome_metodo</code> in poche parole dici all'applicazione di eseguire i metodi.
</p>
<br>
<p class="lead">
La schermata di gioco generata con la funzione <b>setScreen</b> deve implementare l'interfaccia <b>Screen</b> 
e contiene i seguenti metodi:<br></p>
<ul>
	<li>
		<code>public void show()</code>
		<br>
		Ã¨ uguale al metodo <b><i>create()</i></b> ed Ã¨ il primo metodo ad essere utilizzato dopo che lo schermo viene generato 
		tramite la funzione <b>setScreen</b> .
	</li>
	<li>
		<code>public void render(float delta)</code>
		<br>
		Ã¨ uguale al metodo <b><i>render()</i></b> e prende come parametro il <b>delta</b> 
		(la funzione <b><i>Gdx.Graphics.getDeltaTime()</i></b> spiegata nel mio 
		<a href="articolo8.jsp" target="_blank">precedente articolo</a>) .
	</li>
	<li>
		<code>public void resize(int width, int height)</code>
		<br>
		uguale al metodo <b><i>resize(int width, int height)</i></b> .
	</li>
	<li>
		<code>public void pause()</code>
		<br>
		uguale al metodo <b><i>pause()</i></b> .
	</li>
	<li>
		<code>public void resume()</code>
		<br>
		uguale al metodo <b><i>resume()</i></b> .
	</li>
	<li>
		<code>public void hide()</code>
		<br>
		quando si utilizza la funzione <b>setScreen</b> per generare un  nuovo schermo, 
		quello attuale viene accantonato, per la precisione il programma "nasconde" lo schermo 
		(<i>hide in inglese significa nascondere</i>).
	</li>
	<li>
		<code>public void dispose()</code>
		<br>
		uguale al metodo <b><i>dispose()</i></b> .
	</li>
</ul>
<br>
<p class="lead">
	Nella classe <b>schermo_titolo</b> carica e disegna un'immagine come ti ho mostrato nei miei precedenti post 
	(per esempio il titolo oppure il messaggio <i>"premi invio per andare avanti"</i>) 
	e alla pressione del tasto invio imposta come nuovo schermo la classe <b>schermo_principale</b>, scrivendo:
	<br>
</p>
<pre>
	<b> 
		if(Gdx.input.isKeyJustPressed(Keys.ENTER))
			((Game) Gdx.app.getApplicationListener()).setScreen(new schermo_principale());	
	</b>
</pre>
<br>
<p class="lead">
che tradotto significa "se premi invio imposta la classe <b>schermo_principale</b> 
come nuovo schermo e nascondi quella corrente" (richiamando il metodo <b>hide()</b>).
</p>
<br><br>	
<img src="media/articolo9Imm2.png" class="img-fluid rounded">
<br>	
<img src="media/articolo9Imm3.png" class="img-fluid rounded">
<br>
<img src="media/articolo9Imm4.png" class="img-fluid rounded">
<br>	
<img src="media/articolo9Imm5.png" class="img-fluid rounded">
<br>
<img src="media/articolo9Imm6.png" class="img-fluid rounded">
<br><br>
<p class="lead">
Per oggi Ã¨ tutto e <a href="articolo10.jsp">nel prossimo articolo</a> inizieremo a creare il nostro primo gioco insieme !<br>
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
