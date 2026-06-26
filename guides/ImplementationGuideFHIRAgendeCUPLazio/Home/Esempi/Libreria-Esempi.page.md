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
    <h1>Raccolta esempi LcCup</h1>
    <div>
      <p>
        Nella tabella sottostante sono raccolti tutti gli esempi creati per il progetto LcCup.
        <br />
        Usare la casella di ricerca sottostante per filtrare le informazioni desiderate.
      </p>
      <input id="myInput" type="text" placeholder="Cerca.." />
    </div>
    <br/>
    <table style="width: fit-content">
      <thead>
        <tr>
          <th>Tag</th>
          <th>ResourceType</th>
          <th>Descrizione</th>
          <th>Link Simplifier</th>
        </tr>
      </thead>
      <tbody id="myTable">
        <tr>
          <td>LCCUP</td>
          <td>Schedule</td>
          <td>Agenda cardiologia in presenza</td>
          <td>{{link:LazioCrea/esempio-agenda-cardiologia}}</td>
        </tr>
        <tr>
          <td>LCCUP</td>
          <td>Schedule</td>
          <td>Agenda teleconsulto IRT</td>
          <td>{{link:LazioCrea/esempio-agenda-teleconsulto}}</td>
        </tr>
        <tr>
          <td>LCCUP</td>
          <td>Slot</td>
          <td>Slot libero</td>
          <td>{{link:LazioCrea/esempio-slot-libero}}</td>
        </tr>
        <tr>
          <td>LCCUP</td>
          <td>Slot</td>
          <td>Slot teleconsulto</td>
          <td>{{link:LazioCrea/esempio-slot-teleconsulto}}</td>
        </tr>
        <tr>
          <td>LCCUP</td>
          <td>Appointment</td>
          <td>Prenotazione visita in presenza</td>
          <td>{{link:LazioCrea/esempio-prenotazione-visita}}</td>
        </tr>
        <tr>
          <td>LCCUP</td>
          <td>Appointment</td>
          <td>Prenotazione teleconsulto IRT</td>
          <td>{{link:LazioCrea/esempio-prenotazione-teleconsulto}}</td>
        </tr>
        <tr>
          <td>LCCUP</td>
          <td>ServiceRequest</td>
          <td>Impegnativa SSN</td>
          <td>{{link:LazioCrea/esempio-impegnativa-ssn}}</td>
        </tr>
        <tr>
          <td>LCCUP</td>
          <td>Location</td>
          <td>Sede virtuale teleconsulto</td>
          <td>{{link:LazioCrea/sede-virtuale-teleconsulto}}</td>
        </tr>
      </tbody>
    </table>
  </body>
</html>
