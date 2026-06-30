Profile: LcCupOrganization
Id: lccup-organization
Title: "LcCup Organization - Struttura sanitaria"
Description: """
  Profilo per le strutture sanitarie nel contesto CUP Lazio e integrazione IRT.
  Identificatore STS regionale e flag operativi piattaforma.
"""
Parent: Organization
* ^status = #draft
* ^experimental = true

* identifier 1..* MS
* identifier ^short = "Codice STS struttura (urn:oid:2.16.840.1.113883.2.9.4.1.1)"

* active 1..1 MS
* name 1..1 MS

* extension contains ExtSelectable named selectable 0..1 MS
* extension[selectable] ^short = "Struttura selezionabile in interfaccia"

* extension contains ExtAllowsEnrollment named allowsEnrollment 0..1 MS
* extension[allowsEnrollment] ^short = "Struttura che consente iscrizione pazienti"
