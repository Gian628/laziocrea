# LcCupSlot

- [LcCupSlot](#lccupslot)
  - [Descrizione](#descrizione)
  - [Profilo](#profilo)
  - [Esempi](#esempi)

## Descrizione

Il profilo **LcCup-Slot** rappresenta una singola finestra temporale all'interno di un'agenda CUP.

Definizione: {{link:LazioCrea/lccup-slot}}.

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
{{tree:LazioCrea/lccup-slot, snapshot}}
</div>

<div id="Differential View" class="tabcontent">
  <h3>Differential View</h3>
{{tree:LazioCrea/lccup-slot, diff}}
</div>

<div id="Hybrid View" class="tabcontent" style="display:block">
  <h3>Hybrid View</h3>
{{tree:LazioCrea/lccup-slot, hybrid}}
</div>

<div id="Table View" class="tabcontent">
  <h3>Table View</h3>
{{table:LazioCrea/lccup-slot, snapshot}}
</div>

<div id="XML View" class="tabcontent">
  <h3>XML View</h3>
{{xml:LazioCrea/lccup-slot, snapshot}}
</div>

<div id="JSON View" class="tabcontent">
  <h3>JSON View</h3>
{{json:LazioCrea/lccup-slot, snapshot}}
</div>

<div id="Esempi" class="tabcontent">
  <h3>Esempi</h3>
Slot libero: {{link:LazioCrea/esempio-slot-libero}}
<br>
Slot teleconsulto: {{link:LazioCrea/esempio-slot-teleconsulto}}
<br>
</div>

## Stati possibili

| Stato | Significato |
|---|---|
| `free` | Disponibile per la prenotazione |
| `busy` | Occupato da un Appointment |
| `busy-unavailable` | Bloccato |
| `busy-tentative` | Prenotazione in corso di conferma |

## Esempi

{{json:LazioCrea/esempio-slot-libero}}

{{json:LazioCrea/esempio-slot-teleconsulto}}
