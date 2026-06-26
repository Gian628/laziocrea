// ============================================================
// PROFILO: IT-CUP-Appointment (Prenotazione)
// ============================================================
// Rappresenta la prenotazione effettiva di una prestazione
// ambulatoriale tramite il CUP. Collega:
//   - l'impegnativa (ServiceRequest via basedOn)
//   - lo slot prenotato (Slot via slot)
//   - i partecipanti: paziente, professionista, sede
//
// Ciclo di vita dell'Appointment nel CUP:
//   proposed  → quando la prenotazione è in corso
//   booked    → confermata
//   cancelled → disdetta dal paziente o dalla struttura
//   fulfilled → prestazione erogata (archiviazione)
//   noshow    → il paziente non si è presentato
// ============================================================

Profile: ITCUPAppointment
Id: it-cup-appointment
Title: "IT CUP Appointment - Prenotazione"
Description: """
  Profilo italiano per la risorsa Appointment nel contesto CUP.
  Rappresenta la prenotazione di una prestazione ambulatoriale.

  Relazioni:
  - basedOn → ITCUPServiceRequest (impegnativa SSN)
  - slot    → ITCUPSlot (fascia oraria prenotata)
  - participant → Patient (assistito), Practitioner (professionista),
                  Location (sede di erogazione)
  
  Estensioni italiane:
  - Codice prenotazione CUP (numero consegnato all'utente)
  - Canale di prenotazione (sportello, telefono, web...)
  - Classe di priorità CUP (U/B/D/P)
  - Modalità di erogazione (in presenza / teleconsulto)
  - Link teleconsulto (URL sessione video, se applicabile)
"""
Parent: Appointment
* ^status = #draft
* ^experimental = true

// --- Identificatore interno ---
* identifier MS
* identifier ^short = "Identificatore interno del sistema CUP"

// --- Stato (obbligatorio) ---
* status 1..1 MS
* status ^short = "Stato prenotazione: proposed | booked | cancelled | fulfilled | noshow"

// --- Tipo di servizio (obbligatorio) ---
* serviceType 1..* MS
* serviceType ^short = "Tipo di prestazione prenotata (codice nomenclatore)"

// --- Specialità ---
* specialty MS
* specialty ^short = "Specialità medica della prestazione"

// --- Tipo di appuntamento ---
* appointmentType MS
* appointmentType ^short = "Tipo di accesso: primo accesso, controllo, urgenza..."

// --- Impegnativa (obbligatoria per regime SSN) ---
* basedOn MS
* basedOn only Reference(ITCUPServiceRequest)
* basedOn ^short = "Impegnativa SSN su cui si basa la prenotazione"
* basedOn ^definition = """
  Riferimento alla ServiceRequest (impegnativa dematerializzata).
  Obbligatorio per prenotazioni in regime SSN.
  Può essere assente per prenotazioni in regime privato o ALPI
  senza impegnativa.
"""

// --- Slot prenotato (obbligatorio) ---
* slot 1..* MS
* slot only Reference(ITCUPSlot)
* slot ^short = "Slot (fascia oraria) prenotata nell'agenda CUP"

// --- Data/ora appuntamento ---
* start 1..1 MS
* start ^short = "Data e ora di inizio dell'appuntamento"
* end MS
* end ^short = "Data e ora di fine prevista"

// --- Durata ---
* minutesDuration MS
* minutesDuration ^short = "Durata prevista in minuti"

// --- Data prenotazione ---
* created MS
* created ^short = "Data e ora in cui è stata effettuata la prenotazione"

// --- Note ---
* comment MS
* comment ^short = "Note aggiuntive per il paziente o la struttura"

// --- Istruzioni pre-appuntamento ---
* patientInstruction MS
* patientInstruction ^short = "Istruzioni per il paziente (es. 'Presentarsi a digiuno')"

// -------------------------------------------------------
// PARTECIPANTI (obbligatori)
// -------------------------------------------------------

// Paziente: obbligatorio (1..1 slice)
* participant ^slicing.discriminator.type = #type
* participant ^slicing.discriminator.path = "actor"
* participant ^slicing.rules = #open
* participant ^short = "Partecipanti all'appuntamento"

* participant contains
    paziente    1..1 MS and
    professionista 0..1 MS and
    sede        1..1 MS

// Slice Paziente
* participant[paziente].actor only Reference(Patient)
* participant[paziente].actor 1..1 MS
* participant[paziente].status MS
* participant[paziente] ^short = "Assistito che deve effettuare la prestazione"

// Slice Professionista
* participant[professionista].actor only Reference(Practitioner or PractitionerRole)
* participant[professionista].actor 1..1 MS
* participant[professionista].status MS
* participant[professionista] ^short = "Professionista che eroga la prestazione"

// Slice Sede
* participant[sede].actor only Reference(Location)
* participant[sede].actor 1..1 MS
* participant[sede].status MS
* participant[sede] ^short = "Sede di erogazione (fisica o virtuale per teleconsulto)"

// -------------------------------------------------------
// ESTENSIONI ITALIANE
// -------------------------------------------------------

// Codice prenotazione CUP (obbligatorio)
* extension contains ExtCodicePrenotazione named codicePrenotazione 1..1 MS
* extension[codicePrenotazione] ^short = "Codice prenotazione CUP rilasciato all'utente"

// Canale di prenotazione
* extension contains ExtCanalePrenotazione named canalePrenotazione 1..1 MS
* extension[canalePrenotazione] ^short = "Come è stata effettuata la prenotazione"

// Classe di priorità CUP (U/B/D/P)
* extension contains ExtClassePrioritaCup named classePrioritaCup 0..1 MS
* extension[classePrioritaCup] ^short = "Classe di priorità: U (Urgente), B (Breve), D (Differibile), P (Programmabile)"

// Modalità di erogazione (obbligatoria)
* extension contains ExtModalitaErogazione named modalitaErogazione 1..1 MS
* extension[modalitaErogazione] ^short = "In presenza, teleconsulto o telemonitoraggio"

// Link sessione teleconsulto (obbligatorio se modalità = TELECONSULTO)
* extension contains ExtLinkTeleconsulto named linkTeleconsulto 0..1 MS
* extension[linkTeleconsulto] ^short = "URL della videochiamata sulla Telemedicina nazionale IRT"
