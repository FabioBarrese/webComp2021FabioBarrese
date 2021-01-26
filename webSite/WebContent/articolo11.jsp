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
        <h1 class="mt-4">libGDX - Creiamo Snake, muovi il serpente !</h1>

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
        <a href="articolo10.jsp">il mio precedente post</a> 
        per capire di cosa sto parlando e 
        il significato di alcuni termini che utilizzerò :) , 
        puoi inoltre accedere alla lista di tutti i miei articoli <a href="indiceArticoli.html" target="_blank">qui</a> .
        </p>
<br>
<br>
<p class="lead">
Oggi imparerai a muovere il serpente ed a farlo allungare utilizzando le variabili tralasciate nel mio articolo antecedente.</p>
<p class="lead">
Per fare ciò:
<br>
</p>
<ol>
	<li>muovi la testa del serpente (a cui ho dato il nome di <b><i>rettangolo</i></b> nell'articolo precedente).</li>
	<li>successivamente aggiorna la posizione degli elementi (dall'ultimo al primo) 
		che compongono il serpente utilizzando le coordinate dell'elemento successivo per dare 
		"<b id=sottolineato>l'effetto serpente</b>".</li>
	<li>infine aggiungi un'elemento alla fine del corpo del serpente  ogni qualvolta quest'ultimo 
		mangia il cibo per farlo allungare .</li>
</ol>
<br>
<p class="lead">
Per soddisfare in parte il punto 1 dichiara quattro variabili booleane e 4 variabili di tipo int scrivendo:
<br>
</p>
<pre>
	<code id=parolaChiave>boolean</code> <var>su</var>;
	<code id=parolaChiave>boolean</code> <var>giu</var>;
	<code id=parolaChiave>boolean</code> <var>sinistra</var>;
	<code id=parolaChiave>boolean</code> <var>destra</var>; 	
	<code id=parolaChiave>int</code> <var>contadestra</var>;
	<code id=parolaChiave>int</code> <var>contasinistra</var>;
	<code id=parolaChiave>int</code> <var>contasu</var>;
	<code id=parolaChiave>int</code> <var>contagiu</var>;
</pre>
<br>
<p class="lead">
inizializzale nel metodo <b>show()</b> scrivendo:
<br>
</p>
<pre>
	<code id=variabile>su</code>=<code id=parolaChiave>false</code>;
	<code id=variabile>giu</code>=<code id=parolaChiave>false</code>; 
	<code id=variabile>sinistra</code>=<code id=parolaChiave>false</code>;
	<code id=variabile>destra</code>=<code id=parolaChiave>true</code>;   <code id=commento>//(all'avvio del programma il serpente "corre" verso destra)</code>
	<code id=variabile>contadestra</code>=1;
	<code id=variabile>contasinistra</code>=0;
	<code id=variabile>contasu</code>=0;
	<code id=variabile>contagiu</code>=0;
</pre>
<p class="lead">
Le prime quattro servono per far muovere il serpente nella direzione desiderata quando si preme un tasto della 
tastiera (o il dito in caso di cellulare touch screen), 
mentre le altre servono per impedire che lo stesso tasto venga premuto due o più volte di seguito, 
per esempio se premessi più volte di seguito la freccia destra il serpente aumenterebbe la sua velocità verso destra 
in maniera esponenziale così da rendere il gioco ingiocabile.
</p>
<p class="lead">
Detto questo scrivi il seguente codice nel metodo 
<code id=sfondoColorato>render(<code id=parolaChiave>float</code> delta)</code> 
per soddisfare in parte i punti 1 e 2 visti sopra:<br>
</p>
<pre>
	Gdx.<var>gl</var>.glClearColor(0, 0, 0.5f, 1);
	Gdx.<var>gl</var>.glClear(GL20.<var>GL_COLOR_BUFFER_BIT</var>);
	<code id=variabile>camera</code>.update();
	<code id=variabile>batch</code>.setProjectionMatrix(<code id=variabile>camera</code>.combined);
	<code id=variabile>Snake</code>.setPosition(<code id=variabile>rettangolo</code>.x,<code id=variabile>rettangolo</code>.y);
	<code id=parolaChiave>for</code>(<code id=parolaChiave>int</code> i=0; i&lt;<code id=variabile>immagini</code>.size;i++){
		<code id=parolaChiave>if</code>(<code id=variabile>immagini</code>.get(i)!=<code id=parolaChiave>null)</code>{
			<code id=variabile>immagini</code>.get(i).setPosition(<code id=variabile>rettangoli</code>.get(i).x,<code id=variabile>rettangoli</code>.get(i).y);
		}
	}
	<code id=variabile>batch</code>.begin();
	<code id=variabile>batch</code>.draw(<code id=variabile>uovo</code>, <code id=variabile>rettangolouovo</code>.x, <code id=variabile>rettangolouovo</code>.y);
	<code id=parolaChiave>for</code>(<code id=parolaChiave>int</code> i=0; i&lt;<code id=variabile>immagini</code>.size;i++){
		<code id=parolaChiave>if</code>(<code id=variabile>immagini</code>.get(i)!=<code id=parolaChiave>null)</code>{
			<code id=variabile>immagini</code>.get(i).draw(<code id=variabile>batch</code>);
		}
	}
	<code id=variabile>Snake</code>.draw(<code id=variabile>batch</code>);
	<code id=variabile>batch</code>.end();
	<code id=parolaChiave>for</code>(<code id=parolaChiave>int</code> i=<code id=variabile>ultimo</code>; i>=0; i--){
		<code id=parolaChiave>if</code> (i>0) {
			<code id=variabile>rettangoli</code>.get(i).x=<code id=variabile>rettangoli</code>.get(i-1).x;
		  	<code id=variabile>rettangoli</code>.get(i).y=<code id=variabile>rettangoli</code>.get(i-1).y;
		}
		<code id=parolaChiave>else</code> {
		  	<code id=variabile>rettangoli</code>.get(i).x=<code id=variabile>rettangolo</code>.x;
		  	<code id=variabile>rettangoli</code>.get(i).y=<code id=variabile>rettangolo</code>.y;
		}         
	}
	<code id=parolaChiave>if</code> (<code id=variabile>destra</code>){
		<code id=variabile>rettangolo</code>.x+=5;
	}
	<code id=parolaChiave>if</code> (<code id=variabile>sinistra</code>){
		<code id=variabile>rettangolo</code>.x-=5;
	}
	<code id=parolaChiave>if</code> (<code id=variabile>su</code>){
		<code id=variabile>rettangolo</code>.y+=5;
	}
	<code id=parolaChiave>if</code> (<code id=variabile>giu</code>){
		<code id=variabile>rettangolo</code>.y-=5;
	}
</pre>
<br>
<p class="lead">
Le prime due righe servono per scegliere il colore di sfondo e pulire il buffer, 
la terza e la quarta per aggiornare la telecamera e farla utilizzare allo SpriteBatch, dalla quinta alla decima posiziono sullo schermo la testa e gli elementi che 
costituiscono il corpo del serpente, dall'undicesima alla diciottesima disegno tutte le immagini caricate, 
dalla diciannovesima alla ventottesima do all'elemento precedente la posizione dell'elemento successivo per creare 
"<b id=sottolineato>l'effetto serpente</b>" (crea la variabile ultimo e inizializzala nel metodo <code id=sfondoColorato>show()</code> scrivendo 
<code id=sfondoColorato>ultimo=4;</code> perché in questo caso all'avvio ho creato un serpente composto da 5 elementi esclusa 
la testa e poiché il primo elemento di un'Array si trova in posizione 0 l'ultimo sarà in posizione 4) e 
dalla ventinovesima alla quarantesima sposto il serpente nella posizione desiderata.
<br>
Infine sempre nel metodo <code id=sfondoColorato>render(<code id=parolaChiave>float</code> delta)</code>, 
sotto il codice scritto sopra, scrivi il seguente codice per soddisfare tutti i punti sopracitati:<br>
</p>
<pre>
	<code id=parolaChiave>if</code> (<code id=variabile>rettangolo</code>.overlaps(<code id=variabile>rettangolouovo</code>)) {
		<code id=variabile>immagini</code>.add(new Sprite(<code id=variabile>Snake</code>));
		<code id=variabile>rettangoli</code>.add(new Rectangle());
		<code id=variabile>ultimo</code>+=1;
		<code id=variabile>rettangoli</code>.get(<code id=variabile>ultimo</code>).x=-20;
		<code id=variabile>rettangolouovo</code>.x= MathUtils.<var>random</var>(0, 800-<code id=variabile>uovo</code>.getWidth());
		<code id=variabile>rettangolouovo</code>.y= MathUtils.<var>random</var>(0, 480-<code id=variabile>uovo</code>.getHeight());
	}
	<code id=parolaChiave>if</code> (<code id=variabile>contasinistra</code>==0) {
		<code id=parolaChiave>if</code> (!<code id=variabile>destra</code>) {
			<code id=parolaChiave>if</code> (Gdx.<var>input</var>.isKeyJustPressed(Keys.LEFT)) {
				<code id=variabile>sinistra</code>=true;
				<code id=variabile>destra</code>=false;
				<code id=variabile>su</code>=false;
				<code id=variabile>giu</code>=false;
				<code id=variabile>contasinistra</code>=1;
				<code id=variabile>contadestra</code>=0;
				<code id=variabile>contasu</code>=0;
				<code id=variabile>contagiu</code>=0;
			}
		}
	}
	<code id=parolaChiave>if</code> (<code id=variabile>contadestra</code>==0) {
		<code id=parolaChiave>if</code> (!<code id=variabile>sinistra</code>) {
			<code id=parolaChiave>if</code> (Gdx.<var>input</var>.isKeyJustPressed(Keys.RIGHT)) {
				<code id=variabile>sinistra</code>=false;
				<code id=variabile>destra</code>=true;
				<code id=variabile>su</code>=false;
				<code id=variabile>giu</code>=false;
				<code id=variabile>contasinistra</code>=0;
				<code id=variabile>contadestra</code>=1;
				<code id=variabile>contasu</code>=0;
				<code id=variabile>contagiu</code>=0;
			}
		}
	}
	<code id=parolaChiave>if</code> (<code id=variabile>contasu</code>==0){
		<code id=parolaChiave>if</code> (!<code id=variabile>giu</code>){
			<code id=parolaChiave>if</code> (Gdx.<var>input</var>.isKeyJustPressed(Keys.UP)) {
				<code id=variabile>sinistra</code>=false;
				<code id=variabile>destra</code>=false;
				<code id=variabile>su</code>=true;
				<code id=variabile>giu</code>=false;
				<code id=variabile>contasinistra</code>=0;
				<code id=variabile>contadestra</code>=0;
				<code id=variabile>contasu</code>=1;
				<code id=variabile>contagiu</code>=0;
			}
		}
	}
	<code id=parolaChiave>if</code> (<code id=variabile>contagiu</code>==0){
		<code id=parolaChiave>if</code> (!<code id=variabile>su</code>){
			<code id=parolaChiave>if</code> (Gdx.<var>input</var>.isKeyJustPressed(Keys.DOWN)) {
				<code id=variabile>sinistra</code>=false;
				<code id=variabile>destra</code>=false;
				<code id=variabile>su</code>=false;
				<code id=variabile>giu</code>=true;
				<code id=variabile>contasinistra</code>=0;
				<code id=variabile>contadestra</code>=0;
				<code id=variabile>contasu</code>=0;
				<code id=variabile>contagiu</code>=1;
			}
		}
	}
</pre>
<br><br>	
<p class="lead">
Le prime 8 righe servono per allungare il serpente ogni qualvolta entra in contatto con il cibo, 
dalla nona in poi cambio la direzione del serpente premendo le freccie della tastiera.
</p>
<br><br>
<p class="lead">
Per oggi è tutto e <a href="articolo12.jsp">nel prossimo articolo</a> ti spiegherò come aggiungere musica ed effetti sonori al tuo gioco.
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
