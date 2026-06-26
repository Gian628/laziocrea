// ============================================================
// ESEMPI LcCup - Scenari CUP Lazio (Lazio Crea) → IRT
// ============================================================

// ------------------------------------------------------------
// Esempio 1: Agenda Cardiologia SSN - CUP Lazio
// ------------------------------------------------------------
Instance: esempio-agenda-cardiologia
InstanceOf: LcCupSchedule
Title: "Esempio Agenda Cardiologia SSN - CUP Lazio"
Description: "Agenda ambulatorio Cardiologia gestita da Lazio Crea"
* identifier[0].system = "https://cup.regione.lazio.it/agende"
* identifier[0].value = "AGN-LAZIO-CARDIO-001"
* active = true
* serviceType[0].coding[0].system = "http://snomed.info/sct"
* serviceType[0].coding[0].code = #408471009
* serviceType[0].coding[0].display = "Visita cardiologica"
* specialty[0].coding[0].system = "http://snomed.info/sct"
* specialty[0].coding[0].code = #394579002
* specialty[0].coding[0].display = "Cardiologia"
* actor[0] = Reference(Location/ambulatorio-cardio-sandrini)
* planningHorizon.start = "2025-01-01T00:00:00+01:00"
* planningHorizon.end = "2025-12-31T23:59:59+01:00"
* comment = "Agenda primo accesso - Cardiologia Clinica"
* extension[tipoAgenda].valueCodeableConcept.coding[0].system = "https://www.fhir.laziocrea.it/CodeSystem/lccup-cs-tipo-agenda"
* extension[tipoAgenda].valueCodeableConcept.coding[0].code = #SSN
* extension[tipoAgenda].valueCodeableConcept.coding[0].display = "SSN Istituzionale"
* extension[modalitaErogazione].valueCodeableConcept.coding[0].system = "https://www.fhir.laziocrea.it/CodeSystem/lccup-cs-modalita-erogazione"
* extension[modalitaErogazione].valueCodeableConcept.coding[0].code = #IN_PRESENZA
* extension[modalitaErogazione].valueCodeableConcept.coding[0].display = "In presenza"

// ------------------------------------------------------------
// Esempio 2: Slot libero
// ------------------------------------------------------------
Instance: esempio-slot-libero
InstanceOf: LcCupSlot
Title: "Esempio Slot Libero - Visita Cardiologica"
Description: "Fascia oraria disponibile nell'agenda Cardiologia CUP Lazio"
* schedule = Reference(Schedule/esempio-agenda-cardiologia)
* status = #free
* serviceType[0].coding[0].system = "http://snomed.info/sct"
* serviceType[0].coding[0].code = #408471009
* serviceType[0].coding[0].display = "Visita cardiologica"
* start = "2025-04-15T09:00:00+01:00"
* end   = "2025-04-15T09:20:00+01:00"
* overbooked = false

// ------------------------------------------------------------
// Esempio 3: Impegnativa SSN
// ------------------------------------------------------------
Instance: esempio-impegnativa-ssn
InstanceOf: LcCupServiceRequest
Title: "Esempio Impegnativa SSN - Visita Cardiologica"
Description: "Impegnativa dematerializzata MMG per visita cardiologica"
* identifier[0].system = "https://sistemats.sanita.finanze.it/NRE"
* identifier[0].value = "1200A1234567890"
* status = #active
* intent = #order
* code.coding[0].system = "https://www.salute.gov.it/NomenclatoreTariffario"
* code.coding[0].code = #"89.7"
* code.coding[0].display = "Visita medica generale / cardiologica"
* subject = Reference(Patient/paziente-mario-rossi)
* requester = Reference(Practitioner/mmg-dr-bianchi)
* authoredOn = "2025-04-08"
* priority = #urgent
* reasonCode[0].text = "Ipertensione arteriosa in scompenso - dolore toracico recidivante"
* extension[classePrioritaCup].valueCodeableConcept.coding[0].system = "https://www.fhir.laziocrea.it/CodeSystem/lccup-cs-classe-priorita"
* extension[classePrioritaCup].valueCodeableConcept.coding[0].code = #B
* extension[classePrioritaCup].valueCodeableConcept.coding[0].display = "Breve"

// ------------------------------------------------------------
// Esempio 4: Prenotazione in presenza
// ------------------------------------------------------------
Instance: esempio-prenotazione-visita
InstanceOf: LcCupAppointment
Title: "Esempio Prenotazione in Presenza - CUP Lazio"
Description: "Prenotazione CUP Lazio per visita cardiologica in presenza"
* identifier[0].system = "https://cup.regione.lazio.it/prenotazioni"
* identifier[0].value = "PRN-2025-00123456"
* status = #booked
* serviceType[0].coding[0].system = "http://snomed.info/sct"
* serviceType[0].coding[0].code = #408471009
* serviceType[0].coding[0].display = "Visita cardiologica"
* specialty[0].coding[0].system = "http://snomed.info/sct"
* specialty[0].coding[0].code = #394579002
* specialty[0].coding[0].display = "Cardiologia"
* basedOn[0] = Reference(ServiceRequest/esempio-impegnativa-ssn)
* slot[0] = Reference(Slot/esempio-slot-libero)
* start = "2025-04-15T09:00:00+01:00"
* end   = "2025-04-15T09:20:00+01:00"
* minutesDuration = 20
* created = "2025-04-09T11:32:00+01:00"
* comment = "Prima visita cardiologica"
* patientInstruction = "Portare esami del sangue recenti ed ECG. Presentarsi 10 minuti prima."
* participant[paziente].actor = Reference(Patient/paziente-mario-rossi)
* participant[paziente].status = #accepted
* participant[professionista].actor = Reference(Practitioner/dr-verdi-cardiologo)
* participant[professionista].status = #accepted
* participant[sede].actor = Reference(Location/ambulatorio-cardio-sandrini)
* participant[sede].status = #accepted
* extension[codicePrenotazione].valueString = "CUP-2025-00123456"
* extension[canalePrenotazione].valueCodeableConcept.coding[0].system = "https://www.fhir.laziocrea.it/CodeSystem/lccup-cs-canale-prenotazione"
* extension[canalePrenotazione].valueCodeableConcept.coding[0].code = #TELEFONO
* extension[canalePrenotazione].valueCodeableConcept.coding[0].display = "Telefono"
* extension[classePrioritaCup].valueCodeableConcept.coding[0].system = "https://www.fhir.laziocrea.it/CodeSystem/lccup-cs-classe-priorita"
* extension[classePrioritaCup].valueCodeableConcept.coding[0].code = #B
* extension[classePrioritaCup].valueCodeableConcept.coding[0].display = "Breve"
* extension[modalitaErogazione].valueCodeableConcept.coding[0].system = "https://www.fhir.laziocrea.it/CodeSystem/lccup-cs-modalita-erogazione"
* extension[modalitaErogazione].valueCodeableConcept.coding[0].code = #IN_PRESENZA
* extension[modalitaErogazione].valueCodeableConcept.coding[0].display = "In presenza"

// ------------------------------------------------------------
// Esempio 5: Sede virtuale IRT
// ------------------------------------------------------------
Instance: sede-virtuale-teleconsulto
InstanceOf: Location
Title: "Sede Virtuale Teleconsulto IRT"
Description: "Location virtuale sulla Telemedicina nazionale IRT"
* status = #active
* name = "Telemedicina nazionale IRT"
* description = "Sede virtuale per teleconsulti CUP Lazio"
* mode = #instance
* type[0].coding[0].system = "http://terminology.hl7.org/CodeSystem/v3-RoleCode"
* type[0].coding[0].code = #VR
* type[0].coding[0].display = "Virtual"
* telecom[0].system = #url
* telecom[0].value = "https://telemedicina.laziocrea.it"

// ------------------------------------------------------------
// Esempio 6: Agenda teleconsulto
// ------------------------------------------------------------
Instance: esempio-agenda-teleconsulto
InstanceOf: LcCupSchedule
Title: "Esempio Agenda Teleconsulto - CUP Lazio"
Description: "Agenda CUP Lazio per teleconsulti inviati a IRT"
* identifier[0].system = "https://cup.regione.lazio.it/agende"
* identifier[0].value = "AGN-LAZIO-TELE-CARDIO-001"
* active = true
* serviceType[0].coding[0].system = "http://snomed.info/sct"
* serviceType[0].coding[0].code = #408471009
* serviceType[0].coding[0].display = "Visita cardiologica"
* specialty[0].coding[0].system = "http://snomed.info/sct"
* specialty[0].coding[0].code = #394579002
* specialty[0].coding[0].display = "Cardiologia"
* actor[0] = Reference(Location/sede-virtuale-teleconsulto)
* planningHorizon.start = "2025-01-01T00:00:00+01:00"
* planningHorizon.end = "2025-12-31T23:59:59+01:00"
* comment = "Agenda teleconsulto cardiologia - integrazione IRT"
* extension[tipoAgenda].valueCodeableConcept.coding[0].system = "https://www.fhir.laziocrea.it/CodeSystem/lccup-cs-tipo-agenda"
* extension[tipoAgenda].valueCodeableConcept.coding[0].code = #SSN
* extension[tipoAgenda].valueCodeableConcept.coding[0].display = "SSN Istituzionale"
* extension[modalitaErogazione].valueCodeableConcept.coding[0].system = "https://www.fhir.laziocrea.it/CodeSystem/lccup-cs-modalita-erogazione"
* extension[modalitaErogazione].valueCodeableConcept.coding[0].code = #TELECONSULTO
* extension[modalitaErogazione].valueCodeableConcept.coding[0].display = "Teleconsulto"

// ------------------------------------------------------------
// Esempio 7: Slot teleconsulto
// ------------------------------------------------------------
Instance: esempio-slot-teleconsulto
InstanceOf: LcCupSlot
Title: "Esempio Slot Teleconsulto"
Description: "Fascia oraria per teleconsulto cardiologico CUP Lazio"
* schedule = Reference(Schedule/esempio-agenda-teleconsulto)
* status = #free
* serviceType[0].coding[0].system = "http://snomed.info/sct"
* serviceType[0].coding[0].code = #408471009
* serviceType[0].coding[0].display = "Visita cardiologica"
* start = "2025-04-17T10:00:00+01:00"
* end   = "2025-04-17T10:20:00+01:00"
* overbooked = false

// ------------------------------------------------------------
// Esempio 8: Prenotazione CUP Lazio → IRT
// ------------------------------------------------------------
Instance: esempio-prenotazione-teleconsulto
InstanceOf: LcCupAppointment
Title: "Esempio Prenotazione Teleconsulto → IRT"
Description: "Prenotazione CUP Lazio inviata a IRT con link video"
* identifier[0].system = "https://cup.regione.lazio.it/prenotazioni"
* identifier[0].value = "PRN-2025-00789012"
* status = #booked
* serviceType[0].coding[0].system = "http://snomed.info/sct"
* serviceType[0].coding[0].code = #408471009
* serviceType[0].coding[0].display = "Visita cardiologica"
* specialty[0].coding[0].system = "http://snomed.info/sct"
* specialty[0].coding[0].code = #394579002
* specialty[0].coding[0].display = "Cardiologia"
* basedOn[0] = Reference(ServiceRequest/esempio-impegnativa-ssn)
* slot[0] = Reference(Slot/esempio-slot-teleconsulto)
* start = "2025-04-17T10:00:00+01:00"
* end   = "2025-04-17T10:20:00+01:00"
* minutesDuration = 20
* created = "2025-04-10T14:15:00+01:00"
* comment = "Teleconsulto cardiologico - collegarsi 5 minuti prima"
* patientInstruction = "Accedere al link video da PC o smartphone."
* participant[paziente].actor = Reference(Patient/paziente-mario-rossi)
* participant[paziente].status = #accepted
* participant[professionista].actor = Reference(Practitioner/dr-verdi-cardiologo)
* participant[professionista].status = #accepted
* participant[sede].actor = Reference(Location/sede-virtuale-teleconsulto)
* participant[sede].status = #accepted
* extension[codicePrenotazione].valueString = "CUP-2025-00789012"
* extension[canalePrenotazione].valueCodeableConcept.coding[0].system = "https://www.fhir.laziocrea.it/CodeSystem/lccup-cs-canale-prenotazione"
* extension[canalePrenotazione].valueCodeableConcept.coding[0].code = #TELEMEDICINA
* extension[canalePrenotazione].valueCodeableConcept.coding[0].display = "Telemedicina"
* extension[classePrioritaCup].valueCodeableConcept.coding[0].system = "https://www.fhir.laziocrea.it/CodeSystem/lccup-cs-classe-priorita"
* extension[classePrioritaCup].valueCodeableConcept.coding[0].code = #B
* extension[classePrioritaCup].valueCodeableConcept.coding[0].display = "Breve"
* extension[modalitaErogazione].valueCodeableConcept.coding[0].system = "https://www.fhir.laziocrea.it/CodeSystem/lccup-cs-modalita-erogazione"
* extension[modalitaErogazione].valueCodeableConcept.coding[0].code = #TELECONSULTO
* extension[modalitaErogazione].valueCodeableConcept.coding[0].display = "Teleconsulto"
* extension[linkTeleconsulto].valueUrl = "https://telemedicina.laziocrea.it/sessione/abc123xyz"
