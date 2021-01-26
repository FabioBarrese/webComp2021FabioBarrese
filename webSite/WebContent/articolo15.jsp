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
        <h1 class="mt-4">libGDX - Creiamo Snake, punti !</h1>

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
        <a href="articolo14.jsp">il mio precedente post</a> 
        per capire di cosa sto parlando e 
        il significato di alcuni termini che utilizzerÃ² :) , 
        puoi inoltre accedere alla lista di tutti i miei articoli <a href="indiceArticoli.html" target="_blank">qui</a> .
        </p>
<br>
<br>
<p class="lead">
Oggi voglio insegnarti come implementare i punti nel tuo gioco, 
in quanto sono fondamentali: <i id=sottolineato>non possono e non devono mancare!!!</i>
</p>
<p class="lead">
Oggi devi:
<br>
</p>
<ol>
	<li>
		Dichiarare una variabile di tipo <code id=sfondoColorato><code id=parolaChiave>int</code></code> scrivendo 
		<code id=sfondoColorato><code id=parolaChiave>int</code> <var>punti</var>;</code> , 
		inizzializzarla nel metodo <code id=sfondoColorato>show()</code> scrivendo 
		<code id=sfondoColorato><code id=variabile>punti</code>=0;</code> 
		e nel metodo <code id=sfondoColorato>render(<code id=parolaChiave>float</code> delta)</code> 
		nella condizione riguardante il contatto tra il serpente e il cibo scrivi 
		<code id=sfondoColorato><code id=variabile>punti</code>+=5;</code> ,
		in poche parole crea un contatore e, ogni volta che il serpente mangia, aumenta di cinque il suo valore.
	</li>
	<li>
		Utilizzare le classi <code id=sfondoColorato>Bitmapfont</code> , 
		<code id=sfondoColorato>LabelStyle</code> e 
		<code id=sfondoColorato>Label</code> per visualizzare a schermo il punteggio, 
		in alto a sinistra (o a destra se preferisci).
</ol>
<br>
<h3>BitmapFont</h3>
<p class="lead">
Questa classe ci permette di caricare i font nel nostro gioco, 
permettendoci di scegliere il tipo di carattere, la dimensione, 
il colore e tanto altro, 
tuttavia se vuoi caricare il tuo font personalizzato devi utilizzare un apposito programma per generare un file 
con estensione <b><i>fnt</i></b> e un'immagine che verranno trascinati nella cartella <b>assets</b>.
</p>
<br>
<h3>LabelStyle</h3>
<p class="lead">
Serve per impostare lo stile della <code id=sfondoColorato>label</code> , 
e utilizza il font caricato dalla classe <code id=sfondoColorato>BitmapFont</code> .
</p>
<br>
<h3>Label</h3>
<p class="lead">
Serve per disegnare il punteggio sullo schermo e prende come parametro il testo da visualizzare e 
la classe <code id=sfondoColorato>LabelStyle</code> .
</p>
<br>
<p class="lead">
In futuro farÃ² un articolo dettagliato sulla generazione di font personalizzati mediante apposito programma e 
sul loro utilizzo nel gioco, ma oggi utilizzeremo il font di default che Ã¨ giÃ  presente all'interno di libGDX 
(carattere Arial, dimensioni 15pt) scrivendo 
<code id=sfondoColorato>BitmapFont <var>font</var>;</code> 
per dichiarare la variabile e scrivendo 
<code id=sfondoColorato><code id=variabile>font</code> = <code id=parolaChiave>new</code> BitmapFont();</code> 
nel metodo <code id=sfondoColorato>show()</code> (font di default).
<br>
Il colore del font Ã¨ bianco ma se vuoi cambiarlo puoi utilizzare la funzione 
<code id=sfondoColorato><code id=variabile>font</code>.setColor(<code id=variabile>colore</code>);</code> 
per impostare il colore.
<br>
Scrivi 
<code id=sfondoColorato>LabelStyle <var>stile</var>;</code> e 
<code id=sfondoColorato>Label <var>label</var>;</code> e 
nel metodo <code id=sfondoColorato>show()</code> scrivi 
<code id=sfondoColorato><code id=variabile>stile</code> = <code id=parolaChiave>new</code> LabelStyle();</code> e 
sotto scrivi 
<code id=sfondoColorato><code id=variabile>stile</code>.font=<code id=variabile>font</code>;</code> 
per utilizzare il font sopracitato, infine scrivi 
<code id=sfondoColorato><code id=variabile>label</code> = <code id=parolaChiave>new</code> Label("0",<code id=variabile>stile</code>);</code> 
per disegnare inizialmente sullo schermo il punteggio 0 e 
<code id=sfondoColorato><code id=variabile>label</code>.setBounds(5, 480-<code id=variabile>label</code>.getHeight(),<code id=variabile>label</code>.getWidth(),<code id=variabile>label</code>.getHeight());</code> 
per posizionare la label in alto a sinistra.
<br>
Nel metodo <code id=sfondoColorato>render(<code id=parolaChiave>float</code> delta)</code> all'interno della condizione
<br>
<code id=sfondoColorato><code id=parolaChiave>if</code> (<code id=variabile>rettangolo</code>.overlaps(<code id=variabile>rettangolouovo</code>))</code> scrivi:
<br>
</p>
<pre>
<code id=variabile>punti</code>+=5;
<code id=variabile>label</code>.setText(String.valueOf(<code id=variabile>punti</code>));
</pre>
<br>
<p class="lead">
la funzione <code id=sfondoColorato>setText</code> prende come parametro un valore di tipo <code id=sfondoColorato>String</code> 
mentre per fare operazioni matematiche devo utilizzare variabili di tipo <code id=fusione>int</code> , <code id=fusione>float</code> , <code id=fusione>long</code> e <code id=fusione>double</code>, 
perciÃ² dopo aver aumentato di 5 il punteggio devo <b id=sottolineato>"trasformarlo"</b> in stringa con l'aiuto della funzione 
<code id=sfondoColorato>String.valueOf(<code id=variabile>punti</code>)</code> .
<br>
L'ultima operazione che devi fare Ã¨ scrivere <code id=sfondoColorato>label.draw(<code id=variabile>batch</code>,1);</code> 
subito dopo <code id=sfondoColorato><code id=variabile>batch</code>.begin();</code> 
(sarÃ  la prima cosa ad essere disegnata) e il secondo parametro rappresenta il numero che verrÃ  moltiplicato per il canale alpha della label 
(scrivendo 1 la nostra <code id=sfondoColorato><code id=variabile>label</code></code> sarÃ  visibile perchÃ© lascio invariato il canale alpha). 
</p>
<br>
<p class="lead">
Ed ecco il video completo:
</p>
<div class="contenitore">
	<iframe class="responsive-iframe" src="https://www.youtube.com/embed/dQHkstZ8g7A" allowfullscreen></iframe>
</div>
<br><br>
<p class="lead">
Per oggi Ã¨ tutto e <a href="articolo16.jsp">nel prossimo articolo</a> vedremo come inserire un nuovo tipo di cibo che 
il serpente dovrÃ  mangiare entro cinque secondi altrimenti sparirÃ  !
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
