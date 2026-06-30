Profile: LcCupAppointment
Id: lccup-appointment
Title: "LcCup Appointment - Prenotazione CUP Lazio"
Description: """
  Prenotazione ambulatoriale o teleconsulto nel CUP regionale.
  Teleconsulto: equipe (CareTeam), virtualService per sessione video, prestazione in supportingInformation.
"""
Parent: Appointment
* ^status = #draft
* ^experimental = true

* identifier MS

* status 1..1 MS

* serviceCategory 0..* MS

* serviceType 0..* MS
* serviceType ^short = "Piattaforma o tipo prestazione (CodeableReference)"

* specialty 0..* MS

* appointmentType MS

* supportingInformation 0..* MS
* supportingInformation only Reference(LcCupHealthcareService)
* supportingInformation ^short = "Prestazione clinica specifica (teleconsulto IRT)"

* basedOn 0..* MS
* basedOn only Reference(LcCupServiceRequest)
* basedOn ^short = "Impegnativa SSN"

* slot 1..* MS
* slot only Reference(LcCupSlot)

* subject 1..1 MS
* subject only Reference(Patient)
* subject ^short = "Assistito"

* start 1..1 MS
* end MS
* minutesDuration MS
* created MS
* note MS
* patientInstruction MS

* virtualService 0..* MS
* virtualService.channelType from VsCanaleVirtuale (extensible)
* virtualService ^short = "Sessione videocall (addressString o URL)"

* participant ^slicing.discriminator.type = #type
* participant ^slicing.discriminator.path = "actor"
* participant ^slicing.rules = #open

* participant contains
    paziente 1..1 MS and
    equipe 0..1 MS and
    professionista 0..1 MS and
    sede 0..1 MS

* participant[paziente].actor only Reference(Patient)
* participant[paziente].actor 1..1 MS
* participant[paziente].status MS
* participant[paziente] ^short = "Assistito (ridondante con subject, ammesso per compatibilità IRT)"

* participant[equipe].actor only Reference(LcCupCareTeam)
* participant[equipe].actor 1..1 MS
* participant[equipe].status MS
* participant[equipe] ^short = "Equipe teleconsulto"

* participant[professionista].actor only Reference(Practitioner or PractitionerRole)
* participant[professionista].actor 1..1 MS
* participant[professionista].status MS
* participant[professionista] ^short = "Professionista (opzionale; può essere popolato post-prenotazione)"

* participant[sede].actor only Reference(Location)
* participant[sede].actor 1..1 MS
* participant[sede].status MS
* participant[sede] ^short = "Sede fisica (presenza)"

* extension contains ExtCodicePrenotazione named codicePrenotazione 1..1 MS
* extension contains ExtCanalePrenotazione named canalePrenotazione 1..1 MS
* extension contains ExtClassePriorita named classePriorita 0..1 MS
* extension contains ExtModalitaErogazione named modalitaErogazione 1..1 MS

* extension contains ExtAppointmentOrganization named appointmentOrganization 0..1 MS
* extension[appointmentOrganization] ^short = "Struttura associata all'appuntamento"

* extension contains ExtDocumentsDeleted named documentsDeleted 0..1 MS
* extension[documentsDeleted] ^short = "Documenti eliminati"

* extension contains ExtPathology named pathology 0..1 MS
* extension[pathology] ^short = "Patologia o quesito clinico"

* extension contains ExtEventStatus named eventStatus 0..1 MS
* extension[eventStatus] ^short = "Stato workflow evento"
