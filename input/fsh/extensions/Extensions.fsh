// ============================================================
// ESTENSIONI - Informazioni specifiche del contesto CUP italiano
// ============================================================

// ------------------------------------------------------------
// Estensione: Tipo Agenda
// Applicata a Schedule - distingue SSN / ALPI / Privato
// ------------------------------------------------------------
Extension: ExtTipoAgenda
Id: ext-tipo-agenda
Title: "Tipo Agenda CUP"
Description: """
  Indica il regime di erogazione dell'agenda: istituzionale SSN,
  Attività Libero-Professionale Intramuraria (ALPI) o privato.
  Corrisponde al campo 'tipo agenda' dei sistemi CUP regionali.
"""
* ^context[+].type = #element
* ^context[=].expression = "Schedule"
* ^status = #draft
* value[x] only CodeableConcept
* valueCodeableConcept from VsTipoAgendaCup (required)

// ------------------------------------------------------------
// Estensione: Codice Prenotazione CUP
// Applicata a Appointment - il numero univoco di prenotazione
// ------------------------------------------------------------
Extension: ExtCodicePrenotazione
Id: ext-codice-prenotazione
Title: "Codice Prenotazione CUP"
Description: """
  Codice univoco assegnato dal sistema CUP alla prenotazione.
  È il codice che viene consegnato al paziente e usato per
  disdire o modificare l'appuntamento.
"""
* ^context[+].type = #element
* ^context[=].expression = "Appointment"
* ^status = #draft
* value[x] only string

// ------------------------------------------------------------
// Estensione: Canale di Prenotazione
// Applicata a Appointment - come è stata fatta la prenotazione
// ------------------------------------------------------------
Extension: ExtCanalePrenotazione
Id: ext-canale-prenotazione
Title: "Canale di Prenotazione"
Description: """
  Indica attraverso quale canale è stata effettuata la prenotazione
  (sportello, telefono, web, app, farmacia, MMG diretto).
"""
* ^context[+].type = #element
* ^context[=].expression = "Appointment"
* ^status = #draft
* value[x] only CodeableConcept
* valueCodeableConcept from VsCanalePrenotazioneCup (required)

// ------------------------------------------------------------
// Estensione: Classe di Priorità CUP
// Applicata a Appointment e ServiceRequest
// Mappa le classi U/B/D/P della normativa italiana
// ------------------------------------------------------------
Extension: ExtClassePrioritaCup
Id: ext-classe-priorita-cup
Title: "Classe di Priorità CUP"
Description: """
  Classe di priorità della prestazione secondo la normativa italiana
  sulle liste d'attesa: U (Urgente), B (Breve), D (Differibile),
  P (Programmabile). Determina i tempi massimi di attesa garantiti.
"""
* ^context[+].type = #element
* ^context[=].expression = "Appointment"
* ^context[+].type = #element
* ^context[=].expression = "ServiceRequest"
* ^status = #draft
* value[x] only CodeableConcept
* valueCodeableConcept from VsClassePrioritaCup (required)

// ------------------------------------------------------------
// Estensione: Modalità di Erogazione
// Applicata a Schedule e Appointment
// Distingue in presenza, teleconsulto, telemonitoraggio
// ------------------------------------------------------------
Extension: ExtModalitaErogazione
Id: ext-modalita-erogazione
Title: "Modalità di Erogazione"
Description: """
  Indica come viene erogata la prestazione: in presenza presso la struttura,
  tramite teleconsulto (videochiamata) o telemonitoraggio.
  Usata per instradare le prenotazioni CUP Lazio Crea verso la Telemedicina nazionale IRT.
"""
* ^context[+].type = #element
* ^context[=].expression = "Schedule"
* ^context[+].type = #element
* ^context[=].expression = "Appointment"
* ^status = #draft
* value[x] only CodeableConcept
* valueCodeableConcept from VsModalitaErogazione (required)

// ------------------------------------------------------------
// Estensione: Link Teleconsulto
// Applicata a Appointment - URL della sessione video
// ------------------------------------------------------------
Extension: ExtLinkTeleconsulto
Id: ext-link-teleconsulto
Title: "Link Teleconsulto"
Description: """
  URL della sessione di teleconsulto restituito dalla Telemedicina nazionale IRT.
  Viene popolato da Lazio Crea dopo l'invio della prenotazione CUP a IRT
  quando la modalità di erogazione è TELECONSULTO.
"""
* ^context[+].type = #element
* ^context[=].expression = "Appointment"
* ^status = #draft
* value[x] only url
