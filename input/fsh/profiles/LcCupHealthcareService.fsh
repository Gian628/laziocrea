Profile: LcCupHealthcareService
Id: lccup-healthcare-service
Title: "LcCup HealthcareService - Prestazione o piattaforma"
Description: """
  Servizio sanitario nel contesto CUP/IRT.
  Può rappresentare la piattaforma telemedicina (es. TELEVISIT) o una prestazione clinica specifica.
"""
Parent: HealthcareService
* ^status = #draft
* ^experimental = true

* active 1..1 MS
* name 1..1 MS

* type 1..* MS
* type from VsTipoServizio (extensible)
* type ^short = "Piattaforma o prestazione clinica"
