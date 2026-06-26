// ============================================================
// ESTENSIONI LcCup - CUP Lazio (Lazio Crea) → Telemedicina IRT
// ============================================================

Extension: ExtTipoAgenda
Id: lccup-tipo-agenda
Title: "LcCup - Tipo Agenda"
Description: """
  Regime di erogazione dell'agenda CUP Lazio: SSN, ALPI, privato o convenzionato.
"""
* ^context[+].type = #element
* ^context[=].expression = "Schedule"
* ^status = #draft
* value[x] only CodeableConcept
* valueCodeableConcept from VsLcCupTipoAgenda (required)

Extension: ExtCodicePrenotazione
Id: lccup-codice-prenotazione
Title: "LcCup - Codice Prenotazione"
Description: """
  Codice univoco CUP Lazio consegnato al paziente per disdetta o modifica.
"""
* ^context[+].type = #element
* ^context[=].expression = "Appointment"
* ^status = #draft
* value[x] only string

Extension: ExtCanalePrenotazione
Id: lccup-canale-prenotazione
Title: "LcCup - Canale di Prenotazione"
Description: """
  Canale usato per la prenotazione nel CUP Lazio (sportello, web, telemedicina IRT...).
"""
* ^context[+].type = #element
* ^context[=].expression = "Appointment"
* ^status = #draft
* value[x] only CodeableConcept
* valueCodeableConcept from VsLcCupCanalePrenotazione (required)

Extension: ExtClassePrioritaCup
Id: lccup-classe-priorita
Title: "LcCup - Classe di Priorità"
Description: """
  Classe di priorità U/B/D/P secondo normativa liste d'attesa italiana.
"""
* ^context[+].type = #element
* ^context[=].expression = "Appointment"
* ^context[+].type = #element
* ^context[=].expression = "ServiceRequest"
* ^status = #draft
* value[x] only CodeableConcept
* valueCodeableConcept from VsLcCupClassePriorita (required)

Extension: ExtModalitaErogazione
Id: lccup-modalita-erogazione
Title: "LcCup - Modalità di Erogazione"
Description: """
  In presenza, teleconsulto o telemonitoraggio.
  Usata da Lazio Crea per instradare le prenotazioni verso IRT.
"""
* ^context[+].type = #element
* ^context[=].expression = "Schedule"
* ^context[+].type = #element
* ^context[=].expression = "Appointment"
* ^status = #draft
* value[x] only CodeableConcept
* valueCodeableConcept from VsLcCupModalitaErogazione (required)

Extension: ExtLinkTeleconsulto
Id: lccup-link-teleconsulto
Title: "LcCup - Link Teleconsulto IRT"
Description: """
  URL sessione video restituito da IRT dopo invio prenotazione CUP Lazio.
"""
* ^context[+].type = #element
* ^context[=].expression = "Appointment"
* ^status = #draft
* value[x] only url
