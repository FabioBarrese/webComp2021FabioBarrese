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
        <h1 class="mt-4">libGDX - Creiamo Snake, game over !</h1>

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
        <a href="articolo12.jsp">il mio precedente post</a> 
        per capire di cosa sto parlando e 
        il significato di alcuni termini che utilizzerÃ² :) , 
        puoi inoltre accedere alla lista di tutti i miei articoli <a href="indiceArticoli.html" target="_blank">qui</a> .
        </p>
<br>
<br>
<p class="lead">
Oggi sono di cattivo umore perciÃ² ucciderÃ² il serpente. Scherzi a parte in questo articolo ti insegnerÃ² come 
introdurre il game over nel tuo gioco !
<br>
PerciÃ² passa subito all'azione e inserisci un'immagine nella cartella assets che faccia capire all'utente che ha perso 
(io per esempio ho inserito il testo "GAME OVER"), 
dichiarala, 
caricala da codice e disegnala solo quando il giocatore perde: 
dopo aver dichiarato la variabile (che io ho chiamato <var>gameover</var>), 
nel metodo <code id=sfondoColorato>show()</code> 
scrivi <code id=variabile>gameover</code> = <code id=parolaChiave>new</code> Texture(<code id=variabile>"gameover.png"</code>);
<br>
(ovviamente al posto di <code id=variabile>"gameover.png"</code> devi scrivere il nome della tua immagine), 
dopodichÃ© dichiara una variabile di tipo <code id=parolaChiave>boolean</code> scrivendo 
<br>
<code id=parolaChiave>boolean</code> <var>fine</var>; e inizializzala nel metodo <code id=sfondoColorato>show()</code> 
scrivendo 
<br>
<code id=variabile>fine</code>=<code id=parolaChiave>false</code>;
<br>
infine nel metodo <code id=sfondoColorato>render(<code id=parolaChiave>float</code> delta)</code>
<br>
racchiudi tutto il codice nella condizione <code id=sfondoColorato><code id=parolaChiave>if</code> (!<code id=variabile>fine</code>)</code>, 
che significa <b id=sottolineato>"se non Ã¨ la fine"</b>.
<br>
Nella condizione <code id=parolaChiave>else</code> stoppa la musica, disegna l'immagine e alla pressione del tasto invio 
resetta le variabili con i loro valori originali stabiliti nel metodo <code id=sfondoColorato>show()</code> 
(non preoccuparti tra poco capirai meglio).
<br>
il codice nel metodo <code id=sfondoColorato>render(<code id=parolaChiave>float</code> delta)</code> Ã¨:
<br>
</p>
<pre>
Gdx.<var>gl</var>.glClearColor(0, 0, 0.5f, 1);
Gdx.<var>gl</var>.glClear(GL20.<var>GL_COLOR_BUFFER_BIT</var>);
<code id=parolaChiave>if</code> (!<code id=variabile>fine</code>)
{
<code id=commento>/*
tutto il codice scritto nei precedenti articoli
*/</code>
	<code id=parolaChiave>for</code>(<code id=parolaChiave>int</code> i=2; i&lt;=<code id=variabile>ultimo</code>; i++){
		<code id=parolaChiave>if</code> (<code id=variabile>rettangolo</code>.overlaps(<code id=variabile>retttangoli</code>.get(i)))
		{
			<code id=variabile>fine</code>=<code id=parolaChiave>true</code>;
		}
	}
}
<code id=parolaChiave>else</code>
{
	<code id=variabile>musica</code>.stop();
	<code id=variabile>batch</code>.begin();
	<code id=parolaChiave>for</code> (int i =0 ; i&lt;<code id=variabile>immagini</code>.size; i++){
		<code id=parolaChiave>if</code> (<code id=variabile>immagini</code>.get(i)!=<code id=parolaChiave>null</code>) {
			<code id=variabile>immagini</code>.get(i).draw(<code id=variabile>batch</code>);
		}
	}
	<code id=variabile>Snake</code>.draw(<code id=variabile>batch</code>);
	<code id=variabile>batch</code>.draw(<code id=variabile>gameover</code>,800/2-<code id=variabile>gameover</code>.getWidth()/2,480/2);
	<code id=variabile>batch</code>.end();
	<code id=parolaChiave>if</code> (Gdx.<var>input</var>.isKeyJustPressed(Keys.<var>ENTER</var>)){
		ricomincia();
	}
} 
</pre>
<br>
<p class="lead">
Le prime due righe per colorare lo schermo e pulire il buffer vanno posizionate fuori perchÃ© devono sempre esserci a 
prescindere. 
Se il rettangolo della testa entra in contatto con gli altri rettangoli (dal terzo in poi) entra nella condizione else 
e al suo interno disegna solo l'immagine che indica che il gioco Ã¨ finito e il corpo e la testa del serpente bloccati 
in quella posizione , infine resetta le variabili in caso di pressione del tasto invio, 
devi perciÃ² creare il metodo <code id=sfondoColorato>ricomincia()</code>, ti mostro come fare in queste foto:
</p>
<br><br>	
<img src="media/articolo13Imm1.png" class="img-fluid rounded">
<br>
<img src="media/articolo13Imm2.png" class="img-fluid rounded">
<img src="media/articolo13Imm3.png" class="img-fluid rounded">
<br>
<img src="media/articolo13Imm4.png" class="img-fluid rounded">
<br>
<img src="media/articolo13Imm5.png" class="img-fluid rounded">
<br><br>
<div class="contenitore">
	<iframe class="responsive-iframe" src="https://www.youtube.com/embed/ZPaMCigzwEc" allowfullscreen></iframe>
</div>
<br><br>
<p class="lead">
Per oggi Ã¨ tutto e <a href="articolo14.jsp">nel prossimo articolo</a> vedremo come passare attraverso le pareti.
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
