// ============================================================
// PROFILO: LcCup-ServiceRequest (Impegnativa SSN CUP Lazio)
// ============================================================

Profile: LcCupServiceRequest
Id: lccup-service-request
Title: "LcCup ServiceRequest - Impegnativa SSN"
Description: """
  Profilo Lazio Crea per l'impegnativa dematerializzata nel CUP regionale.
  Precede la prenotazione (LcCupAppointment) nel flusso CUP Lazio.
"""
Parent: ServiceRequest
* ^status = #draft
* ^experimental = true

* identifier MS
* identifier ^short = "NRE o codice impegnativa"

* status 1..1 MS
* status ^short = "Stato impegnativa"

* intent 1..1 MS
* intent = #order

* code 1..1 MS
* code ^short = "Codice prestazione (Nomenclatore Nazionale/Regionale)"

* subject 1..1 MS
* subject only Reference(Patient)
* subject ^short = "Assistito"

* requester 1..1 MS
* requester only Reference(Practitioner or PractitionerRole)
* requester ^short = "Medico prescrittore"

* priority MS
* priority ^short = "Priorità FHIR"

* extension contains ExtClassePrioritaCup named classePrioritaCup 0..1 MS
* extension[classePrioritaCup] ^short = "Classe priorità CUP U/B/D/P"

* authoredOn MS
* authoredOn ^short = "Data emissione impegnativa"

* reasonCode MS
* reasonCode ^short = "Quesito diagnostico"

* quantity[x] MS
* quantityQuantity ^short = "Numero prestazioni prescritte"
