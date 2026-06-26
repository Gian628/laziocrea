// ============================================================
// PROFILO: LcCup-Schedule (Agenda CUP Lazio)
// ============================================================
// Agenda di un ambulatorio/servizio gestita dal CUP Regione Lazio
// (Lazio Crea — Azienda dei Servizi Regionali in Sanità del Lazio).
// ============================================================

Profile: LcCupSchedule
Id: lccup-schedule
Title: "LcCup Schedule - Agenda CUP Lazio"
Description: """
  Profilo Lazio Crea per la risorsa Schedule nel contesto del CUP regionale.
  Rappresenta un'agenda ambulatoriale prenotabile, pensata per l'integrazione
  con la Telemedicina nazionale IRT (invio agende e prenotazioni a distanza).

  Relazioni:
  - contiene molti Slot (fasce orarie libere/occupate)
  - è associata a HealthcareService, Practitioner e/o Location
"""
Parent: Schedule
* ^status = #draft
* ^experimental = true

* identifier 1..* MS
* identifier ^short = "Codice agenda nel CUP Lazio"
* identifier ^definition = """
  Identificatore univoco dell'agenda nel sistema CUP gestito da Lazio Crea.
"""

* active 1..1 MS
* active ^short = "L'agenda è attiva e prenotabile"

* serviceType 1..* MS
* serviceType ^short = "Tipo di prestazione erogata (es. Cardiologia, Ecografia...)"

* specialty MS
* specialty ^short = "Specialità medica dell'agenda"

* actor 1..* MS
* actor only Reference(Practitioner or PractitionerRole or HealthcareService or Location)
* actor ^short = "Erogatore: professionista, servizio e/o sede"
* actor ^definition = """
  Risorsa a cui l'agenda appartiene nel contesto del CUP Lazio:
  HealthcareService (ambulatorio), Location (sede) e/o Practitioner.
"""

* planningHorizon MS
* planningHorizon ^short = "Periodo di validità dell'agenda (da - a)"

* comment MS
* comment ^short = "Note sull'agenda"

* extension contains ExtTipoAgenda named tipoAgenda 1..1 MS
* extension[tipoAgenda] ^short = "Tipo agenda: SSN, ALPI, Privata o Convenzionata"

* extension contains ExtModalitaErogazione named modalitaErogazione 0..1 MS
* extension[modalitaErogazione] ^short = "In presenza, teleconsulto o telemonitoraggio (integrazione IRT)"
