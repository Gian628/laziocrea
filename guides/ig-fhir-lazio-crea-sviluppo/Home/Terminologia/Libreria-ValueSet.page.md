<html>
  <head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
      $(document).ready(function () {
        $("#myInput").on("keyup", function () {
          var value = $(this).val().toLowerCase();
          $("#myTable tr").filter(function () {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
          });
        });
      });
    </script>
  </head>
  <body>
    <h1>Raccolta ValueSet LcCup</h1>
    <div>
      <p>
        Nella tabella sottostante sono raccolti i ValueSet sviluppati per i profili LcCup.
        I link aprono la risorsa su <a href="https://simplifier.net/LazioCrea">Simplifier</a>.
        La colonna URL canonica è l'identificatore FHIR (per API e validazione).
        <br />
        Usare la casella di ricerca sottostante per filtrare le informazioni desiderate.
      </p>
      <input id="myInput" type="text" placeholder="Cerca.." />
    </div>
    <br />
    <table style="width: fit-content">
      <thead>
        <tr>
          <th>Nome e link Simplifier</th>
          <th>Descrizione</th>
          <th>URL canonica</th>
        </tr>
      </thead>
      <tbody id="myTable">
        <tr>
          <td>{{link:LazioCrea/vs-tipo-agenda}}</td>
          <td>Tipo agenda CUP (SSN, ALPI, Privata, Convenzionata)</td>
          <td><code>https://www.fhir.laziocrea.it/ValueSet/vs-tipo-agenda</code></td>
        </tr>
        <tr>
          <td>{{link:LazioCrea/vs-canale-prenotazione}}</td>
          <td>Canale di prenotazione CUP</td>
          <td><code>https://www.fhir.laziocrea.it/ValueSet/vs-canale-prenotazione</code></td>
        </tr>
        <tr>
          <td>{{link:LazioCrea/vs-classe-priorita}}</td>
          <td>Classe di priorità U/B/D/P</td>
          <td><code>https://www.fhir.laziocrea.it/ValueSet/vs-classe-priorita</code></td>
        </tr>
        <tr>
          <td>{{link:LazioCrea/vs-stato-slot}}</td>
          <td>Stati dello slot CUP</td>
          <td><code>https://www.fhir.laziocrea.it/ValueSet/vs-stato-slot</code></td>
        </tr>
        <tr>
          <td>{{link:LazioCrea/vs-modalita-erogazione}}</td>
          <td>Modalità di erogazione (presenza, teleconsulto, telemonitoraggio)</td>
          <td><code>https://www.fhir.laziocrea.it/ValueSet/vs-modalita-erogazione</code></td>
        </tr>
        <tr>
          <td>{{link:LazioCrea/vs-tipo-identificatore}}</td>
          <td>Tipo identificatore agenda</td>
          <td><code>https://www.fhir.laziocrea.it/ValueSet/vs-tipo-identificatore</code></td>
        </tr>
        <tr>
          <td>{{link:LazioCrea/vs-tipo-servizio}}</td>
          <td>Tipo HealthcareService (piattaforma / prestazione)</td>
          <td><code>https://www.fhir.laziocrea.it/ValueSet/vs-tipo-servizio</code></td>
        </tr>
        <tr>
          <td>{{link:LazioCrea/vs-canale-virtuale}}</td>
          <td>Canale servizio virtuale (videochiamata)</td>
          <td><code>https://www.fhir.laziocrea.it/ValueSet/vs-canale-virtuale</code></td>
        </tr>
        <tr>
          <td>{{link:LazioCrea/vs-event-status}}</td>
          <td>Stato workflow evento IRT</td>
          <td><code>https://www.fhir.laziocrea.it/ValueSet/vs-event-status</code></td>
        </tr>
        <tr>
          <td>{{link:LazioCrea/vs-ruolo-equipe}}</td>
          <td>Ruolo membro CareTeam</td>
          <td><code>https://www.fhir.laziocrea.it/ValueSet/vs-ruolo-equipe</code></td>
        </tr>
      </tbody>
    </table>
  </body>
</html>

## CodeSystem (FQL)

<fql>
from CodeSystem
select name, title, description, url
order by name
</fql>

## Classe di Priorità CUP

| Codice | Nome | Tempo massimo di attesa |
|---|---|---|
| **U** | Urgente | 72 ore |
| **B** | Breve | 10 giorni |
| **D** | Differibile | 30 gg (visite) / 60 gg (accertamenti) |
| **P** | Programmabile | 120 giorni |

## Tipo Agenda

{{render:LazioCrea/vs-tipo-agenda}}

## Canale di Prenotazione

{{render:LazioCrea/vs-canale-prenotazione}}
