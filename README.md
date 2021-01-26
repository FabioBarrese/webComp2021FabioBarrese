4 punti importanti:

1. Il database<br>
2. Il videogioco<br>
3. La navicella<br>
4. La documentazione<br>

1. Il database:<br><br>

Il database è accessibile da remoto perché l'ho caricato su amazon aws, ci si può connettere con mysql workbench (o con altro client mysql), i parametri della connessione sono:<br><br>

HOSTNAME : database-1.clvnyaziusxb.us-east-2.rds.amazonaws.com <br><br>
USERNAME : admin <br><br>
PASSWORD : webcomputing <br><br>
PORTA : 3306 <br><br>

ALL'interno del database è presente la relazione UTENTE, così riempieta: <br><br>

nome            password  <br><br>

'Fabio@1',    'webComp' <br>
'prova88@22', 'webComputingProva@22' <br>
'prova88@88', 'web88@88' <br>
'prova99@99', 'web99@99' <br>
'webComputing@1', 'test@551' <br>
'webComputing@10', 'test@560' <br>
'webComputing@11', 'test@561'<br>
'webComputing@12', 'test@562' <br>
'webComputing@13', 'test@563'<br>
'webComputing@14', 'test@564' <br>
'webComputing@15', 'test@565' <br>
'webComputing@16', 'test@566' <br>
'webComputing@17', 'test@567' <br>
'webComputing@18', 'test@568' <br>
'webComputing@19', 'test@569' <br>
'webComputing@2', 'test@552' <br>
'webComputing@20', 'test@570' <br>
'webComputing@3', 'test@553' <br>
'webComputing@4', 'test@554' <br>
'webComputing@5', 'test@555' <br>
'webComputing@6', 'test@556' <br>
'webComputing@7', 'test@557' <br>
'webComputing@8', 'test@558' <br>
'webComputing@9', 'test@559' <br>

(Bisogna considerare solo i valori all'interno degli apici) <br>

2. Il videogioco: <br>

La pagina del videogioco si trova all'interno della cartella dist che a sua volta è situata nella cartella webContent. <br>
La pagina del videogioco si chiama index.html (da non confondersi con la pagina principale index.html del sito) <br><br>

3. La navicella: <br><br>

Sulla mappa vengono visualizzati gli spostamenti in tempo reale della navicella e ci vuole un pò per vedere uno spostamento significativo (10-15 minuti).<br>
La longitudine e la latitudine della navicella sono fornite dal sito <a href='http://open-notify.org' target='_blank'>open-notify.org</a> <br><br>

4. La documentazione: <br><br>

Nella cartella webContent è presente la cartella documentazione al cui interno si trovano: <br>
	1. configurazioneAWS.txt -> parametri connessione database (guardare il punto 1) <br>
	2. relazioneSito.pptx (slide powerpoint in cui spiego sommariamente il funzionamento del sito) <br>
	3. relazioneSito.pdf -> versione pdf di relazioneSito.pptx <br>
	4. UMLclass.pdf -> diagramma delle classi presente nella prima pagina di relazioneSito.pptx <br>
