// ============================================================
// ESEMPI LcCup — presenza, teleconsulto IRT (FHIR R5)
// ============================================================

// --- Risorse di supporto comuni ---

Instance: paziente-mario-rossi
InstanceOf: Patient
* name[0].family = "Rossi"
* name[0].given[0] = "Mario"

Instance: mmg-dr-bianchi
InstanceOf: Practitioner
* name[0].family = "Bianchi"
* name[0].given[0] = "Giuseppe"
* name[0].prefix[0] = "Dr."

Instance: dr-verdi-cardiologo
InstanceOf: Practitioner
* name[0].family = "Verdi"
* name[0].given[0] = "Anna"
* name[0].prefix[0] = "Dr."

Instance: dr-rossi-equipe
InstanceOf: Practitioner
* name[0].family = "Rossi"
* name[0].given[0] = "Laura"

Instance: infermiere-bianchi
InstanceOf: Practitioner
* name[0].family = "Bianchi"
* name[0].given[0] = "Sara"

Instance: ambulatorio-cardio-sandrini
InstanceOf: Location
* status = #active
* name = "Ambulatorio Cardiologia - Ospedale Sandrini"

// --- Scenario presenza ---

Instance: esempio-agenda-cardiologia
InstanceOf: LcCupSchedule
Title: "Esempio Agenda Cardiologia SSN - CUP Lazio"
* identifier[0].system = "https://cup.regione.lazio.it/agende"
* identifier[0].value = "AGN-LAZIO-CARDIO-001"
* active = true
* name = "Agenda Cardiologia SSN"
* serviceType[0].concept.coding[0].system = "http://snomed.info/sct"
* serviceType[0].concept.coding[0].code = #408471009
* serviceType[0].concept.coding[0].display = "Visita cardiologica"
* specialty[0].coding[0].system = "http://snomed.info/sct"
* specialty[0].coding[0].code = #394579002
* specialty[0].coding[0].display = "Cardiologia"
* actor[0] = Reference(Location/ambulatorio-cardio-sandrini)
* planningHorizon.start = "2025-01-01T00:00:00+01:00"
* planningHorizon.end = "2025-12-31T23:59:59+01:00"
* comment = "Agenda primo accesso cardiologia in presenza — specialty e serviceType definiscono la prestazione"
* extension[tipoAgenda].valueCodeableConcept.coding[0].system = "https://www.fhir.laziocrea.it/CodeSystem/cs-tipo-agenda"
* extension[tipoAgenda].valueCodeableConcept.coding[0].code = #SSN

Instance: esempio-slot-libero
InstanceOf: LcCupSlot
Title: "Esempio Slot Libero - Visita Cardiologica"
* schedule = Reference(Schedule/esempio-agenda-cardiologia)
* status = #free
* serviceType.concept.coding[0].system = "http://snomed.info/sct"
* serviceType.concept.coding[0].code = #408471009
* serviceType.concept.coding[0].display = "Visita cardiologica"
* start = "2025-04-15T09:00:00+01:00"
* end   = "2025-04-15T09:20:00+01:00"
* overbooked = false

Instance: esempio-impegnativa-ssn
InstanceOf: LcCupServiceRequest
Title: "Esempio Impegnativa SSN - Visita Cardiologica"
* identifier[0].system = "https://sistemats.sanita.finanze.it/NRE"
* identifier[0].value = "1200A1234567890"
* status = #active
* intent = #order
* code.concept.coding[0].system = "https://www.salute.gov.it/NomenclatoreTariffario"
* code.concept.coding[0].code = #"89.7"
* code.concept.coding[0].display = "Visita medica generale / cardiologica"
* subject = Reference(Patient/paziente-mario-rossi)
* requester = Reference(Practitioner/mmg-dr-bianchi)
* authoredOn = "2025-04-08"
* priority = #urgent
* reason[0].concept.text = "Ipertensione arteriosa in scompenso"
* extension[classePriorita].valueCodeableConcept.coding[0].system = "https://www.fhir.laziocrea.it/CodeSystem/cs-classe-priorita"
* extension[classePriorita].valueCodeableConcept.coding[0].code = #B

Instance: esempio-prenotazione-visita
InstanceOf: LcCupAppointment
Title: "Esempio Prenotazione in Presenza - CUP Lazio"
* identifier[0].system = "https://cup.regione.lazio.it/prenotazioni"
* identifier[0].value = "PRN-2025-00123456"
* status = #booked
* serviceType[0].concept.coding[0].system = "http://snomed.info/sct"
* serviceType[0].concept.coding[0].code = #408471009
* serviceType[0].concept.coding[0].display = "Visita cardiologica"
* specialty[0].coding[0].system = "http://snomed.info/sct"
* specialty[0].coding[0].code = #394579002
* basedOn[0] = Reference(ServiceRequest/esempio-impegnativa-ssn)
* slot[0] = Reference(Slot/esempio-slot-libero)
* subject = Reference(Patient/paziente-mario-rossi)
* start = "2025-04-15T09:00:00+01:00"
* end   = "2025-04-15T09:20:00+01:00"
* minutesDuration = 20
* created = "2025-04-09T11:32:00+01:00"
* participant[paziente].actor = Reference(Patient/paziente-mario-rossi)
* participant[paziente].status = #accepted
* participant[professionista].actor = Reference(Practitioner/dr-verdi-cardiologo)
* participant[professionista].status = #accepted
* participant[sede].actor = Reference(Location/ambulatorio-cardio-sandrini)
* participant[sede].status = #accepted
* extension[codicePrenotazione].valueString = "CUP-2025-00123456"
* extension[canalePrenotazione].valueCodeableConcept.coding[0].system = "https://www.fhir.laziocrea.it/CodeSystem/cs-canale-prenotazione"
* extension[canalePrenotazione].valueCodeableConcept.coding[0].code = #TELEFONO
* extension[modalitaErogazione].valueCodeableConcept.coding[0].system = "https://www.fhir.laziocrea.it/CodeSystem/cs-modalita-erogazione"
* extension[modalitaErogazione].valueCodeableConcept.coding[0].code = #IN_PRESENZA

// --- Scenario teleconsulto IRT (normalizzato da esempi fornitore) ---

Instance: esempio-irt-organization
InstanceOf: LcCupOrganization
Title: "Esempio Struttura STS - IRT"
* identifier[0].type.coding[0].system = "urn:oid:2.16.840.1.113883.2.9.4.1.1"
* identifier[0].value = "120101"
* active = true
* name = "Azienda Ospedaliera Esempio"
* extension[selectable].valueBoolean = true
* extension[allowsEnrollment].valueBoolean = true

Instance: esempio-irt-careteam
InstanceOf: LcCupCareTeam
Title: "Esempio Equipe Teleconsulto"
* name = "Equipe Teleconsulto Cardiologia"
* status = #active
* participant[0].member = Reference(Practitioner/dr-verdi-cardiologo)
* participant[0].role.coding[0].system = "https://www.fhir.laziocrea.it/CodeSystem/cs-ruolo-equipe"
* participant[0].role.coding[0].code = #MEDICO
* participant[1].member = Reference(Practitioner/infermiere-bianchi)
* participant[1].role.coding[0].system = "https://www.fhir.laziocrea.it/CodeSystem/cs-ruolo-equipe"
* participant[1].role.coding[0].code = #INFERMIERE
* managingOrganization[0] = Reference(Organization/esempio-irt-organization)

Instance: esempio-irt-hs-piattaforma-televisita
InstanceOf: LcCupHealthcareService
Title: "Esempio Piattaforma Televisita"
* active = true
* name = "Televisita"
* type[0].coding[0].system = "https://www.fhir.laziocrea.it/CodeSystem/cs-tipo-servizio"
* type[0].coding[0].code = #PIATTAFORMA_TELEVISITA

Instance: esempio-irt-hs-prestazione
InstanceOf: LcCupHealthcareService
Title: "Esempio Prestazione Televisita Genetica"
* active = true
* name = "Televisita genetica di controllo"
* type[0].coding[0].system = "https://www.fhir.laziocrea.it/CodeSystem/cs-tipo-servizio"
* type[0].coding[0].code = #PRESTAZIONE_CLINICA

Instance: esempio-agenda-teleconsulto
InstanceOf: LcCupSchedule
Title: "Esempio Agenda Equipe Teleconsulto (modello IRT)"
Description: "Agenda generica equipe: nessuna prestazione clinica sulla Schedule; piattaforma sugli Slot"
* identifier[0].type.coding[0].system = "https://www.fhir.laziocrea.it/CodeSystem/cs-tipo-identificatore"
* identifier[0].type.coding[0].code = #99INV
* identifier[0].value = "AGN-TELE-EQUIPE-001"
* active = true
* name = "Agenda ReCup CUP"
* actor[0] = Reference(CareTeam/esempio-irt-careteam)
* planningHorizon.start = "2025-01-01T00:00:00+01:00"
* comment = "Equipe teleconsulto — modalità da Slot (piattaforma Televisita) e da Appointment in prenotazione"
* extension[tipoAgenda].valueCodeableConcept.coding[0].system = "https://www.fhir.laziocrea.it/CodeSystem/cs-tipo-agenda"
* extension[tipoAgenda].valueCodeableConcept.coding[0].code = #SSN
* extension[createdBy].valueReference = Reference(Practitioner/dr-verdi-cardiologo)
* extension[managingOrganization].valueReference = Reference(Organization/esempio-irt-organization)
* extension[timeQuantum].valueInteger = 30
* extension[visible].valueBoolean = true
* extension[draft].valueBoolean = false
* extension[slotInitialized].valueBoolean = true

Instance: esempio-slot-teleconsulto
InstanceOf: LcCupSlot
Title: "Esempio Slot Teleconsulto"
* schedule = Reference(Schedule/esempio-agenda-teleconsulto)
* status = #free
* serviceType.reference = Reference(HealthcareService/esempio-irt-hs-piattaforma-televisita)
* start = "2025-04-17T10:00:00+01:00"
* end   = "2025-04-17T10:30:00+01:00"
* overbooked = false

Instance: esempio-impegnativa-teleconsulto
InstanceOf: LcCupServiceRequest
Title: "Esempio Impegnativa SSN - Teleconsulto"
* identifier[0].system = "https://sistemats.sanita.finanze.it/NRE"
* identifier[0].value = "1200A9876543210"
* status = #active
* intent = #order
* code.concept.text = "Televisita genetica di controllo"
* subject = Reference(Patient/paziente-mario-rossi)
* requester = Reference(Practitioner/mmg-dr-bianchi)
* authoredOn = "2025-04-08"
* extension[classePriorita].valueCodeableConcept.coding[0].system = "https://www.fhir.laziocrea.it/CodeSystem/cs-classe-priorita"
* extension[classePriorita].valueCodeableConcept.coding[0].code = #B

Instance: esempio-prenotazione-teleconsulto
InstanceOf: LcCupAppointment
Title: "Esempio Prenotazione Teleconsulto - IRT"
* identifier[0].system = "https://cup.regione.lazio.it/prenotazioni"
* identifier[0].value = "PRN-2025-00789012"
* status = #booked
* serviceCategory[0].text = "healthcare-service"
* serviceType[0].reference = Reference(HealthcareService/esempio-irt-hs-piattaforma-televisita)
* supportingInformation[0] = Reference(HealthcareService/esempio-irt-hs-prestazione)
* basedOn[0] = Reference(ServiceRequest/esempio-impegnativa-teleconsulto)
* slot[0] = Reference(Slot/esempio-slot-teleconsulto)
* subject = Reference(Patient/paziente-mario-rossi)
* start = "2025-04-17T10:00:00+01:00"
* end   = "2025-04-17T10:30:00+01:00"
* created = "2025-04-10T14:15:00+01:00"
* participant[paziente].actor = Reference(Patient/paziente-mario-rossi)
* participant[paziente].status = #accepted
* participant[equipe].actor = Reference(CareTeam/esempio-irt-careteam)
* participant[equipe].status = #needs-action
* virtualService[0].channelType.system = "https://www.fhir.laziocrea.it/CodeSystem/cs-canale-virtuale"
* virtualService[0].channelType.code = #VIDEO_CALL
* virtualService[0].addressUrl = "https://telemedicina.laziocrea.it/sessione/abc123xyz"
* extension[codicePrenotazione].valueString = "CUP-2025-00789012"
* extension[canalePrenotazione].valueCodeableConcept.coding[0].system = "https://www.fhir.laziocrea.it/CodeSystem/cs-canale-prenotazione"
* extension[canalePrenotazione].valueCodeableConcept.coding[0].code = #TELEMEDICINA
* extension[classePriorita].valueCodeableConcept.coding[0].system = "https://www.fhir.laziocrea.it/CodeSystem/cs-classe-priorita"
* extension[classePriorita].valueCodeableConcept.coding[0].code = #B
* extension[modalitaErogazione].valueCodeableConcept.coding[0].system = "https://www.fhir.laziocrea.it/CodeSystem/cs-modalita-erogazione"
* extension[modalitaErogazione].valueCodeableConcept.coding[0].code = #TELE_CONSULTO
* extension[appointmentOrganization].valueReference = Reference(Organization/esempio-irt-organization)
* extension[documentsDeleted].valueBoolean = false
* extension[eventStatus].valueCodeableConcept.coding[0].system = "https://www.fhir.laziocrea.it/CodeSystem/cs-event-status"
* extension[eventStatus].valueCodeableConcept.coding[0].code = #IN_ATTESA
