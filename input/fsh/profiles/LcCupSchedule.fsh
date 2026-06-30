Profile: LcCupSchedule
Id: lccup-schedule
Title: "LcCup Schedule - Agenda CUP Lazio"
Description: """
  Agenda ambulatoriale o teleconsulto gestita dal CUP Regionale Lazio.
  In teleconsulto l'actor principale è un CareTeam; in presenza Practitioner, Location o HealthcareService.
"""
Parent: Schedule
* ^status = #draft
* ^experimental = true

* identifier 1..* MS
* identifier ^short = "Identificatore agenda (mnemonico CUP 99INV o URI CUP)"
* identifier.type MS
* identifier.type from VsTipoIdentificatore (extensible)

* active 1..1 MS
* name 1..1 MS

* serviceType 0..* MS
* serviceType ^short = "Prestazioni ammesse (opzionale in teleconsulto; può stare sullo Slot)"

* specialty 0..* MS
* specialty ^short = "Specialità medica (tipica in presenza)"

* actor 1..* MS
* actor only Reference(LcCupCareTeam or Practitioner or PractitionerRole or HealthcareService or Location)
* actor ^short = "Equipe (teleconsulto) o erogatore in presenza"

* planningHorizon MS
* planningHorizon.start MS
* planningHorizon ^short = "Periodo di validità dell'agenda"

* comment MS

* extension contains ExtTipoAgenda named tipoAgenda 0..1 MS
* extension[tipoAgenda] ^short = "Tipo agenda: SSN, ALPI, Privata o Convenzionata"

* extension contains ExtModalitaErogazione named modalitaErogazione 0..1 MS
* extension[modalitaErogazione] ^short = "In presenza, teleconsulto o telemonitoraggio"

* extension contains ExtCreatedBy named createdBy 0..1 MS
* extension[createdBy] ^short = "Professionista creatore agenda"

* extension contains ExtManagingOrganization named managingOrganization 0..1 MS
* extension[managingOrganization] ^short = "Struttura gestore agenda"

* extension contains ExtTimeQuantum named timeQuantum 0..1 MS
* extension[timeQuantum] ^short = "Durata slot predefinita in minuti"

* extension contains ExtVisible named visible 0..1 MS
* extension[visible] ^short = "Agenda visibile"

* extension contains ExtDraft named draft 0..1 MS
* extension[draft] ^short = "Agenda in bozza"

* extension contains ExtSlotInitialized named slotInitialized 0..1 MS
* extension[slotInitialized] ^short = "Slot generati"
