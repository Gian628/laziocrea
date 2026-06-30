# LcCup — Agende CUP Lazio

Profili FHIR **R5** per agende, slot e prenotazioni del CUP Regionale Lazio, con integrazione verso **IRT**.

- **Canonical:** `https://www.fhir.laziocrea.it`
- **Package:** `lazio.crea.cup.irt` — versione `0.1.0`
- **Progetto:** [LazioCrea](https://simplifier.net/LazioCrea)
- **Guida:** `guides/ig-fhir-lazio-crea-sviluppo/`

I link nella guida Simplifier puntano al progetto; la canonical (`https://www.fhir.laziocrea.it`) resta l'identificatore nelle risorse FHIR.

## Come lavoriamo

Sorgenti in **FSH**, compilazione con **SUSHI** (`sushi .`), pubblicazione su **Simplifier**.

## Compilazione

```bash
npm install -g fsh-sushi
sushi .
```

Richiede il package `hl7.fhir.r5.core` nella cache FHIR locale (`~/.fhir/packages`).

## Profili (`lccup-*`)

LcCup-Schedule, LcCup-Slot, LcCup-Appointment, LcCup-ServiceRequest, LcCup-CareTeam, LcCup-HealthcareService, LcCup-Organization

## Estensioni (senza prefisso `lccup-`)

CUP: `tipo-agenda`, `modalita-erogazione`, `codice-prenotazione`, `canale-prenotazione`, `classe-priorita`

IRT: `time-quantum`, `created-by`, `visible`, `draft`, `event-status`, `pathology`, …
