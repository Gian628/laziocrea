// ============================================================
// PROFILO: LcCup-Appointment (Prenotazione CUP Lazio)
// ============================================================

Profile: LcCupAppointment
Id: lccup-appointment
Title: "LcCup Appointment - Prenotazione CUP Lazio"
Description: """
  Profilo Lazio Crea per la prenotazione ambulatoriale nel CUP regionale.
  Pensato per l'integrazione con la Telemedicina nazionale IRT: quando la
  modalità è TELECONSULTO, la prenotazione viene inviata a IRT con il link
  alla sessione video.

  Relazioni:
  - basedOn → LcCupServiceRequest (impegnativa SSN)
  - slot    → LcCupSlot (fascia oraria prenotata)
  - participant → Patient, Practitioner, Location
"""
Parent: Appointment
* ^status = #draft
* ^experimental = true

* identifier MS
* identifier ^short = "Identificatore interno CUP Lazio"

* status 1..1 MS
* status ^short = "Stato: proposed | booked | cancelled | fulfilled | noshow"

* serviceType 1..* MS
* serviceType ^short = "Tipo di prestazione prenotata"

* specialty MS
* specialty ^short = "Specialità medica"

* appointmentType MS
* appointmentType ^short = "Tipo di accesso"

* basedOn MS
* basedOn only Reference(LcCupServiceRequest)
* basedOn ^short = "Impegnativa SSN (obbligatoria in regime SSN)"

* slot 1..* MS
* slot only Reference(LcCupSlot)
* slot ^short = "Slot prenotato nell'agenda CUP Lazio"

* start 1..1 MS
* start ^short = "Data e ora inizio appuntamento"
* end MS
* end ^short = "Data e ora fine prevista"

* minutesDuration MS
* minutesDuration ^short = "Durata prevista in minuti"

* created MS
* created ^short = "Data e ora della prenotazione"

* comment MS
* comment ^short = "Note aggiuntive"

* patientInstruction MS
* patientInstruction ^short = "Istruzioni per il paziente"

* participant ^slicing.discriminator.type = #type
* participant ^slicing.discriminator.path = "actor"
* participant ^slicing.rules = #open
* participant ^short = "Partecipanti all'appuntamento"

* participant contains
    paziente    1..1 MS and
    professionista 0..1 MS and
    sede        1..1 MS

* participant[paziente].actor only Reference(Patient)
* participant[paziente].actor 1..1 MS
* participant[paziente].status MS
* participant[paziente] ^short = "Assistito"

* participant[professionista].actor only Reference(Practitioner or PractitionerRole)
* participant[professionista].actor 1..1 MS
* participant[professionista].status MS
* participant[professionista] ^short = "Professionista erogante"

* participant[sede].actor only Reference(Location)
* participant[sede].actor 1..1 MS
* participant[sede].status MS
* participant[sede] ^short = "Sede fisica o virtuale (IRT)"

* extension contains ExtCodicePrenotazione named codicePrenotazione 1..1 MS
* extension[codicePrenotazione] ^short = "Codice prenotazione CUP consegnato all'utente"

* extension contains ExtCanalePrenotazione named canalePrenotazione 1..1 MS
* extension[canalePrenotazione] ^short = "Canale di prenotazione"

* extension contains ExtClassePrioritaCup named classePrioritaCup 0..1 MS
* extension[classePrioritaCup] ^short = "Classe priorità U/B/D/P"

* extension contains ExtModalitaErogazione named modalitaErogazione 1..1 MS
* extension[modalitaErogazione] ^short = "In presenza, teleconsulto o telemonitoraggio"

* extension contains ExtLinkTeleconsulto named linkTeleconsulto 0..1 MS
* extension[linkTeleconsulto] ^short = "URL sessione IRT (se teleconsulto)"
