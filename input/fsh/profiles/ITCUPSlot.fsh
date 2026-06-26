// ============================================================
// PROFILO: IT-CUP-Slot (Fascia oraria)
// ============================================================
// Rappresenta una singola finestra temporale all'interno di un'agenda.
// Uno slot può essere libero (prenotabile), occupato (già prenotato)
// o bloccato (non disponibile per altri motivi).
//
// Nel contesto PNLA, lo Slot viene usato principalmente per
// tracciare gli slot OCCUPATI da prenotazioni, non l'intera
// disponibilità dell'agenda (che è delegata al sistema CUP locale).
// ============================================================

Profile: ITCUPSlot
Id: it-cup-slot
Title: "IT CUP Slot - Fascia Oraria"
Description: """
  Profilo italiano per la risorsa Slot nel contesto CUP.
  Rappresenta una singola fascia oraria all'interno di un'agenda.
  
  Stati possibili:
  - free: disponibile per la prenotazione
  - busy: occupato da un Appointment
  - busy-unavailable: non disponibile (es. ambulatorio chiuso, medico assente)
  - busy-tentative: prenotazione in corso di conferma

  Relazioni:
  - appartiene a uno Schedule (agenda)
  - può essere referenziato da zero o più Appointment
"""
Parent: Slot
* ^status = #draft
* ^experimental = true

// --- Agenda di riferimento (obbligatorio) ---
* schedule 1..1 MS
* schedule only Reference(ITCUPSchedule)
* schedule ^short = "Agenda CUP a cui appartiene questo slot"

// --- Stato (obbligatorio) ---
* status 1..1 MS
* status ^short = "Stato dello slot: free | busy | busy-unavailable | busy-tentative"

// --- Tipo di servizio ---
// Facoltativo: se presente, sovrascrive quello dell'agenda
* serviceType MS
* serviceType ^short = "Tipo prestazione (sovrascrive quello dell'agenda se diverso)"

// --- Datetime di inizio e fine (obbligatori) ---
* start 1..1 MS
* start ^short = "Inizio della fascia oraria (datetime)"
* end 1..1 MS
* end ^short = "Fine della fascia oraria (datetime)"

// --- Commento ---
* comment MS
* comment ^short = "Note sullo slot (es. motivo del blocco)"

// --- Overbooking: capacità massima ---
// FHIR R4 non ha un campo nativo per la capacità degli slot.
// In R5 esiste overbooked. Per R4 usiamo una extension standard.
// Per semplicità documentale, usiamo il commento o una extension
// custom se necessario in futuro.
* overbooked MS
* overbooked ^short = "true se lo slot è stato sovraprenotato oltre la capienza"
