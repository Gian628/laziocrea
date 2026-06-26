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
        <br />
        Usare la casella di ricerca sottostante per filtrare le informazioni desiderate.
      </p>
      <input id="myInput" type="text" placeholder="Cerca.." />
    </div>
    <br />
    <table style="width: fit-content">
      <thead>
        <tr>
          <th>Nome e Link Simplifier</th>
          <th>Descrizione</th>
          <th>URL</th>
        </tr>
      </thead>
      <tbody id="myTable">
        <tr>
          <td>{{link:https://www.fhir.laziocrea.it/ValueSet/lccup-vs-tipo-agenda}}</td>
          <td>Tipo agenda CUP (SSN, ALPI, Privata, Convenzionata)</td>
          <td>https://www.fhir.laziocrea.it/ValueSet/lccup-vs-tipo-agenda</td>
        </tr>
        <tr>
          <td>{{link:https://www.fhir.laziocrea.it/ValueSet/lccup-vs-canale-prenotazione}}</td>
          <td>Canale di prenotazione CUP</td>
          <td>https://www.fhir.laziocrea.it/ValueSet/lccup-vs-canale-prenotazione</td>
        </tr>
        <tr>
          <td>{{link:https://www.fhir.laziocrea.it/ValueSet/lccup-vs-classe-priorita}}</td>
          <td>Classe di priorità U/B/D/P</td>
          <td>https://www.fhir.laziocrea.it/ValueSet/lccup-vs-classe-priorita</td>
        </tr>
        <tr>
          <td>{{link:https://www.fhir.laziocrea.it/ValueSet/lccup-vs-stato-slot}}</td>
          <td>Stati dello slot CUP</td>
          <td>https://www.fhir.laziocrea.it/ValueSet/lccup-vs-stato-slot</td>
        </tr>
        <tr>
          <td>{{link:https://www.fhir.laziocrea.it/ValueSet/lccup-vs-modalita-erogazione}}</td>
          <td>Modalità di erogazione (presenza, teleconsulto, telemonitoraggio)</td>
          <td>https://www.fhir.laziocrea.it/ValueSet/lccup-vs-modalita-erogazione</td>
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

{{render:LazioCrea/lccup-vs-tipo-agenda}}

## Canale di Prenotazione

{{render:LazioCrea/lccup-vs-canale-prenotazione}}
