// ============================================================
// ESEMPI - Istanze concrete per i principali scenari CUP
// ============================================================

// ------------------------------------------------------------
// Esempio 1: Agenda di Cardiologia SSN
// Ambulatorio di Cardiologia, Ospedale Niguarda, Milano
// ------------------------------------------------------------
Instance: esempio-agenda-cardiologia
InstanceOf: ITCUPSchedule
Title: "Esempio Agenda Cardiologia SSN"
Description: "Agenda dell'ambulatorio di Cardiologia - regime SSN"
* identifier[0].system = "https://cup.regione.lombardia.it/agende"
* identifier[0].value = "AGN-NIGUARDA-CARDIO-001"
* active = true
* serviceType[0].coding[0].system = "http://snomed.info/sct"
* serviceType[0].coding[0].code = #408471009
* serviceType[0].coding[0].display = "Visita cardiologica"
* specialty[0].coding[0].system = "http://snomed.info/sct"
* specialty[0].coding[0].code = #394579002
* specialty[0].coding[0].display = "Cardiologia"
* actor[0] = Reference(Location/ambulatorio-cardio-niguarda)
* planningHorizon.start = "2025-01-01T00:00:00+01:00"
* planningHorizon.end = "2025-12-31T23:59:59+01:00"
* comment = "Agenda primo accesso - Cardiologia Clinica"
* extension[tipoAgenda].valueCodeableConcept.coding[0].system = "https://www.fhir.laziocrea.it/CodeSystem/cs-tipo-agenda-cup"
* extension[tipoAgenda].valueCodeableConcept.coding[0].code = #SSN
* extension[tipoAgenda].valueCodeableConcept.coding[0].display = "SSN Istituzionale"
* extension[modalitaErogazione].valueCodeableConcept.coding[0].system = "https://www.fhir.laziocrea.it/CodeSystem/cs-modalita-erogazione"
* extension[modalitaErogazione].valueCodeableConcept.coding[0].code = #IN_PRESENZA
* extension[modalitaErogazione].valueCodeableConcept.coding[0].display = "In presenza"

// ------------------------------------------------------------
// Esempio 2: Slot libero nell'agenda cardiologia
// Martedì 15 aprile 2025, ore 9:00-9:20
// ------------------------------------------------------------
Instance: esempio-slot-libero
InstanceOf: ITCUPSlot
Title: "Esempio Slot Libero - Visita Cardiologica"
Description: "Fascia oraria disponibile nell'agenda di Cardiologia"
* schedule = Reference(Schedule/esempio-agenda-cardiologia)
* status = #free
* serviceType[0].coding[0].system = "http://snomed.info/sct"
* serviceType[0].coding[0].code = #408471009
* serviceType[0].coding[0].display = "Visita cardiologica"
* start = "2025-04-15T09:00:00+01:00"
* end   = "2025-04-15T09:20:00+01:00"
* overbooked = false

// ------------------------------------------------------------
// Esempio 3: Impegnativa SSN per visita cardiologica
// Emessa dal MMG per il paziente Mario Rossi
// Classe B (entro 10 giorni), NRE: 1200A1234567890
// ------------------------------------------------------------
Instance: esempio-impegnativa-ssn
InstanceOf: ITCUPServiceRequest
Title: "Esempio Impegnativa SSN - Visita Cardiologica"
Description: "Impegnativa dematerializzata del MMG per visita cardiologica"
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
* extension[classePrioritaCup].valueCodeableConcept.coding[0].system = "https://www.fhir.laziocrea.it/CodeSystem/cs-classe-priorita-cup"
* extension[classePrioritaCup].valueCodeableConcept.coding[0].code = #B
* extension[classePrioritaCup].valueCodeableConcept.coding[0].display = "Breve"

// ------------------------------------------------------------
// Esempio 4: Prenotazione CUP - Visita Cardiologica
// Paziente Mario Rossi prenota telefonicamente
// Slot del 15 aprile alle 9:00
// Codice prenotazione CUP: CUP-2025-00123456
// ------------------------------------------------------------
Instance: esempio-prenotazione-visita
InstanceOf: ITCUPAppointment
Title: "Esempio Prenotazione - Visita Cardiologica"
Description: "Prenotazione CUP per visita cardiologica, classe B, canale telefonico"
* identifier[0].system = "https://cup.regione.lombardia.it/prenotazioni"
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
// Paziente
* participant[paziente].actor = Reference(Patient/paziente-mario-rossi)
* participant[paziente].status = #accepted
// Professionista
* participant[professionista].actor = Reference(Practitioner/dr-verdi-cardiologo)
* participant[professionista].status = #accepted
// Sede
* participant[sede].actor = Reference(Location/ambulatorio-cardio-niguarda)
* participant[sede].status = #accepted
// Estensioni italiane
* extension[codicePrenotazione].valueString = "CUP-2025-00123456"
* extension[canalePrenotazione].valueCodeableConcept.coding[0].system = "https://www.fhir.laziocrea.it/CodeSystem/cs-canale-prenotazione-cup"
* extension[canalePrenotazione].valueCodeableConcept.coding[0].code = #TELEFONO
* extension[canalePrenotazione].valueCodeableConcept.coding[0].display = "Telefono"
* extension[modalitaErogazione].valueCodeableConcept.coding[0].system = "https://www.fhir.laziocrea.it/CodeSystem/cs-modalita-erogazione"
* extension[classePrioritaCup].valueCodeableConcept.coding[0].code = #B
* extension[classePrioritaCup].valueCodeableConcept.coding[0].display = "Breve"

// ------------------------------------------------------------
// Esempio 5: Sede virtuale per teleconsulto
// ------------------------------------------------------------
Instance: sede-virtuale-teleconsulto
InstanceOf: Location
Title: "Sede Virtuale Teleconsulto"
Description: "Location virtuale sulla Telemedicina nazionale IRT"
* status = #active
* name = "Telemedicina nazionale IRT"
* description = "Sede virtuale per erogazione teleconsulti via IRT"
* mode = #instance
* type[0].coding[0].system = "http://terminology.hl7.org/CodeSystem/v3-RoleCode"
* type[0].coding[0].code = #VR
* type[0].coding[0].display = "Virtual"
* telecom[0].system = #url
* telecom[0].value = "https://telemedicina.laziocrea.it"

// ------------------------------------------------------------
// Esempio 6: Agenda teleconsulto Cardiologia
// ------------------------------------------------------------
Instance: esempio-agenda-teleconsulto
InstanceOf: ITCUPSchedule
Title: "Esempio Agenda Teleconsulto Cardiologia"
Description: "Agenda CUP Lazio dedicata ai teleconsulti cardiologici inviati a IRT"
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
* comment = "Agenda teleconsulto cardiologia - solo a distanza"
* extension[tipoAgenda].valueCodeableConcept.coding[0].system = "https://www.fhir.laziocrea.it/CodeSystem/cs-tipo-agenda-cup"
* extension[tipoAgenda].valueCodeableConcept.coding[0].code = #SSN
* extension[tipoAgenda].valueCodeableConcept.coding[0].display = "SSN Istituzionale"
* extension[modalitaErogazione].valueCodeableConcept.coding[0].system = "https://www.fhir.laziocrea.it/CodeSystem/cs-modalita-erogazione"
* extension[modalitaErogazione].valueCodeableConcept.coding[0].code = #TELECONSULTO
* extension[modalitaErogazione].valueCodeableConcept.coding[0].display = "Teleconsulto"

// ------------------------------------------------------------
// Esempio 7: Slot libero per teleconsulto
// Giovedì 17 aprile 2025, ore 10:00-10:20
// ------------------------------------------------------------
Instance: esempio-slot-teleconsulto
InstanceOf: ITCUPSlot
Title: "Esempio Slot Teleconsulto Cardiologia"
Description: "Fascia oraria disponibile per teleconsulto cardiologico"
* schedule = Reference(Schedule/esempio-agenda-teleconsulto)
* status = #free
* serviceType[0].coding[0].system = "http://snomed.info/sct"
* serviceType[0].coding[0].code = #408471009
* serviceType[0].coding[0].display = "Visita cardiologica"
* start = "2025-04-17T10:00:00+01:00"
* end   = "2025-04-17T10:20:00+01:00"
* overbooked = false

// ------------------------------------------------------------
// Esempio 8: Prenotazione CUP Lazio Crea → IRT
// Mario Rossi prenota teleconsulto; Lazio Crea invia a IRT
// IRT restituisce il link video dopo la conferma
// ------------------------------------------------------------
Instance: esempio-prenotazione-teleconsulto
InstanceOf: ITCUPAppointment
Title: "Esempio Prenotazione Teleconsulto Cardiologia"
Description: "Prenotazione CUP Lazio inviata a Telemedicina nazionale IRT con link video"
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
* patientInstruction = "Accedere al link video da PC o smartphone. Verificare microfono e webcam."
* participant[paziente].actor = Reference(Patient/paziente-mario-rossi)
* participant[paziente].status = #accepted
* participant[professionista].actor = Reference(Practitioner/dr-verdi-cardiologo)
* participant[professionista].status = #accepted
* participant[sede].actor = Reference(Location/sede-virtuale-teleconsulto)
* participant[sede].status = #accepted
* extension[codicePrenotazione].valueString = "CUP-2025-00789012"
* extension[canalePrenotazione].valueCodeableConcept.coding[0].system = "https://www.fhir.laziocrea.it/CodeSystem/cs-canale-prenotazione-cup"
* extension[canalePrenotazione].valueCodeableConcept.coding[0].code = #TELEMEDICINA
* extension[canalePrenotazione].valueCodeableConcept.coding[0].display = "Telemedicina"
* extension[classePrioritaCup].valueCodeableConcept.coding[0].system = "https://www.fhir.laziocrea.it/CodeSystem/cs-classe-priorita-cup"
* extension[classePrioritaCup].valueCodeableConcept.coding[0].code = #B
* extension[classePrioritaCup].valueCodeableConcept.coding[0].display = "Breve"
* extension[modalitaErogazione].valueCodeableConcept.coding[0].system = "https://www.fhir.laziocrea.it/CodeSystem/cs-modalita-erogazione"
* extension[modalitaErogazione].valueCodeableConcept.coding[0].code = #TELECONSULTO
* extension[modalitaErogazione].valueCodeableConcept.coding[0].display = "Teleconsulto"
* extension[linkTeleconsulto].valueUrl = "https://telemedicina.laziocrea.it/sessione/abc123xyz"
