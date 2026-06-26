// ============================================================
// PROFILO: IT-CUP-Schedule (Agenda)
// ============================================================
// Rappresenta un'agenda di un ambulatorio/servizio gestita dal CUP.
// Ogni agenda è associata a un erogatore (HealthcareService),
// una sede (Location) e/o un professionista (Practitioner).
// ============================================================

Profile: ITCUPSchedule
Id: it-cup-schedule
Title: "IT CUP Schedule - Agenda"
Description: """
  Profilo italiano per la risorsa Schedule nel contesto CUP.
  Rappresenta un'agenda ambulatoriale prenotabile tramite il
  Centro Unico di Prenotazione. Ogni agenda ha un tipo (SSN/ALPI/privato),
  un erogatore, una sede fisica e un orizzonte temporale di pianificazione.

  Relazioni:
  - contiene molti Slot (fasce orarie libere/occupate)
  - è associata a HealthcareService, Practitioner e/o Location
"""
Parent: Schedule
* ^status = #draft
* ^experimental = true

// --- Identificatori ---
// Il codice agenda nel sistema CUP regionale (obbligatorio)
* identifier 1..* MS
* identifier ^short = "Codice agenda nel sistema CUP"
* identifier ^definition = """
  Identificatore univoco dell'agenda nel sistema CUP regionale.
  Deve essere presente almeno un identifier con il codice assegnato
  dal sistema informativo regionale.
"""

// --- Attivo ---
* active 1..1 MS
* active ^short = "L'agenda è attiva e prenotabile"

// --- Tipo di servizio (prestazione/specialità) ---
// Obbligatorio: l'agenda deve dichiarare il tipo di servizio erogato
* serviceType 1..* MS
* serviceType ^short = "Tipo di prestazione erogata (es. Cardiologia, Ecografia...)"

// --- Specialità ---
* specialty MS
* specialty ^short = "Specialità medica dell'agenda"

// --- Erogatore/Attori (obbligatorio) ---
// In FHIR R4, actor è 1..* per definizione, ma lo rendiamo MS
// e restringiamo i tipi ammessi per il contesto CUP
* actor 1..* MS
* actor only Reference(Practitioner or PractitionerRole or HealthcareService or Location)
* actor ^short = "Erogatore: professionista, servizio e/o sede fisica"
* actor ^definition = """
  Risorsa a cui l'agenda appartiene. Nel contesto CUP devono essere
  presenti almeno:
  - HealthcareService: il servizio/ambulatorio erogante
  - Location: la sede fisica dove si eroga la prestazione
  Un'agenda può avere anche un Practitioner specifico associato.
"""

// --- Orizzonte di pianificazione ---
* planningHorizon MS
* planningHorizon ^short = "Periodo di validità dell'agenda (da - a)"

// --- Commento ---
* comment MS
* comment ^short = "Note sull'agenda (es. 'Primo accesso', 'Solo anziani')"

// --- Estensione: Tipo Agenda (SSN / ALPI / Privato) ---
* extension contains ExtTipoAgenda named tipoAgenda 1..1 MS
* extension[tipoAgenda] ^short = "Tipo agenda: SSN, ALPI, Privata o Convenzionata"

// --- Estensione: Modalità di erogazione (presenza / teleconsulto) ---
* extension contains ExtModalitaErogazione named modalitaErogazione 0..1 MS
* extension[modalitaErogazione] ^short = "Modalità di erogazione: in presenza, teleconsulto o telemonitoraggio"
