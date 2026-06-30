Profile: LcCupCareTeam
Id: lccup-care-team
Title: "LcCup CareTeam - Equipe teleconsulto"
Description: """
  Equipe di professionisti associata ad agende e appuntamenti teleconsulto IRT.
"""
Parent: CareTeam
* ^status = #draft
* ^experimental = true

* name 1..1 MS
* status 1..1 MS

* participant 1..* MS
* participant.member only Reference(Practitioner)
* participant.member 1..1 MS
* participant ^short = "Membri dell'equipe"

* managingOrganization 1..* MS
* managingOrganization only Reference(LcCupOrganization)
* managingOrganization ^short = "Struttura gestore dell'equipe"
