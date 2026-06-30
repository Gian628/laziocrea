# LcCupSchedule

- [LcCupSchedule](#lccupschedule)
  - [Descrizione](#descrizione)
  - [Profilo](#profilo)
  - [Esempi](#esempi)

## Descrizione

Il profilo **LcCup-Schedule** rappresenta un'agenda del **CUP Regionale Lazio**. Ogni agenda appartiene a un servizio/ambulatorio ed è il contenitore delle fasce orarie (Slot).

Di seguito il contenuto del profilo in diversi formati. Definizione: {{link:LazioCrea/lccup-schedule}}.

<br>
<div class="tab">
  <button class="tablinks active" onclick="openTab(event, 'Hybrid View')">Hybrid View</button>
  <button class="tablinks" onclick="openTab(event, 'Snapshot View')">Snapshot View</button>
  <button class="tablinks" onclick="openTab(event, 'Differential View')">Differential View</button>
  <button class="tablinks" onclick="openTab(event, 'Table View')">Table View</button>
  <button class="tablinks" onclick="openTab(event, 'XML View')">XML View</button>
  <button class="tablinks" onclick="openTab(event, 'JSON View')">JSON View</button>
  <button class="tablinks" onclick="openTab(event, 'Esempi')">Esempi applicati al profilo</button>
</div>

<div id="Snapshot View" class="tabcontent">
  <h3>Snapshot View</h3>
{{tree:LazioCrea/lccup-schedule, snapshot}}
</div>

<div id="Differential View" class="tabcontent">
  <h3>Differential View</h3>
{{tree:LazioCrea/lccup-schedule, diff}}
</div>

<div id="Hybrid View" class="tabcontent" style="display:block">
  <h3>Hybrid View</h3>
{{tree:LazioCrea/lccup-schedule, hybrid}}
</div>

<div id="Table View" class="tabcontent">
  <h3>Table View</h3>
{{table:LazioCrea/lccup-schedule, snapshot}}
</div>

<div id="XML View" class="tabcontent">
  <h3>XML View</h3>
{{xml:LazioCrea/lccup-schedule, snapshot}}
</div>

<div id="JSON View" class="tabcontent">
  <h3>JSON View</h3>
{{json:LazioCrea/lccup-schedule, snapshot}}
</div>

<div id="Esempi" class="tabcontent">
  <h3>Esempi</h3>
Agenda cardiologia: {{link:LazioCrea/esempio-agenda-cardiologia}}
<br>
Agenda teleconsulto: {{link:LazioCrea/esempio-agenda-teleconsulto}}
<br>
</div>

## Esempi

{{json:LazioCrea/esempio-agenda-cardiologia}}

{{json:LazioCrea/esempio-agenda-teleconsulto}}
