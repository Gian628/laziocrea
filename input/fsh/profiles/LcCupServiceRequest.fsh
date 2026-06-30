Profile: LcCupServiceRequest
Id: lccup-service-request
Title: "LcCup ServiceRequest - Impegnativa SSN"
Description: "Impegnativa dematerializzata nel CUP regionale, precede la prenotazione."
Parent: ServiceRequest
* ^status = #draft
* ^experimental = true

* identifier MS
* status 1..1 MS
* intent 1..1 MS
* intent = #order
* code 1..1 MS
* subject 1..1 MS
* subject only Reference(Patient)
* requester 1..1 MS
* requester only Reference(Practitioner or PractitionerRole)
* priority MS

* extension contains ExtClassePriorita named classePriorita 0..1 MS
* extension[classePriorita] ^short = "Classe priorità CUP U/B/D/P"

* authoredOn MS
* reason MS
* reason ^short = "Quesito diagnostico o motivo richiesta"
* quantity[x] MS
