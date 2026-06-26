// ============================================================
// PROFILO: LcCup-Slot (Fascia oraria CUP Lazio)
// ============================================================

Profile: LcCupSlot
Id: lccup-slot
Title: "LcCup Slot - Fascia Oraria CUP Lazio"
Description: """
  Profilo Lazio Crea per la risorsa Slot nel CUP regionale.
  Rappresenta una singola fascia oraria all'interno di un'agenda Lazio.

  Stati: free | busy | busy-unavailable | busy-tentative

  Relazioni:
  - appartiene a LcCupSchedule (agenda)
  - referenziato da LcCupAppointment (prenotazione)
"""
Parent: Slot
* ^status = #draft
* ^experimental = true

* schedule 1..1 MS
* schedule only Reference(LcCupSchedule)
* schedule ^short = "Agenda CUP Lazio a cui appartiene questo slot"

* status 1..1 MS
* status ^short = "Stato dello slot"

* serviceType MS
* serviceType ^short = "Tipo prestazione (sovrascrive quello dell'agenda se diverso)"

* start 1..1 MS
* start ^short = "Inizio fascia oraria"
* end 1..1 MS
* end ^short = "Fine fascia oraria"

* comment MS
* comment ^short = "Note sullo slot"

* overbooked MS
* overbooked ^short = "true se lo slot è sovraprenotato"
