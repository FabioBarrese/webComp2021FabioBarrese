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
      <a class="navbar-brand" href="index.html" target="_blank">Pensiero Tecnologico</a>
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
        <h1 class="mt-4">libGDX - come creare un gioco in java per pc android iOS e html</h1>

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
        <p class="lead">Circa un anno fa ho iniziato a provare l’impulso irrefrenabile di creare giochi Cross Platform ( Ios , Android , Desktop , Html5) , ma inizialmente cercando su google persi fiducia in quanto per realizzare il mio sogno avrei dovuto imparare diversi linguaggi di programmazione dipendenti dalla piattaforma di appartenenza, mentre quello che stavo cercando era qualcosa che mi permettesse di creare un gioco funzionante su diversi sistemi operativi e diversi dispositivi e ,perché no , anche sul web , utilizzando lo stesso codice sorgente così da dimezzare se non di più il lavoro . Dopo tante ricerche alla fine ho trovato un framework eccezionale scritto in java per lo sviluppo di applicazioni cross Platform , sto parlando di LibGdx. 
Vuoi iniziare anche tu a creare il tuo primo gioco ? non devi fare altro che seguire questa guida :) . 
<br>Ovviamente devi avere una conoscenza di base del linguaggio di programmazione java e dell’utilizzo degli IDE (es. eclipse), poichè in quest’articolo spiegherò come iniziare a utilizzare LibGDX , mentre nei prossimi spiegherò la funzione delle classi principali , e magari in futuro farò un tutorial dettagliato sulla creazione di un gioco , perciò per capirci qualcosa devi conoscere java (almeno le basi) in quanto LibGDX usa tale linguaggio . 
<br>Per essere più chiaro , per imparare a programmare con LibGdx devi : <br>
<br>- Avere già una conoscenza base del linguaggio java . 
<br>- In realtà se segui i miei articoli basta solo il punto 1 , mentre se decidi di documentarti per conto tuo , devi avere una conoscenza base della lingua inglese , infatti nel web la documentazione in italiano riguardante questo framework è pressoché nulla , io personalmente tutto quello che so l’ho appreso dalla documentazione ufficiale di LibGDX scritta interamente in lingua inglese . <br>Se hai quindi intenzione di creare il tuo gioco cross platform e non ti spaventa java questo framework è quel che fa per te e nei miei post ti spiegherò come utilizzarlo :) .
<br> Ma entriamo nel dettaglio (io utilizzo eclipse come IDE perciò spiego come fare con quest’ultimo , ma se ne utilizzi un altro le operazioni da eseguire sono le stesse): <br>
<br>- Crea una nuova cartella (sarà il tuo workspace ) 
<br>- Apri Eclipse e seleziona la cartella da te precedentemente creata cliccando il pulsante Browse , poi premi ok per entrare in eclipse e riduci a icona . 
<br>- Crea una cartella vuota sul Desktop (o dove più ti aggrada) e dalle il nome gioco (per esempio ma puoi rinominarla come vuoi). 
<br>- collegati alla pagina ufficiale di libGDX e fai partire il download del jar cliccando su Download Setup App .</p>

		<p class="lead">- aprilo e seleziona le piattaforme di destinazione ( se scegli android è necessario selezionare la cartella di destinazione dell’android sdk , e quindi bisogna prima scaricarlo da internet , se scegli Ios ti ricordo che devi essere in possesso di un computer Mac per poter testare sul cellulare e devi avere un ‘account sviluppatore attivo per pubblicare la tua app sull’ AppStore , per quanto riguarda Desktop , Html5 e Android non ci sono restrizioni) , per adesso mi limiterò a spiegare come si creano applicazioni Desktop (per computer ) ma essendo il codice lo stesso se vorrai per esempio creare la tua app dovrai apportare pochissime modifiche (per lo più legate alla risoluzione dello schermo che cambia da dispositivo a dispositivo ) , perciò deseleziona tutto eccetto Desktop.</p>
        
        <p class="lead">- in basso ci sono le estensioni da utilizzare , adesso ti spiego a grandi linee a cosa servono : <br>
<br>1) Bullet ti permette di applicare la fisica al tuo gioco 3D . 
<br>2) Freetype ti permette di aggiungere file di tipo ttf che permettono alle scritte presenti nel tuo gioco di utilizzare la formattazione del carattere di tale file . 
<br>3) Tools ti permette di utilizzare i tools realizzati appositamente per LibGdx quali TexturePacker, 2DParticleEditor,3DParticleEditor, Hiero , physics-body-editor ( in realtà io non utilizzo mai quest’estensione poiché li ho scaricati separatamente ) . 
<br>4) Controllers permette di gestire da codice e quindi di poter utilizzare nel proprio gioco gamepads e joysticks . 
<br>5) Box2d permette l’implementazione della fisica nei giochi 2d , farò un articolo apposito in futuro per parlare di questa fantastica estensione . 
<br>6) Box2dlights permette l’implementazione delle luci nel gioco. 
<br>7) Ashley è un’entity system ( non chiedermi cosa significa perché non lo so , so solo che facilita l’architettura e la realizzazione del gioco , ma non avendola mai utilizzata ed essendo poco chiara la documentazione di questa estensione , non posso dirti di più ). 
<br>8) Ai permette l’utilizzo dell’intelligenza artificiale nel proprio gioco , gli inglesi direbbero cool !!! 
<br>In futuro spiegherò come utilizzare a grandi linee 2 o 3 di queste estensioni e dedicherò un articolo più dettagliato a Box2d che io reputo una delle migliori estensioni di LibGDX, ma per ora non selezionare nessuna delle estensioni e deseleziona quelle già selezionate , clicca sul pulsante Browse (quello in rosso nella foto che ho postato) e scegli come destinazione la cartella che hai precedentemente creato (quella che ti ho detto di rinominare gioco) , infine premi Generate . Attendi finché il processo non sarà completato ; a questo punto segui le istruzioni per importarlo nel tuo IDE ( in eclipse devi premere file , import , Gradle , Gradle project , vai avanti finché non ti viene richiesto di selezionare la cartella di destinazione che sarà la cartella gioco nel tuo caso , sempre che tu l’abbia chiamata così :) , a questo punto dopo aver premuto avanti dovrai attendere che il progetto venga importato e poi clicca finish).</p>
      
        
        <p class="lead">Se hai fatto tutto quello che ho detto alla lettera sulla sinistra dovrebbero esserci tre cartelle , esaminiamole insieme . 
La cartella gioco (se l’hai chiamata così ) è la cartella che contiene tutto il progetto e che non utilizzeremo mai durante lo sviluppo del nostro gioco , quindi andiamo avanti. 
La cartella my-gdx-game-desktop contiene la classe principale da cui verrà “lanciata” o avviata la nostra applicazione che si chiama appunto DesktopLauncher , e che , in questo caso , andremo a modificare da codice per lo più per cambiare la grandezza della finestra, per aggiungere una frase sulla cornice della finestra , per impedire o meno il resize della finestra o per lanciare il nostro gioco in full screen (a schermo intero) . Ogni piattaforma ha questo tipo di classe e quindi la sua relativa cartella , perciò se avessi selezionato tutte le piattaforme ci sarebbero state 3 cartelle in più , ognuna contenente la classe di lancio dell’ applicazione in questione (IosLauncher, AndroidLauncher , HtmlLauncher) . 
Infine andiamo ad analizzare la cartella my-gdx-game-core che è la cartella principale e dove lavoreremo di più , infatti il codice del nostro gioco ( dalla cosa più semplice come inserire un’immagine , a quella più difficile come creare dei livelli complessi) verrà scritto qui e verrà condiviso da tutte le piattaforme da te selezionate , in questo caso solo quella Desktop. </p>

		<p class="lead">Adesso non resta che avviare il gioco , quindi entra nella cartella com-mygdx-game-desktop apri la sottocartella src e nel package com.mygdx.game.desktop clicca due volte su DesktopLauncher. Sulla destra apparirà il codice, premi il pulsante verde simile al pulsante play in alto oppure premi f11 per avviare il programma. Adesso non agitarti, so che ti dà errore , ho passato ore prima di trovare la soluzione su internet quando l’ho fatto per la prima volta , tu invece hai me u.u . Clicca con il tasto destro su DesktopLauncher (io presumo che tu stia usando eclipse ma per gli altri ide il problema viene risolto allo stesso modo ma magari seguendo percorsi differenti) , Run as , run configurations (si aprirà una finestra), clicca sulla seconda voce Arguments, poi dove c’è scritto Working directory clicca sul pallino accanto a Other , poi clicca su Workspace e scegli la cartella assets all’interno della cartella mygdx-game-core , premi ok , apply e infine run .</p>
        
        <p class="lead">Se tutto è andato per il verso giusto dovrebbe apparire una finestra che contiene uno sfondo rosso e l’immagine del logo di libGDX, sei entrato di diritto nella vasta community di sviluppatori che utilizzano LibGDX :) .</p>
        
        <p><a class="navbar-brand" href="articolo2.jsp">Link al prossimo articolo</a></p>
        
        <p class="lead">Nb : la cartella assets funge da contenitore di tutte le immagini , i file audio e gli effetti (esplosioni , fuoco , fumo ecc. ) che verranno utilizzati nel nostro gioco . 

           Alla prossima !!! :)</p>
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
