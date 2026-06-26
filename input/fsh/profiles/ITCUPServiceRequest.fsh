// ============================================================
// PROFILO: IT-CUP-ServiceRequest (Impegnativa SSN)
// ============================================================
// Rappresenta la prescrizione/richiesta del medico (MMG o specialista)
// che autorizza l'accesso alla prestazione ambulatoriale tramite CUP.
// In Italia corrisponde all'impegnativa dematerializzata (ricetta rossa
// o dematerializzata tramite TS-CNS).
//
// ServiceRequest precede temporalmente l'Appointment:
// prima c'è la prescrizione, poi la prenotazione.
// ============================================================

Profile: ITCUPServiceRequest
Id: it-cup-service-request
Title: "IT CUP ServiceRequest - Impegnativa SSN"
Description: """
  Profilo italiano per la risorsa ServiceRequest nel contesto CUP.
  Rappresenta l'impegnativa dematerializzata o cartacea del medico
  prescrittore (MMG, PLS o specialista), necessaria per prenotare
  una prestazione ambulatoriale in regime SSN.

  Relazioni:
  - referenziata da Appointment.basedOn
  - emessa da Practitioner (MMG/PLS/Specialista)
  - destinata a Patient (Assistito)
  - il codice prestazione fa riferimento al Nomenclatore Nazionale
"""
Parent: ServiceRequest
* ^status = #draft
* ^experimental = true

// --- Identificatore impegnativa ---
* identifier MS
* identifier ^short = "NRE (Numero Ricetta Elettronica) o codice impegnativa"
* identifier ^definition = """
  L'NRE è il numero univoco assegnato all'impegnativa dematerializzata
  dal sistema TS (Tessera Sanitaria) del MEF. Per le ricette cartacee
  si usa il codice a barre.
"""

// --- Stato (obbligatorio) ---
* status 1..1 MS
* status ^short = "Stato: active | completed | cancelled | on-hold"

// --- Intent (obbligatorio, fisso a 'order') ---
* intent 1..1 MS
* intent = #order
* intent ^short = "Sempre 'order': è un ordine del medico"

// --- Codice prestazione (obbligatorio) ---
// Il codice deve riferirsi al Nomenclatore Nazionale o Regionale
* code 1..1 MS
* code ^short = "Codice prestazione (Nomenclatore Nazionale/Regionale)"
* code ^definition = """
  Codice della prestazione secondo il Nomenclatore Tariffario Nazionale
  (DM 18/10/2012 e aggiornamenti) o il nomenclatore regionale.
  Esempi:
  - 89.7  Visita medica generale
  - 88.74 Ecografia addome
  - 89.52 Elettrocardiogramma
"""

// --- Paziente (obbligatorio) ---
* subject 1..1 MS
* subject only Reference(Patient)
* subject ^short = "Assistito per cui è prescritta la prestazione"

// --- Medico prescrittore (obbligatorio) ---
* requester 1..1 MS
* requester only Reference(Practitioner or PractitionerRole)
* requester ^short = "MMG, PLS o specialista che ha emesso l'impegnativa"

// --- Priorità/Classe ---
// Utilizziamo anche l'estensione CUP per la classe U/B/D/P
* priority MS
* priority ^short = "Priorità FHIR (routine | urgent | asap | stat)"

// --- Estensione: Classe Priorità CUP (U/B/D/P) ---
* extension contains ExtClassePrioritaCup named classePrioritaCup 0..1 MS
* extension[classePrioritaCup] ^short = "Classe priorità CUP: U, B, D o P"

// --- Data richiesta ---
* authoredOn MS
* authoredOn ^short = "Data di emissione dell'impegnativa"

// --- Diagnosi / Quesito diagnostico ---
* reasonCode MS
* reasonCode ^short = "Quesito diagnostico o indicazione clinica"

// --- Quantità (numero di prestazioni prescritte) ---
* quantity[x] MS
* quantityQuantity ^short = "Numero di prestazioni prescritte (es. 3 sedute fisioterapia)"
