// ============================================================
// ESTENSIONI — CUP Lazio / integrazione IRT
// Id senza prefisso lccup- (namespace: fhir.laziocrea.it)
// ============================================================

// --- CUP ---

Extension: ExtTipoAgenda
Id: tipo-agenda
Title: "Tipo Agenda"
Description: "Regime di erogazione dell'agenda CUP Lazio: SSN, ALPI, privato o convenzionato."
* ^context[+].type = #element
* ^context[=].expression = "Schedule"
* ^status = #draft
* value[x] only CodeableConcept
* valueCodeableConcept from VsTipoAgenda (required)

Extension: ExtCodicePrenotazione
Id: codice-prenotazione
Title: "Codice Prenotazione"
Description: "Codice univoco CUP Lazio consegnato al paziente per disdetta o modifica."
* ^context[+].type = #element
* ^context[=].expression = "Appointment"
* ^status = #draft
* value[x] only string

Extension: ExtCanalePrenotazione
Id: canale-prenotazione
Title: "Canale di Prenotazione"
Description: "Canale usato per la prenotazione nel CUP Lazio."
* ^context[+].type = #element
* ^context[=].expression = "Appointment"
* ^status = #draft
* value[x] only CodeableConcept
* valueCodeableConcept from VsCanalePrenotazione (required)

Extension: ExtClassePriorita
Id: classe-priorita
Title: "Classe di Priorità"
Description: "Classe di priorità U/B/D/P secondo normativa liste d'attesa italiana."
* ^context[+].type = #element
* ^context[=].expression = "Appointment"
* ^context[+].type = #element
* ^context[=].expression = "ServiceRequest"
* ^status = #draft
* value[x] only CodeableConcept
* valueCodeableConcept from VsClassePriorita (required)

Extension: ExtModalitaErogazione
Id: modalita-erogazione
Title: "Modalità di Erogazione"
Description: """
  In presenza, teleconsulto o telemonitoraggio.
  Valorizzata sulla prenotazione (Appointment). Per le agende teleconsulto la modalità
  si deduce da actor CareTeam e da Slot.serviceType → HealthcareService piattaforma.
"""
* ^context[+].type = #element
* ^context[=].expression = "Appointment"
* ^status = #draft
* value[x] only CodeableConcept
* valueCodeableConcept from VsModalitaErogazione (required)

// --- Schedule (da additionalPayload IRT) ---

Extension: ExtCreatedBy
Id: created-by
Title: "Creato da"
Description: "Professionista che ha creato l'agenda."
* ^context[+].type = #element
* ^context[=].expression = "Schedule"
* ^status = #draft
* value[x] only Reference(Practitioner)

Extension: ExtManagingOrganization
Id: managing-organization
Title: "Organizzazione gestione agenda"
Description: "Struttura che gestisce l'agenda."
* ^context[+].type = #element
* ^context[=].expression = "Schedule"
* ^status = #draft
* value[x] only Reference(LcCupOrganization)

Extension: ExtTimeQuantum
Id: time-quantum
Title: "Durata slot (minuti)"
Description: "Durata predefinita delle fasce orarie in minuti (timeQuantum IRT)."
* ^context[+].type = #element
* ^context[=].expression = "Schedule"
* ^status = #draft
* value[x] only integer

Extension: ExtVisible
Id: visible
Title: "Visibile"
Description: "Indica se l'agenda è visibile agli utenti."
* ^context[+].type = #element
* ^context[=].expression = "Schedule"
* ^status = #draft
* value[x] only boolean

Extension: ExtDraft
Id: draft
Title: "Bozza"
Description: "Indica se l'agenda è in stato bozza."
* ^context[+].type = #element
* ^context[=].expression = "Schedule"
* ^status = #draft
* value[x] only boolean

Extension: ExtSlotInitialized
Id: slot-initialized
Title: "Slot inizializzati"
Description: "Indica se gli slot dell'agenda sono stati generati."
* ^context[+].type = #element
* ^context[=].expression = "Schedule"
* ^status = #draft
* value[x] only boolean

// --- Organization (da metadata IRT) ---

Extension: ExtSelectable
Id: selectable
Title: "Selezionabile"
Description: "Indica se la struttura è selezionabile in interfaccia."
* ^context[+].type = #element
* ^context[=].expression = "Organization"
* ^status = #draft
* value[x] only boolean

Extension: ExtAllowsEnrollment
Id: allows-enrollment
Title: "Consente iscrizione"
Description: "Indica se la struttura consente l'iscrizione dei pazienti."
* ^context[+].type = #element
* ^context[=].expression = "Organization"
* ^status = #draft
* value[x] only boolean

// --- Appointment (da metadata IRT) ---

Extension: ExtAppointmentOrganization
Id: appointment-organization
Title: "Organizzazione appuntamento"
Description: "Struttura associata all'appuntamento."
* ^context[+].type = #element
* ^context[=].expression = "Appointment"
* ^status = #draft
* value[x] only Reference(LcCupOrganization)

Extension: ExtDocumentsDeleted
Id: documents-deleted
Title: "Documenti eliminati"
Description: "Indica se i documenti associati all'appuntamento sono stati eliminati."
* ^context[+].type = #element
* ^context[=].expression = "Appointment"
* ^status = #draft
* value[x] only boolean

Extension: ExtPathology
Id: pathology
Title: "Patologia / quesito"
Description: "Riferimento al quesito clinico o patologia associata all'appuntamento."
* ^context[+].type = #element
* ^context[=].expression = "Appointment"
* ^status = #draft
* value[x] only Reference

Extension: ExtEventStatus
Id: event-status
Title: "Stato evento"
Description: "Stato workflow dell'evento lato piattaforma (es. IN_ATTESA). Corrisponde a eventColor IRT."
* ^context[+].type = #element
* ^context[=].expression = "Appointment"
* ^status = #draft
* value[x] only CodeableConcept
* valueCodeableConcept from VsEventStatus (required)
