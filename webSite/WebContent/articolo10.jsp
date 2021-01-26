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
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a class="nav-link"
						href="presentazione.html" target="_blank">Home <span
							class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="https://www.udemy.com/user/fabio-barrese-2/" target="_blank">About</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#"
						id='contatto'>Contact</a></li>
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
				<h1 class="mt-4">libGDX - Creiamo Snake !</h1>

				<!-- Author -->
				<p class="lead">
					by <a href="https://www.udemy.com/user/fabio-barrese-2/"
						target="_blank">Fabio Barrese</a>
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
				<p class="lead">
					Prima di proseguire nella lettura ti consiglio di leggere <a
						href="articolo9.jsp">il mio precedente post</a> per capire di cosa
					sto parlando e il significato di alcuni termini che utilizzerò :) ,
					puoi inoltre accedere alla lista di tutti i miei articoli <a
						href="indiceArticoli.html" target="_blank">qui</a> .
				</p>
				<br> <br>
				<p class="lead">Come da titolo finalmente mi addentrerò nella
					creazione di un gioco vero e proprio, perciò se hai voglia di
					scoprire come fare resta con me e non perderti i miei prossimi
					articoli !</p>
				<p class="lead">
					Innanzitutto ecco il video della parte di gioco che tratteremo in
					questi post iniziali <a
						href="https://www.youtube.com/watch?v=I_s_E9jCSvk&feature=youtu.be"
						target="_blank">qui</a>.
				</p>
				<p class="lead">
					Prima di cominciare a programmare devi capire quali sono i passi
					fondamentali per la creazione del gioco: <br>
				</p>
				<ol>
					<li>Creazione della testa e del corpo del serpente.</li>
					<li>Creazione del "cibo" da dare in pasto al serpente.</li>
					<li>Aumento della lunghezza del serpente (dopo che mangia il
						cibo).</li>
				</ol>
				<br>
				<p class="lead">
					Per soddisfare il punto 1 crea un'immagine, con paint o con
					qualsiasi altro programma di disegno, verde (o del colore che vuoi)
					di dimensioni 10 x 10 pixels e inseriscila nella cartella assets.
					Dopodiché caricala da codice scrivendo
					<code>private Texture immagine;</code>
					e inizializzala nel metodo <b>show()</b> (se stai usando la classe
					Screen di cui ti ho parlato qui). <br> Fai la stessa cosa con
					la classe <b>Sprite</b> (in questo post lo chiamo Snake e utilizza
					come parametro immagine), <b>OrthographicCamera</b> (io ho
					utilizzato una schermata di 800 x 480 pixels), <b>Rectangle</b>
					(crea un rettangolo e "incollalo" all'immagine, in questo articolo
					lo chiamerò rettangolo e se non sai come fare guarda qui) e <b>SpriteBatch</b>
					(disegna l'immagine). <br> Fai perciò tutto quello che hai
					imparato nei miei precedenti articoli per disegnare l'immagine.
				</p>
				<p class="lead">
					L'immagine da te caricata non rappresenta solo la testa del
					serpente infatti per creare il corpo utilizzeremo quest'ultima e
					ogni qualvolta il serpente mangerà verrà aggiunta alla fine. Per
					fare ciò utilizzeremo due Array di lunghezza 1000 (scelta
					arbitraria, se l'utente riesce a far crescere il serpente fino a
					questo punto , cosa altamente improbabile , il gioco finirà e
					l'utente avrà vinto) che conterranno rispettivamente le immagini e
					i rettangoli relativi alle immagini. Scrivi quindi
					<code>Array&lt;Sprite&gt; immagini;</code>
					e
					<code>Array&lt;Rectangle&gt; rettangoli;</code>
					per dichararli. <br> Poi nel metodo <b>show()</b>
					inizializzali scrivendo
					<code>immagini = new Array&lt;Sprite&gt;(1000);</code>
					e
					<code>rettangoli = new Array&lt;Rectangle&gt;(1000);</code>
					<br> In questo articolo il serpente avrà una lunghezza
					iniziale di 6 (5 elementi più la testa) e la imposteremo scrivendo
					(nel metodo <b>show()</b>): <br>
				</p>
				<pre>
	<b> 
		for (int i =0; i&lt;5 ; i++) 
		{
			immagini.add(new Sprite(Snake));
			rettangoli.add(new Rectangle()); 
			rettangoli.get(i).x=(rettangolo.x-(immagini.get(i).getWidth()*(i+1))-(1*(i+1))); 
			rettangoli.get(i).y=rettangolo.y;
			rettangoli.get(i).width=rettangolo.width;
			rettangoli.get(i).height=rettangolo.height; 
		}	
	</b>
</pre>
				<br>
				<p class="lead">In poche parole aggiungo i primi 5 elementi
					all'Array e li posiziono alla sinistra della testa in fila (il
					serpente inizierà la sua "corsa" verso destra) con dimensioni
					uguali a quelle della testa.</p>
				<p class="lead">
					L'ultimo argomento di cui discuteremo oggi riguarda la creazione
					del cibo, dopodiché come al solito lascerò in allegato la foto per
					una maggiore comprensione. <br> Scegli un'immagine che
					rappresenti il cibo, caricala nel gioco (in questo post la chiamerò
					<b><i>uovo</i></b>) e "incolla" un rettangolo (in questo post lo
					chiamerò <b><i>rettangolouovo</i></b>) su di essa: la x e la y del
					rettangolo devono avere un valore casuale compreso rispettivamente
					tra 0 e la larghezza dello schermo meno la larghezza dell'immagine
					e 0 e l'altezza dello schermo meno l'altezza dell'immagine, che in
					questo caso corrispondono a 800 e 480, scrivi quindi
					<code>rettangolouovo.x=MathUtils.random(0,
						800-uovo.getWidth());</code>
					e
					<code>rettangolouovo.y=MathUtils.random(0,480-uovo.getHeight());</code>
					<br> Infine ecco la foto delle veriabili trattate oggi:
				</p>
				<br> <br> <img src="media/articolo10Imm1.png"
					class="img-fluid rounded"> <br> <br>
				<p class="lead">
					Per oggi è tutto e <a href="articolo11.jsp">nel prossimo
						articolo</a> introdurrò le variabili presenti nella foto che non sono
					state trattate , così come il punto 3 (l'allungamento del
					serpente). <br> <br> <b>ALLA PROSSIMA :)</b>
				</p>
				<hr>



				<!-- Single Comment -->
				<div class="media mb-4">

					<div class="media-body"></div>
				</div>

				<!-- Comment with nested comments -->
				<div class="media mb-4">
					<div class="media-body">
						<div class="media mt-4"></div>

						<div class="media mt-4"></div>

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
							<input type="text" class="form-control"
								placeholder="Search for..." id=domanda> <span
								class="input-group-btn">
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
									<li><a href="https://www.google.com/search?q=GameDev">Game
											Dev</a></li>
									<li><a href="https://www.google.com/search?q=HTML">HTML</a>
									</li>
									<li><a href="https://www.google.com/search?q=libGDX">libGDX</a>
									</li>
								</ul>
							</div>
							<div class="col-lg-6">
								<ul class="list-unstyled mb-0">
									<li><a href="https://www.google.com/search?q=JavaScript">JavaScript</a>
									</li>
									<li><a href="https://www.google.com/search?q=CSS">CSS</a>
									</li>
									<li><a href="https://www.google.com/search?q=Tutorials">Tutorials</a>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>

				<!-- Side Widget -->
				<div>
					<h5></h5>
					<div id='orologio'></div>
				</div>

			</div>

		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->

	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Fabio
				Barrese</p>
		</div>
		<!-- /.container -->
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
