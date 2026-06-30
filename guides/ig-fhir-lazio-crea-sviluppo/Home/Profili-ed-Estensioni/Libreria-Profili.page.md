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
    <h1>Raccolta profili LcCup</h1>
    <div>
      <p>
        Nella tabella sottostante sono raccolti i profili LcCup per il CUP Regionale Lazio.
        <br />
        Usare la casella di ricerca sottostante per filtrare le informazioni desiderate.
      </p>
      <input id="myInput" type="text" placeholder="Cerca.." />
    </div>
    <br />
    <table style="width: fit-content">
      <thead>
        <tr>
          <th>Tag</th>
          <th>Nome profilo e pagina di dettaglio</th>
          <th>Risorsa base</th>
          <th>Descrizione</th>
          <th>Link Simplifier</th>
        </tr>
      </thead>
      <tbody id="myTable">
        <tr>
          <td>LCCUP</td>
          <td>
            {{pagelink:Home/Profili-ed-Estensioni/Raccolta-profili/LcCupSchedule.page.md}}
          </td>
          <td>
            <a href="http://hl7.org/fhir/R5/schedule.html">Schedule</a>
          </td>
          <td>Agenda CUP Lazio (in presenza o teleconsulto)</td>
          <td>
            {{link:https://www.fhir.laziocrea.it/StructureDefinition/lccup-schedule}}
          </td>
        </tr>
        <tr>
          <td>LCCUP</td>
          <td>
            {{pagelink:Home/Profili-ed-Estensioni/Raccolta-profili/LcCupSlot.page.md}}
          </td>
          <td>
            <a href="http://hl7.org/fhir/R5/slot.html">Slot</a>
          </td>
          <td>Fascia oraria prenotabile nell'agenda</td>
          <td>
            {{link:https://www.fhir.laziocrea.it/StructureDefinition/lccup-slot}}
          </td>
        </tr>
        <tr>
          <td>LCCUP</td>
          <td>
            {{pagelink:Home/Profili-ed-Estensioni/Raccolta-profili/LcCupAppointment.page.md}}
          </td>
          <td>
            <a href="http://hl7.org/fhir/R5/appointment.html">Appointment</a>
          </td>
          <td>Prenotazione CUP con estensioni e integrazione IRT</td>
          <td>
            {{link:https://www.fhir.laziocrea.it/StructureDefinition/lccup-appointment}}
          </td>
        </tr>
        <tr>
          <td>LCCUP</td>
          <td>
            {{pagelink:Home/Profili-ed-Estensioni/Raccolta-profili/LcCupServiceRequest.page.md}}
          </td>
          <td>
            <a href="http://hl7.org/fhir/R5/servicerequest.html">ServiceRequest</a>
          </td>
          <td>Impegnativa SSN con NRE e classe priorità</td>
          <td>
            {{link:https://www.fhir.laziocrea.it/StructureDefinition/lccup-service-request}}
          </td>
        </tr>
        <tr>
          <td>LCCUP</td>
          <td>LcCup-CareTeam</td>
          <td><a href="http://hl7.org/fhir/R5/careteam.html">CareTeam</a></td>
          <td>Equipe teleconsulto IRT</td>
          <td>{{link:https://www.fhir.laziocrea.it/StructureDefinition/lccup-care-team}}</td>
        </tr>
        <tr>
          <td>LCCUP</td>
          <td>LcCup-HealthcareService</td>
          <td><a href="http://hl7.org/fhir/R5/healthcareservice.html">HealthcareService</a></td>
          <td>Piattaforma o prestazione clinica</td>
          <td>{{link:https://www.fhir.laziocrea.it/StructureDefinition/lccup-healthcare-service}}</td>
        </tr>
        <tr>
          <td>LCCUP</td>
          <td>LcCup-Organization</td>
          <td><a href="http://hl7.org/fhir/R5/organization.html">Organization</a></td>
          <td>Struttura STS con flag IRT</td>
          <td>{{link:https://www.fhir.laziocrea.it/StructureDefinition/lccup-organization}}</td>
        </tr>
      </tbody>
    </table>
  </body>
</html>
