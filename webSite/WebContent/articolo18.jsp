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
        <h1 class="mt-4">libGDX - Creiamo Snake, menù !</h1>

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
        <a href="articolo17.jsp">il mio precedente post</a> 
        per capire di cosa sto parlando e 
        il significato di alcuni termini che utilizzerò :) , 
        puoi inoltre accedere alla lista di tutti i miei articoli <a href="indiceArticoli.html" target="_blank">qui</a> .
        </p>
<br>
<br>
<p class="lead">
Il menù, semplice o complesso che sia, 
è molto importante in un gioco, 
e oggi ti mostrerò come implementare una schermata contenente due pulsanti che, se premuti, conducono, 
rispettivamente, 
alla schermata di gioco principale e quindi al gioco vero e proprio, 
e a una schermata di cui parlerò dettagliatamente nel <a href="articolo19.jsp" target="_blank">prossimo articolo</a>.
<br>
<br>
Insomma in quest'articolo ti spiegherò come creare un menù come quello presente nel video seguente:
</p>
<div class="contenitore">
	<iframe class="responsive-iframe" src="https://www.youtube.com/embed/G5dAaNMG-fo" allowfullscreen></iframe>
</div>
<br><br>
<p class="lead">
Crea una nuova classe che implementa l'interfaccia Screen (in questo articolo la chiamerò menu) e, 
nel file <b><i>MygdxGame.java</i></b>, sostituisci il codice 
<code id="sfondoColorato">setScreen(<code id="parolaChiave">new</code> Snake());</code> con 
<code id="sfondoColorato">setScreen(<code id="parolaChiave">new</code> Menu());</code>
<br>
All'interno di questa classe creerai il tuo menù, dichiara perciò le variabili scrivendo:
<br>
</p>
<pre>
<code id="parolaChiave">private</code> Texture <var>play</var>,<var>colore</var>,<var>playrosso</var>,<var>colorerosso</var>;
<code id="parolaChiave">private</code> OrthographicCamera <var>camera</var>;
<code id="parolaChiave">private</code> SpriteBatch <var>batch</var>;
<code id="parolaChiave">private</code> Sprite <var>plays</var>,<var>colores</var>,<var>playrossos</var>,<var>colorerossos</var>;
<code id="parolaChiave">private</code> <code id="parolaChiave">float</code> <var>scalap</var>,<var>scalac</var>;
<code id="parolaChiave">private</code> <code id="parolaChiave">boolean</code> <var>iniziop</var>,<var>inizioc</var>;
<code id="parolaChiave">private</code> Vector3 <var>vet</var>;
</pre>
<br>
<p class="lead">
La variabile di tipo <code id="sfondoColorato">Vector3</code> è un vettore di 3 dimensioni 
e ci serve per trasformare le coordinate 
del mouse in coordinate della telecamera, infatti quando il puntatore del mouse si troverà  sopra 
l'immagine, quest'ultima cambierà  colore e, in caso di pressione del tasto sinistro del mouse, inizierà  una transizione, 
al termine della quale verrà  impostata la nuova schermata di gioco (stessa logica e stesso codice per quanto riguarda 
i dispositivi mobile touch screen). 
Per quanto riguarda le altre variabili puoi trovare la spiegazione dettagliata nei miei precedenti articoli.
<br>
Inizializza le variabili nel metodo <code id="sfondoColorato">show()</code> scrivendo:
<br>
</p>
<pre>
<code id="variabile">camera</code> = <code id="parolaChiave">new</code> OrthographicCamera () ;
<code id="variabile">camera</code>.setToOrtho(<code id="parolaChiave">false</code>,800,480);
<code id="variabile">batch</code> = <code id="parolaChiave">new</code> SpriteBatch();
<code id="variabile">play</code> = <code id="parolaChiave">new</code> Texture (<code id="variabile">"Play.png"</code>);
<code id="variabile">colore</code> = <code id="parolaChiave">new</code> Texture (<code id="variabile">"colore.png"</code>);
<code id="variabile">playrosso</code> = <code id="parolaChiave">new</code> Texture (<code id="variabile">"Playrosso.png"</code>);
<code id="variabile">colorerosso</code> = <code id="parolaChiave">new</code> Texture (<code id="variabile">"colorerosso.png"</code>);
<code id="variabile">plays</code> = <code id="parolaChiave">new</code> Sprite(<code id="variabile">play</code>);
<code id="variabile">colores</code> = <code id="parolaChiave">new</code> Sprite(<code id="variabile">colore</code>);
<code id="variabile">plays</code>.setSize(<code id="variabile">play</code>.getWidth()/2, <code id="variabile">play</code>.getHeight()/2);
<code id="variabile">colores</code>.setSize(<code id="variabile">colore</code>.getWidth()/2,<code id="variabile">colore</code>.getHeight()/2);
<code id="variabile">plays</code>.setPosition(800/2-<code id="variabile">plays</code>.getWidth()/2,480/2);
<code id="variabile">colores</code>.setPosition(800/2-<code id="variabile">colores</code>.getWidth()/2,480/2-<code id="variabile">colores</code>.getHeight()-15);
<code id="variabile">playrossos</code> = <code id="parolaChiave">new</code> Sprite(<code id="variabile">playrosso</code>);
<code id="variabile">colorerossos</code> = <code id="parolaChiave">new</code> Sprite(<code id="variabile">colorerosso</code>);
<code id="variabile">playrossos</code>.setSize(<code id="variabile">play</code>.getWidth()/2, <code id="variabile">play</code>.getHeight()/2);
<code id="variabile">colorerossos</code>.setSize(<code id="variabile">colore</code>.getWidth()/2,<code id="variabile">colore</code>.getHeight()/2);
<code id="variabile">playrossos</code>.setPosition(800/2-<code id="variabile">plays</code>.getWidth()/2,480/2);
<code id="variabile">colorerossos</code>.setPosition(800/2-<code id="variabile">colores</code>.getWidth()/2,480/2-<code id="variabile">colores</code>.getHeight()-15);
<code id="variabile">plays</code>.setOrigin(<code id="variabile">plays</code>.getWidth()/2, <code id="variabile">plays</code>.getHeight()/2);
<code id="variabile">colores</code>.setOrigin(<code id="variabile">colores</code>.getWidth()/2,<code id="variabile">colores</code>.getHeight()/2);
<code id="variabile">playrossos</code>.setOrigin(<code id="variabile">playrossos</code>.getWidth()/2,<code id="variabile">playrossos</code>.getHeight()/2);
<code id="variabile">colorerossos</code>.setOrigin(<code id="variabile">colorerossos</code>.getWidth()/2,<code id="variabile">colorerossos</code>.getHeight()/2);
<code id="variabile">scalap</code>=1;
<code id="variabile">scalac</code>=1;
<code id="variabile">iniziop</code> = <code id="parolaChiave">false</code>;
<code id="variabile">inizioc</code> = <code id="parolaChiave">false</code>;
<code id="variabile">vet</code> = <code id="parolaChiave">new</code> Vector3();
</pre>
<br>
<p class="lead">
Il codice sopra significa:
<br>
"Carica due immagini con lo stesso testo ma di colore diverso: 
quando il puntatore del mouse si troverà  sull'immagine disegneremo quella di colore diverso e viceceversa".
<br>
la funzione <code id="sfondoColorato">setSize</code> serve per ridimensionare l'immagine 
(se non vuoi utilizzarla basta che carichi un'immagine con 
le dimensioni desiderate), 
la funzione <code id="sfondoColorato">setOrigin</code> serve per impostare il punto da cui partiremo a 
scalare il nostro <code id="sfondoColorato">Sprite</code> e, 
utilizzando come parametri la larghezza dello <code id="sfondoColorato">Sprite</code> diviso 2 e l'altezza dello 
<code id="sfondoColorato">Sprite</code> diviso 2, 
il punto coinciderà  con il centro dell'immagine (se non si utilizza la funzione <code id="sfondoColorato">setSize</code> 
e quindi 
non si cambiano le dimensioni dello <code id="sfondoColorato">Sprite</code>, 
il punto si trova di default al centro, 
perciò non è necessario impostarlo), <code id="fusioneV">scalap</code> e <code id="fusioneV">scalac</code> 
sono i parametri da passare alla funzione setScale per scalare l'immagine,
 infine <code id="fusioneV">iniziop</code> e <code id="fusioneV">inizioc</code> 
 servono per fare iniziare la transizione.
<br>
Infine nel metodo <code id=sfondoColorato>render(<code id=parolaChiave>float</code> delta)</code> scrivi:
<br>
</p>
<pre>
Gdx.<var>gl</var>.glClearColor(0, 0, 0.5f, 1);
Gdx.<var>gl</var>.glClear(GL20.<var>GL_COLOR_BUFFER_BIT</var>);
<code id="variabile">camera</code>.update();
<code id="variabile">vet</code>.set(Gdx.<var>input</var>.getX(),Gdx.<var>input</var>.getY(),0);
<code id="variabile">camera</code>.unproject(<code id="variabile">vet</code>);
<code id="variabile">batch</code>.setProjectionMatrix(<code id="variabile">camera</code>.combined);
<code id="variabile">batch</code>.begin();
<code id="parolaChiave">if</code> (<code id="variabile">vet</code>.x>=<code id="variabile">plays</code>.getX() &amp;&amp; <code id="variabile">vet</code>.x&lt;=<code id="variabile">plays</code>.getX()+<code id="variabile">plays</code>.getWidth() &amp;&amp; <code id="variabile">vet</code>.y>=<code id="variabile">plays</code>.getY() &amp;&amp; <code id="variabile">vet</code>.y&lt;=<code id="variabile">plays</code>.getY()+<code id="variabile">plays</code>.getHeight())
{
	<code id="variabile">playrossos</code>.draw(<code id="variabile">batch</code>);
	<code id="parolaChiave">if</code> (Gdx.<var>input</var>.justTouched()){
		<code id="parolaChiave">if</code> (!<code id="variabile">inizioc</code>)
			<code id="variabile">iniziop</code>=<code id="parolaChiave">true</code>;
	}
}
<code id="parolaChiave">else</code> <code id="parolaChiave">if</code> (<code id="variabile">scalap</code>!=0)
	<code id="variabile">plays</code>.draw(<code id="variabile">batch</code>);
<code id="parolaChiave">if</code> (<code id="variabile">vet</code>.x>=<code id="variabile">colores</code>.getX() &amp;&amp; <code id="variabile">vet</code>.x&lt;=<code id="variabile">colores</code>.getX()+<code id="variabile">colores</code>.getWidth() &amp;&amp; <code id="variabile">vet</code>.y>=<code id="variabile">colores</code>.getY() &amp;&amp; <code id="variabile">vet</code>.y&lt;=<code id="variabile">colores</code>.getY()+<code id="variabile">colores</code>.getHeight())
{
	<code id="variabile">colorerossos</code>.draw(<code id="variabile">batch</code>);
	<code id="parolaChiave">if</code> (Gdx.<var>input</var>.justTouched()){
		<code id="parolaChiave">if</code> (!<code id="variabile">iniziop</code>)
			<code id="variabile">inizioc</code>=<code id="parolaChiave">true</code>;
	}
}
<code id="parolaChiave">else</code> <code id="parolaChiave">if</code> (<code id="variabile">scalac</code>!=0)
	<code id="variabile">colores</code>.draw(<code id="variabile">batch</code>);
<code id="variabile">batch</code>.end();
<code id="parolaChiave">if</code> (!<code id="variabile">inizioc</code>){
	<code id="parolaChiave">if</code> (<code id="variabile">iniziop</code>){
		<code id="variabile">scalap</code>-=0.02;
		<code id="parolaChiave">if</code> (<code id="variabile">scalap</code>&lt;=0)
			<code id="variabile">scalap</code>=0;
		<code id="variabile">plays</code>.setScale(<code id="variabile">scalap</code>,<code id="variabile">scalap</code>);
		<code id="variabile">playrossos</code>.setScale(<code id="variabile">scalap</code>,<code id="variabile">scalap</code>);
		<code id="parolaChiave">if</code> (<code id="variabile">scalap</code>==0)
			((Game)Gdx.<var>app</var>.getApplicationListener()).setScreen(<code id="parolaChiave">new</code> Snake());
	}
}
<code id="parolaChiave">if</code> (!<code id="variabile">iniziop</code>){
	<code id="parolaChiave">if</code> (<code id="variabile">inizioc</code>){
		<code id="variabile">scalac</code>-=0.02;
		<code id="parolaChiave">if</code> (<code id="variabile">scalac</code>&lt;=0)
			<code id="variabile">scalac</code>=0;
		<code id="variabile">colores</code>.setScale(<code id="variabile">scalac</code>,<code id="variabile">scalac</code>);
		<code id="variabile">colorerossos</code>.setScale(<code id="variabile">scalac</code>,<code id="variabile">scalac</code>);
		<code id="parolaChiave">if</code> (<code id="variabile">scalac</code>==0)
			((Game)Gdx.<var>app</var>.getApplicationListener()).setScreen(<code id="parolaChiave">new</code> Schermo_colore());
	}
}
</pre>
<br>
<p class="lead">
<code id="sfondoColorato">Gdx.input.getX()</code> e <code id="sfondoColorato">Gdx.input.getY()</code> 
rappresentano le coordinate del puntatore del mouse sullo schermo (o del dito in caso di dispositivo touch screen), 
perciò utilizzo la funzione set così che la x e la y del vettore coincidano con le coordinate sopracitate, 
mentre alla z do il valore di zero. 
Per trasformare le coordinate del vettore in coordinate della telecamera, utilizzo 
<code id="sfondoColorato">camera.unproject(<code id="variabile">vet</code>);</code>
<br>
</p>
<pre>
<code id="parolaChiave">if</code> (vet.x>=<code id="variabile">plays</code>.getX() &amp;&amp; vet.x&lt;=<code id="variabile">plays</code>.getX()+<code id="variabile">plays</code>.getWidth() &amp; vet.y>=<code id="variabile">plays</code>.getY() &amp; vet.y&lt;=<code id="variabile">plays</code>.getY()+<code id="variabile">plays</code>.getHeight()) 
{
	<code id="variabile">playrossos</code>.draw(<code id="variabile">batch</code>);
	<code id="parolaChiave">if</code> (Gdx.<var>input</var>.justTouched()){
		<code id="parolaChiave">if</code> (!<code id="variabile">inizioc</code>)
			<code id="variabile">iniziop</code>=<code id="parolaChiave">true</code>;
	}
}
<code id="parolaChiave">else</code> <code id="parolaChiave">if</code> (<code id="variabile">scalap</code>!=0)
	<code id="variabile">plays</code>.draw(<code id="variabile">batch</code>);
</pre>
<br>
<p class="lead">
"Se il puntatore (o il dito in caso di cellulare touch screen) 
si trova all'interno dell'immagine, disegna l'altra immagine con lo stesso testo ma di colore diverso e 
se l'utente preme il dito/tasto del mouse inizia la transizione se l'altra non è già  iniziata, 
altrimenti se il dito/puntatore del mouse è posizionato fuori dall'immagine, 
ridisegna l'immagine precedente".
<br>
Stessa cosa per quanto riguarda le altre due immagini:
<br>
</p>
<pre>
<code id="parolaChiave">if</code> (!<code id="variabile">inizioc</code>){
	<code id="parolaChiave">if</code> (<code id="variabile">iniziop</code>){
		<code id="variabile">scalap</code>-=0.02;
		<code id="parolaChiave">if</code> (<code id="variabile">scalap</code>&lt;=0)
			<code id="variabile">scalap</code>=0;
		<code id="variabile">plays</code>.setScale(<code id="variabile">scalap</code>,<code id="variabile">scalap</code>);
		<code id="variabile">playrossos</code>.setScale(<code id="variabile">scalap</code>,<code id="variabile">scalap</code>);
		<code id="commento">//Se la transizione è iniziata e non c'è l'altra in corso,</code> 
		<code id="commento">//scala le immagini relative allo stesso testo.</code>
		<code id="parolaChiave">if</code> (<code id="variabile">scalac</code>==0)
			((Game)Gdx.<var>app</var>.getApplicationListener()).setScreen(<code id="parolaChiave">new</code> Snake());
		<code id="commento">//Se l'immagine è completamente scalata, e quindi non è più visibile</code>
		<code id="commento">//a schermo, imposta la nuova schermata.</code>
		<code id="commento">//Stessa cosa per quanto riguarda l'altra transizione.</code>
	}
}
</pre>
<br><br>
<p class="lead">
Per oggi è tutto e <a href="articolo19.jsp">nel prossimo articolo</a> vedremo come cambiare il colore del serpente, 
chi gioca potrà  quindi utilizzare uno Snake con il colore che preferisce !
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
