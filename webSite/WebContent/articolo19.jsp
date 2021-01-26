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
        <h1 class="mt-4">libGDX - Creiamo Snake, colore !</h1>

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
        <a href="articolo18.jsp">il mio precedente post</a> 
        per capire di cosa sto parlando e 
        il significato di alcuni termini che utilizzerò :) , 
        puoi inoltre accedere alla lista di tutti i miei articoli <a href="indiceArticoli.html" target="_blank">qui</a> .
        </p>
<br>
<br>
<p class="lead">
Questo sarà  un articolo breve, 
infatti mi limiterò a mostrarti il codice sorgente per scegliere il colore del serpente, 
tuttavia mi soffermerò su alcune cose per farti avere il quadro completo della situazione.
<br>
Ti ricordo che la schermata per cambiare il colore del serpente è quella che si attiva cliccando sul pulsante "Snake" 
(guarda <a href="articolo18.jsp">il mio precedente articolo</a> per capire meglio).
Perciò all'interno della classe <code id="sfondoColorato">Schermo_colore</code>, nel metodo 
<code id="sfondoColorato">show()</code>, 
scrivi (dopo aver dichiarato le variabili):
<br>
</p>
<pre>
<code id="variabile">camera</code> = <code id="parolaChiave">new</code> OrthographicCamera ();
<code id="variabile">camera</code>.setToOrtho(<code id="parolaChiave">false</code>,800,480);
<code id="variabile">batch</code> = <code id="parolaChiave">new</code> SpriteBatch();
<code id="variabile">colore</code> = <code id="parolaChiave">new</code> Texture (<code id="variabile">"serpente.png"</code>);
<code id="variabile">cornice</code> = <code id="parolaChiave">new</code> Texture (<code id="variabile">"cornice.png"</code>);
<code id="variabile">pulsante</code> = <code id="parolaChiave">new</code> Texture(<code id="variabile">"pulsante.png"</code>);
<code id="variabile">mex</code> = <code id="parolaChiave">new</code> Texture(<code id="variabile">"messaggio.png"</code>);
<code id="variabile">mexs</code> = <code id="parolaChiave">new</code> Sprite(<code id="variabile">mex</code>);
<code id="variabile">mexs</code>.setPosition(800/2-<code id="variabile">mexs</code>.getWidth()/2,480/2+60);
<code id="variabile">mexs</code>.setAlpha(0);
<code id="variabile">plays</code> = <code id="parolaChiave">new</code> Sprite(<code id="variabile">pulsante</code>);
<code id="variabile">plays</code>.setSize(<code id="variabile">pulsante</code>.getWidth()/2,<code id="variabile">pulsante</code>.getHeight()/2);
<code id="variabile">plays</code>.setPosition(800-<code id="variabile">plays</code>.getWidth()-20,20);
<code id="variabile">cornices</code> = <code id="parolaChiave">new</code> Sprite(<code id="variabile">cornice</code>);
<code id="variabile">serpente</code> = <code id="parolaChiave">new</code> Sprite(<code id="variabile">colore</code>);
<code id="variabile">vet</code> = <code id="parolaChiave">new</code> Vector3();
<code id="variabile">verde</code> = <code id="parolaChiave">false</code>;
<code id="variabile">rosso</code>=<code id="parolaChiave">false</code>;
<code id="variabile">giallo</code>=<code id="parolaChiave">false</code>;
<code id="variabile">nero</code>=<code id="parolaChiave">false</code>;
<code id="variabile">bianco</code>=<code id="parolaChiave">false</code>;
<code id="variabile">arancione</code>=<code id="parolaChiave">false</code>;
<code id="variabile">cyan</code>=<code id="parolaChiave">false</code>;
<code id="variabile">sal</code>=<code id="parolaChiave">false</code>;
<code id="variabile">chartreuse</code>=<code id="parolaChiave">false</code>;
<code id="variabile">magenta</code>=<code id="parolaChiave">false</code>;
<code id="variabile">firebrik</code>=<code id="parolaChiave">false</code>;
<code id="variabile">tan</code>=<code id="parolaChiave">false</code>;
<code id="variabile">cambiaschermo</code>=<code id="parolaChiave">false</code>;
<code id="variabile">alpha</code> = 0;
</pre>
<br>
<p class="lead">
le variabili che rappresentano i colori devono essere così dichiarate :
</p>
<pre>
<code id="parolaChiave">public static boolean</code> <var>verde</var>, 
<var>rosso</var>,<var>giallo</var>,<var>nero</var>,<var>bianco</var>, 
<var>arancione</var>,<var>cyan</var>,<var>sal</var>,<var>chartreuse</var>,
<var>magenta</var>,<var>firebrik</var>,<var>tan</var>;
</pre>
<br>
<p class="lead">
Ti starai chiedendo Perchè devono essere statiche e pubbliche, 
la risposta è che quando selezioniamo un colore, 
la schermata principale di gioco (la classe snake) deve sapere che colore è, 
deve quindi condividere il valore della variabile con la schermata dei colori, 
e per fare ciò dobbiamo rendere le variabili statiche.
<br>
Nel metodo <code id=sfondoColorato>render(<code id=parolaChiave>float</code> delta)</code> scrivi:
<br>
</p>
<pre>
Gdx.<var>gl</var>.glClearColor(0, 0, 0.5f, 1);
Gdx.<var>gl</var>.glClear(GL20.<var>GL_COLOR_BUFFER_BIT</var>);
<code id="parolaChiave">if</code> (!<code id="variabile">cambiaschermo</code>){
	<code id="variabile">camera</code>.update();
	<code id="variabile">vet</code>.set(Gdx.<var>input</var>.getX(),Gdx.<var>input</var>.getY(),0);
	<code id="variabile">camera</code>.unproject(<code id="variabile">vet</code>);
	<code id="variabile">batch</code>.setProjectionMatrix(<code id="variabile">camera</code>.combined);
	<code id="variabile">batch</code>.begin();
	<code id="parolaChiave">if</code> (<code id="variabile">vet</code>.x>=800/2-75-102 &amp;&amp; <code id="variabile">vet</code>.x&lt;=800/2-75-102+50 &amp;&amp; <code id="variabile">vet</code>.y>= 480/2+100 &amp;&amp; <code id="variabile">vet</code>.y&lt;=480/2+100+50){
		<code id="variabile">cornices</code>.setColor(Color.<var>RED</var>);
		<code id="variabile">cornices</code>.setPosition(800/2-75-102-2, 480/2+100-2);
		<code id="variabile">cornices</code>.draw(<code id="variabile">batch</code>);
		<code id="parolaChiave">if</code> (Gdx.<var>input</var>.justTouched()) {
			<code id="variabile">verde</code>=<code id="parolaChiave">true</code>;
			<code id="variabile">rosso</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">giallo</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">nero</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">bianco</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">arancione</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">cyan</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">sal</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">chartreuse</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">magenta</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">firebrik</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">tan</code>=<code id="parolaChiave">false</code>;
		}
	}
	<code id="parolaChiave">if</code> (<code id="variabile">verde</code>){
		<code id="variabile">cornices</code>.setColor(Color.<var>RED</var>);
		<code id="variabile">cornices</code>.setPosition(800/2-75-102-2, 480/2+100-2);
		<code id="variabile">cornices</code>.draw(<code id="variabile">batch</code>);
	}
	<code id="variabile">serpente</code>.setColor(Color.<var>GREEN</var>);
	<code id="variabile">serpente</code>.setPosition(800/2-75-102, 480/2+100);
	<code id="variabile">serpente</code>.draw(<code id="variabile">batch</code>);
	<code id="parolaChiave">if</code> (<code id="variabile">vet</code>.x>=800/2-75 &amp;&amp; <code id="variabile">vet</code>.x&lt;=800/2-75+50 &amp;&amp; <code id="variabile">vet</code>.y>= 480/2+100 &amp;&amp; <code id="variabile">vet</code>.y&lt;=480/2+100+50){
		<code id="variabile">cornices</code>.setColor(Color.<var>WHITE</var>);
		<code id="variabile">cornices</code>.setPosition(800/2-75-2, 480/2+100-2);
		<code id="variabile">cornices</code>.draw(<code id="variabile">batch</code>);
		<code id="parolaChiave">if</code> (Gdx.<var>input</var>.justTouched()) {
			<code id="variabile">verde</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">rosso</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">giallo</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">nero</code>=<code id="parolaChiave">true</code>;
			<code id="variabile">bianco</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">arancione</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">cyan</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">sal</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">chartreuse</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">magenta</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">firebrik</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">tan</code>=<code id="parolaChiave">false</code>;
		}
	}
	<code id="parolaChiave">if</code> (<code id="variabile">nero</code>){
		<code id="variabile">cornices</code>.setColor(Color.<var>WHITE</var>);
		<code id="variabile">cornices</code>.setPosition(800/2-75-2, 480/2+100-2);
		<code id="variabile">cornices</code>.draw(<code id="variabile">batch</code>);
	}
	<code id="variabile">serpente</code>.setColor(Color.<var>BLACK</var>);
	<code id="variabile">serpente</code>.setPosition(800/2-75, 480/2+100);
	<code id="variabile">serpente</code>.draw(<code id="variabile">batch</code>);
	<code id="parolaChiave">if</code> (<code id="variabile">vet</code>.x>=800/2-75+102 &amp;&amp; <code id="variabile">vet</code>.x&lt;=800/2-75+102+50 &amp;&amp; <code id="variabile">vet</code>.y>= 480/2+100 &amp;&amp; <code id="variabile">vet</code>.y&lt;=480/2+100+50){
		<code id="variabile">cornices</code>.setColor(Color.<var>MAROON</var>);
		<code id="variabile">cornices</code>.setPosition(800/2-75+102-2, 480/2+100-2);
		<code id="variabile">cornices</code>.draw(<code id="variabile">batch</code>);
		<code id="parolaChiave">if</code> (Gdx.<var>input</var>.justTouched()) {
			<code id="variabile">verde</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">rosso</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">giallo</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">nero</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">bianco</code>=<code id="parolaChiave">true</code>;
			<code id="variabile">arancione</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">cyan</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">sal</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">chartreuse</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">magenta</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">firebrik</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">tan</code>=<code id="parolaChiave">false</code>;
		}
	}
	<code id="parolaChiave">if</code> (<code id="variabile">bianco</code>){
		<code id="variabile">cornices</code>.setColor(Color.<var>MAROON</var>);
		<code id="variabile">cornices</code>.setPosition(800/2-75+102-2, 480/2+100-2);
		<code id="variabile">cornices</code>.draw(<code id="variabile">batch</code>);
	}
	<code id="variabile">serpente</code>.setColor(Color.<var>WHITE</var>);
	<code id="variabile">serpente</code>.setPosition(800/2-75+102, 480/2+100);
	<code id="variabile">serpente</code>.draw(<code id="variabile">batch</code>);
	<code id="parolaChiave">if</code> (<code id="variabile">vet</code>.x>=800/2-75+204 &amp;&amp; <code id="variabile">vet</code>.x&lt;=800/2-75+204+50 &amp;&amp; <code id="variabile">vet</code>.y>= 480/2+100 &amp;&amp; <code id="variabile">vet</code>.y&lt;=480/2+100+50){
		<code id="variabile">cornices</code>.setColor(Color.<var>TAN</var>);
		<code id="variabile">cornices</code>.setPosition(800/2-75+204-2, 480/2+100-2);
		<code id="variabile">cornices</code>.draw(<code id="variabile">batch</code>);
		<code id="parolaChiave">if</code> (Gdx.<var>input</var>.justTouched()) {
			<code id="variabile">verde</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">rosso</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">giallo</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">nero</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">bianco</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">arancione</code>=<code id="parolaChiave">true</code>;
			<code id="variabile">cyan</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">sal</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">chartreuse</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">magenta</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">firebrik</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">tan</code>=<code id="parolaChiave">false</code>;
		}
	}
	<code id="parolaChiave">if</code> (<code id="variabile">arancione</code>){
		<code id="variabile">cornices</code>.setColor(Color.<var>TAN</var>);
		<code id="variabile">cornices</code>.setPosition(800/2-75+204-2, 480/2+100-2);
		<code id="variabile">cornices</code>.draw(<code id="variabile">batch</code>);
	}
	<code id="variabile">serpente</code>.setColor(Color.<var>ORANGE</var>);
	<code id="variabile">serpente</code>.setPosition(800/2-75+204, 480/2+100);
	<code id="variabile">serpente</code>.draw(<code id="variabile">batch</code>);
	<code id="parolaChiave">if</code> (<code id="variabile">vet</code>.x>=800/2-75-102 &amp;&amp; <code id="variabile">vet</code>.x&lt;=800/2-75-102+50 &amp;&amp; <code id="variabile">vet</code>.y>= 480/2+100-102 &amp;&amp; <code id="variabile">vet</code>.y&lt;=480/2+100-102+50){
		<code id="variabile">cornices</code>.setColor(Color.<var>CHARTREUSE</var>);
		<code id="variabile">cornices</code>.setPosition(800/2-75-102-2, 480/2+100-102-2);
		<code id="variabile">cornices</code>.draw(<code id="variabile">batch</code>);
		<code id="parolaChiave">if</code> (Gdx.<var>input</var>.justTouched()) {
			<code id="variabile">verde</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">rosso</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">giallo</code>=<code id="parolaChiave">true</code>;
			<code id="variabile">nero</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">bianco</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">arancione</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">cyan</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">sal</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">chartreuse</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">magenta</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">firebrik</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">tan</code>=<code id="parolaChiave">false</code>;
		}
	}
	<code id="parolaChiave">if</code> (<code id="variabile">giallo</code>){
		<code id="variabile">cornices</code>.setColor(Color.<var>CHARTREUSE</var>);
		<code id="variabile">cornices</code>.setPosition(800/2-75-102-2, 480/2+100-102-2);
		<code id="variabile">cornices</code>.draw(<code id="variabile">batch</code>);
	}
	<code id="variabile">serpente</code>.setColor(Color.<var>YELLOW</var>);
	<code id="variabile">serpente</code>.setPosition(800/2-75-102, 480/2+100-102);
	<code id="variabile">serpente</code>.draw(<code id="variabile">batch</code>);
	<code id="parolaChiave">if</code> (<code id="variabile">vet</code>.x>=800/2-75 &amp;&amp; <code id="variabile">vet</code>.x&lt;=800/2-75+50 &amp;&amp; <code id="variabile">vet</code>.y>= 480/2+100-102 &amp;&amp; <code id="variabile">vet</code>.y&lt;=480/2+100-102+50){
		<code id="variabile">cornices</code>.setColor(Color.<var>GREEN</var>);
		<code id="variabile">cornices</code>.setPosition(800/2-75-2, 480/2+100-102-2);
		<code id="variabile">cornices</code>.draw(<code id="variabile">batch</code>);
		<code id="parolaChiave">if</code> (Gdx.<var>input</var>.justTouched()) {<code id="variabile">verde</code>=<code id="parolaChiave">false</code>;<code id="variabile">rosso</code>=<code id="parolaChiave">true</code>;
			<code id="variabile">giallo</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">nero</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">bianco</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">arancione</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">cyan</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">sal</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">chartreuse</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">magenta</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">firebrik</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">tan</code>=<code id="parolaChiave">false</code>;
		}
	}
	<code id="parolaChiave">if</code> (<code id="variabile">rosso</code>){
		<code id="variabile">cornices</code>.setColor(Color.<var>GREEN</var>);
		<code id="variabile">cornices</code>.setPosition(800/2-75-2, 480/2+100-102-2);
		<code id="variabile">cornices</code>.draw(<code id="variabile">batch</code>);
	}
	<code id="variabile">serpente</code>.setColor(Color.<var>RED</var>);
	<code id="variabile">serpente</code>.setPosition(800/2-75, 480/2+100-102);
	<code id="variabile">serpente</code>.draw(<code id="variabile">batch</code>);
	<code id="parolaChiave">if</code> (<code id="variabile">vet</code>.x>=800/2-75+102 &amp;&amp; <code id="variabile">vet</code>.x&lt;=800/2-75+102+50 &amp;&amp; <code id="variabile">vet</code>.y>= 480/2+100-102 &amp;&amp; <code id="variabile">vet</code>.y&lt;=480/2+100-102+50){
		<code id="variabile">cornices</code>.setColor(Color.<var>SALMON</var>);
		<code id="variabile">cornices</code>.setPosition(800/2-75+102-2, 480/2+100-102-2);
		<code id="variabile">cornices</code>.draw(<code id="variabile">batch</code>);
		<code id="parolaChiave">if</code> (Gdx.<var>input</var>.justTouched()) {<code id="variabile">verde</code>=<code id="parolaChiave">false</code>;<code id="variabile">rosso</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">giallo</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">nero</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">bianco</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">arancione</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">cyan</code>=<code id="parolaChiave">true</code>;
			<code id="variabile">sal</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">chartreuse</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">magenta</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">firebrik</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">tan</code>=<code id="parolaChiave">false</code>;
		}
	}
	<code id="parolaChiave">if</code> (<code id="variabile">cyan</code>){
		<code id="variabile">cornices</code>.setColor(Color.<var>SALMON</var>);
		<code id="variabile">cornices</code>.setPosition(800/2-75+102-2, 480/2+100-102-2);
		<code id="variabile">cornices</code>.draw(<code id="variabile">batch</code>);
	}
	<code id="variabile">serpente</code>.setColor(Color.<var>CYAN</var>);
	<code id="variabile">serpente</code>.setPosition(800/2-75+102, 480/2+100-102);
	<code id="variabile">serpente</code>.draw(<code id="variabile">batch</code>);
	<code id="parolaChiave">if</code> (<code id="variabile">vet</code>.x>=800/2-75+204 &amp;&amp; <code id="variabile">vet</code>.x&lt;=800/2-75+204+50 &amp;&amp; <code id="variabile">vet</code>.y>= 480/2+100-102 &amp;&amp; <code id="variabile">vet</code>.y&lt;=480/2+100-102+50){
		<code id="variabile">cornices</code>.setColor(Color.<var>CYAN</var>);
		<code id="variabile">cornices</code>.setPosition(800/2-75+204-2, 480/2+100-102-2);
		<code id="variabile">cornices</code>.draw(<code id="variabile">batch</code>);
		<code id="parolaChiave">if</code> (Gdx.<var>input</var>.justTouched()) {
			<code id="variabile">verde</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">rosso</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">giallo</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">nero</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">bianco</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">arancione</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">cyan</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">sal</code>=<code id="parolaChiave">true</code>;
			<code id="variabile">chartreuse</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">magenta</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">firebrik</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">tan</code>=<code id="parolaChiave">false</code>;
		}
	}
	<code id="parolaChiave">if</code> (<code id="variabile">sal</code>){
		<code id="variabile">cornices</code>.setColor(Color.<var>CYAN</var>);
		<code id="variabile">cornices</code>.setPosition(800/2-75+204-2, 480/2+100-102-2);
		<code id="variabile">cornices</code>.draw(<code id="variabile">batch</code>);
	}
	<code id="variabile">serpente</code>.setColor(Color.<var>SALMON</var>);
	<code id="variabile">serpente</code>.setPosition(800/2-75+204, 480/2+100-102);
	<code id="variabile">serpente</code>.draw(<code id="variabile">batch</code>);
	<code id="parolaChiave">if</code> (<code id="variabile">vet</code>.x>=800/2-75-102 &amp;&amp; <code id="variabile">vet</code>.x&lt;=800/2-75-102+50 &amp;&amp; <code id="variabile">vet</code>.y>= 480/2+100-204 &amp;&amp; <code id="variabile">vet</code>.y&lt;=480/2+100-204+50){
		<code id="variabile">cornices</code>.setColor(Color.<var>YELLOW</var>);
		<code id="variabile">cornices</code>.setPosition(800/2-75-102-2, 480/2+100-204-2);
		<code id="variabile">cornices</code>.draw(<code id="variabile">batch</code>);
		<code id="parolaChiave">if</code> (Gdx.<var>input</var>.justTouched()) {
			<code id="variabile">verde</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">rosso</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">giallo</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">nero</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">bianco</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">arancione</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">cyan</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">sal</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">chartreuse</code>=<code id="parolaChiave">true</code>;
			<code id="variabile">magenta</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">firebrik</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">tan</code>=<code id="parolaChiave">false</code>;
		}
	}
	<code id="parolaChiave">if</code> (<code id="variabile">chartreuse</code>){
		<code id="variabile">cornices</code>.setColor(Color.<var>YELLOW</var>);
		<code id="variabile">cornices</code>.setPosition(800/2-75-102-2, 480/2+100-204-2);
		<code id="variabile">cornices</code>.draw(<code id="variabile">batch</code>);
	}
	<code id="variabile">serpente</code>.setColor(Color.<var>CHARTREUSE</var>);
	<code id="variabile">serpente</code>.setPosition(800/2-75-102, 480/2+100-204);
	<code id="variabile">serpente</code>.draw(<code id="variabile">batch</code>);
	<code id="parolaChiave">if</code> (<code id="variabile">vet</code>.x>=800/2-75 &amp;&amp; <code id="variabile">vet</code>.x&lt;=800/2-75+50 &amp;&amp; <code id="variabile">vet</code>.y>= 480/2+100-204 &amp;&amp; <code id="variabile">vet</code>.y&lt;=480/2+100-204+50){
		<code id="variabile">cornices</code>.setColor(Color.<var>FIREBRICK</var>);
		<code id="variabile">cornices</code>.setPosition(800/2-75-2, 480/2+100-204-2);
		<code id="variabile">cornices</code>.draw(<code id="variabile">batch</code>);
		<code id="parolaChiave">if</code> (Gdx.<var>input</var>.justTouched()) {
			<code id="variabile">verde</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">rosso</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">giallo</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">nero</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">bianco</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">arancione</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">cyan</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">sal</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">chartreuse</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">magenta</code>=<code id="parolaChiave">true</code>;
			<code id="variabile">firebrik</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">tan</code>=<code id="parolaChiave">false</code>;
		}
	}
	<code id="parolaChiave">if</code> (<code id="variabile">magenta</code>){
		<code id="variabile">cornices</code>.setColor(Color.<var>FIREBRICK</var>);
		<code id="variabile">cornices</code>.setPosition(800/2-75-2, 480/2+100-204-2);
		<code id="variabile">cornices</code>.draw(<code id="variabile">batch</code>);
	}
	<code id="variabile">serpente</code>.setColor(Color.<var>MAGENTA</var>);
	<code id="variabile">serpente</code>.setPosition(800/2-75, 480/2+100-204);
	<code id="variabile">serpente</code>.draw(<code id="variabile">batch</code>);
	<code id="parolaChiave">if</code> (<code id="variabile">vet</code>.x>=800/2-75+102 &amp;&amp; <code id="variabile">vet</code>.x&lt;=800/2-75+102+50 &amp;&amp; <code id="variabile">vet</code>.y>= 480/2+100-204 &amp;&amp; <code id="variabile">vet</code>.y&lt;=480/2+100-204+50){
		<code id="variabile">cornices</code>.setColor(Color.<var>ORANGE</var>);
		<code id="variabile">cornices</code>.setPosition(800/2-75+102-2, 480/2+100-204-2);
		<code id="variabile">cornices</code>.draw(<code id="variabile">batch</code>);
		<code id="parolaChiave">if</code> (Gdx.<var>input</var>.justTouched()) {
			<code id="variabile">verde</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">rosso</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">giallo</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">nero</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">bianco</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">arancione</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">cyan</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">sal</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">chartreuse</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">magenta</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">firebrik</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">tan</code>=<code id="parolaChiave">true</code>;
		}
	}
	<code id="parolaChiave">if</code> (<code id="variabile">tan</code>){
		<code id="variabile">cornices</code>.setColor(Color.<var>ORANGE</var>);
		<code id="variabile">cornices</code>.setPosition(800/2-75+102-2, 480/2+100-204-2);
		<code id="variabile">cornices</code>.draw(<code id="variabile">batch</code>);
	}
	<code id="variabile">serpente</code>.setColor(Color.<var>TAN</var>);
	<code id="variabile">serpente</code>.setPosition(800/2-75+102, 480/2+100-204);
	<code id="variabile">serpente</code>.draw(<code id="variabile">batch</code>);
	<code id="parolaChiave">if</code> (<code id="variabile">vet</code>.x>=800/2-75+204 &amp;&amp; <code id="variabile">vet</code>.x&lt;=800/2-75+204+50 &amp;&amp; <code id="variabile">vet</code>.y>= 480/2+100-204 &amp;&amp; <code id="variabile">vet</code>.y&lt;=480/2+100-204+50){
		<code id="variabile">cornices</code>.setColor(Color.<var>MAGENTA</var>);
		<code id="variabile">cornices</code>.setPosition(800/2-75+204-2, 480/2+100-204-2);
		<code id="variabile">cornices</code>.draw(<code id="variabile">batch</code>);
		<code id="parolaChiave">if</code> (Gdx.<var>input</var>.justTouched()) {
			<code id="variabile">verde</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">rosso</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">giallo</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">nero</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">bianco</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">arancione</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">cyan</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">sal</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">chartreuse</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">magenta</code>=<code id="parolaChiave">false</code>;
			<code id="variabile">firebrik</code>=<code id="parolaChiave">true</code>;
			<code id="variabile">tan</code>=<code id="parolaChiave">false</code>;
		}
	}
	<code id="parolaChiave">if</code> (<code id="variabile">firebrik</code>){
		<code id="variabile">cornices</code>.setColor(Color.<var>MAGENTA</var>);
		<code id="variabile">cornices</code>.setPosition(800/2-75+204-2, 480/2+100-204-2);
		<code id="variabile">cornices</code>.draw(<code id="variabile">batch</code>);
	}
	<code id="variabile">serpente</code>.setColor(Color.<var>FIREBRICK</var>);
	<code id="variabile">serpente</code>.setPosition(800/2-75+204, 480/2+100-204);
	<code id="variabile">serpente</code>.draw(<code id="variabile">batch</code>);
	<code id="parolaChiave">if</code> (<code id="variabile">vet</code>.x>=<code id="variabile">plays</code>.getX() &amp;&amp; <code id="variabile">vet</code>.x&lt;=<code id="variabile">plays</code>.getX()+<code id="variabile">plays</code>.getWidth() &amp;&amp; <code id="variabile">vet</code>.y>=<code id="variabile">plays</code>.getY() &amp;&amp; <code id="variabile">vet</code>.y&lt;=<code id="variabile">plays</code>.getY()+<code id="variabile">plays</code>.getHeight()){
		<code id="variabile">plays</code>.setAlpha(0.5f);
		<code id="variabile">plays</code>.draw(<code id="variabile">batch</code>);
		<code id="parolaChiave">if</code> (Gdx.<var>input</var>.justTouched()){
			<code id="parolaChiave">if</code> (<code id="variabile">verde</code>==<code id="parolaChiave">false</code> &amp;&amp; <code id="variabile">rosso</code>==<code id="parolaChiave">false</code> &amp;&amp; <code id="variabile">giallo</code>==<code id="parolaChiave">false</code> &amp;&amp; <code id="variabile">nero</code>==<code id="parolaChiave">false</code> &amp;&amp; <code id="variabile">bianco</code>==<code id="parolaChiave">false</code> &amp;&amp; <code id="variabile">arancione</code>==<code id="parolaChiave">false</code> &amp;&amp; <code id="variabile">cyan</code>==<code id="parolaChiave">false</code> &amp;&amp; <code id="variabile">sal</code>==<code id="parolaChiave">false</code> &amp;&amp; <code id="variabile">chartreuse</code>==<code id="parolaChiave">false</code> &amp;&amp; <code id="variabile">magenta</code>==<code id="parolaChiave">false</code> &amp;&amp; <code id="variabile">firebrik</code>==<code id="parolaChiave">false</code> &amp;&amp; <code id="variabile">tan</code>==<code id="parolaChiave">false</code>)
				<code id="variabile">alpha</code>=1;
			<code id="parolaChiave">else</code>
				<code id="variabile">cambiaschermo</code>=<code id="parolaChiave">true</code>;
		}
	}
	<code id="parolaChiave">else</code> {
		<code id="variabile">plays</code>.setAlpha(1);
		<code id="variabile">plays</code>.draw(<code id="variabile">batch</code>);
	}
	<code id="variabile">alpha</code>-=0.02;
	<code id="parolaChiave">if</code> (<code id="variabile">alpha</code>&lt;0)
		<code id="variabile">alpha</code> =0;
	<code id="variabile">mexs</code>.setAlpha(<code id="variabile">alpha</code>);
	<code id="variabile">mexs</code>.draw(<code id="variabile">batch</code>);
	<code id="variabile">batch</code>.end();
} 
<code id="parolaChiave">else</code>
	((Game) Gdx.<var>app</var>.getApplicationListener()).setScreen(<code id="parolaChiave">new</code> Snake());
</pre>
<p class="lead">
Ho caricato nel gioco un'immagine bianca di dimensioni 50X50, 
dopodichè ho disegnato la stessa immagine 12 volte in posizioni diverse utilizzando la funzione setPosition 
(ho seguito una mia logica per il posizionamento , tu puoi posizionarle come meglio credi ) 
e ad ogni immagine ho dato un colore diverso utilizzando la funzione setColor . 
Ho creato un'immagine bianca di dimensioni 54X54 che ha la funzione di cornice e che appare 
nel caso in cui il puntatore del mouse ( o il dito nei dispositivi touch screen ) 
si trovi all'interno dell'immagine del colore . Se premi il tasto sinistro del mouse all'interno dell'immagine 
( o il dito in caso di cellulare android o iphone ) verrà selezionato quel colore e se premi il pulsante in basso 
a destra verrà impostata come schermata attiva la classe snake ( la classe del gioco vero e proprio) , 
se invece non selezioni nulla visualizzerai a schermo il messaggio 
<b><i>"seleziona un colore !!!"</i></b>.
<br>
Ora apri il file <b>snake.java</b> e, nel metodo <code id=sfondoColorato>show()</code> , sotto il codice 
<code id=sfondoColorato><code id=variabile>Snake</code>.setPosition(800/2-<code id=variabile>immagine</code>.getWidth()/2,480/2-<code id=variabile>immagine</code>.getHeight()/2);</code> , 
scrivi:
</p>
<pre>
<code id="parolaChiave">if</code> (<code id="variabile">schermo_colore</code>.verde)
	<code id="variabile">Snake</code>.setColor(Color.<var>GREEN</var>);
<code id="parolaChiave">else</code> <code id="parolaChiave">if</code> (<code id="variabile">schermo_colore</code>.<var>rosso</var>)
	<code id="variabile">Snake</code>.setColor(Color.<var>RED</var>);
<code id="parolaChiave">else</code> <code id="parolaChiave">if</code> (<code id="variabile">schermo_colore</code>.<var>bianco</var>)
	<code id="variabile">Snake</code>.setColor(Color.<var>WHITE</var>);
<code id="parolaChiave">else</code> <code id="parolaChiave">if</code> (<code id="variabile">schermo_colore</code>.<var>nero</var>)
	<code id="variabile">Snake</code>.setColor(Color.<var>BLACK</var>);
<code id="parolaChiave">else</code> <code id="parolaChiave">if</code> (<code id="variabile">schermo_colore</code>.<var>chartreuse</var>)
	<code id="variabile">Snake</code>.setColor(Color.<var>CHARTREUSE</var>);
<code id="parolaChiave">else</code> <code id="parolaChiave">if</code> (<code id="variabile">schermo_colore</code>.<var>cyan</var>)
	<code id="variabile">Snake</code>.setColor(Color.<var>CYAN</var>);
<code id="parolaChiave">else</code> <code id="parolaChiave">if</code> (<code id="variabile">schermo_colore</code>.<var>firebrik</var>)
	<code id="variabile">Snake</code>.setColor(Color.<var>FIREBRICK</var>);
<code id="parolaChiave">else</code> <code id="parolaChiave">if</code> (<code id="variabile">schermo_colore</code>.<var>giallo</var>)
	<code id="variabile">Snake</code>.setColor(Color.<var>YELLOW</var>);
<code id="parolaChiave">else</code> <code id="parolaChiave">if</code> (<code id="variabile">schermo_colore</code>.<var>magenta</var>)
	<code id="variabile">Snake</code>.setColor(Color.<var>MAGENTA</var>);
<code id="parolaChiave">else</code> <code id="parolaChiave">if</code> (<code id="variabile">schermo_colore</code>.<var>sal</var>)
	<code id="variabile">Snake</code>.setColor(Color.<var>SALMON</var>);
<code id="parolaChiave">else</code> <code id="parolaChiave">if</code> (<code id="variabile">schermo_colore</code>.<var>tan</var>)
	<code id="variabile">Snake</code>.setColor(Color.<var>TAN</var>);
<code id="parolaChiave">else</code> <code id="parolaChiave">if</code> (<code id="variabile">schermo_colore</code>.<var>arancione</var>)
	<code id="variabile">Snake</code>.setColor(Color.<var>ORANGE</var>);
</pre>
<p class="lead">
Ovviamente devi sostituire l'immagine del 
quadratino verde di dimensioni 10X10 pixels 
rappresentante il serpente con un'immagine 
identica (delle stesse dimensioni) ma bianca, 
per poter colorare il serpente utilizzando 
la funzione <code id=sfondoColorato>setColor</code> .
</p>
<br>
<p class="lead">
Video completo:
</p>
<br>
<div class="contenitore">
	<iframe class="responsive-iframe" src="https://www.youtube.com/embed/SuLW2lOPNZ0" allowfullscreen></iframe>
</div>
<br><br>
<p class="lead">
La guida termina qui !
Se ti va puoi giocare al videogioco Dooddle Jump che ho creato per l'esame di web computing.
Per giocare <a href="dist/index.html" target="_blank">clicca qui !</a>
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
