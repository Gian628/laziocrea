Profile: LcCupSlot
Id: lccup-slot
Title: "LcCup Slot - Fascia Oraria CUP Lazio"
Description: """
  Fascia oraria in un'agenda CUP.
  In teleconsulto serviceType referenzia LcCupHealthcareService; in presenza può usare concept SNOMED.
"""
Parent: Slot
* ^status = #draft
* ^experimental = true

* schedule 1..1 MS
* schedule only Reference(LcCupSchedule)

* status 1..1 MS

* serviceType 0..1 MS
* serviceType ^short = "Prestazione o piattaforma (CodeableReference)"

* start 1..1 MS
* end 1..1 MS

* comment MS
* overbooked MS
