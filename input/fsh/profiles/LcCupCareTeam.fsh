Profile: LcCupCareTeam
Id: lccup-care-team
Title: "LcCup CareTeam - Equipe teleconsulto"
Description: """
  Equipe associata ad agende e appuntamenti teleconsulto IRT.
  Ogni membro è un Practitioner con ruolo in equipe (medico, infermiere, amministrativo).
"""
Parent: CareTeam
* ^status = #draft
* ^experimental = true

* name 1..1 MS
* status 1..1 MS

* participant 1..* MS
* participant.member only Reference(Practitioner)
* participant.member 1..1 MS
* participant.role 1..1 MS
* participant.role from VsRuoloEquipe (required)
* participant ^short = "Membri dell'equipe (solo Practitioner)"

* managingOrganization 1..* MS
* managingOrganization only Reference(LcCupOrganization)
* managingOrganization ^short = "Struttura gestore dell'equipe"
