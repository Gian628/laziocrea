# {{page-title}}

## Contesto

Questa Implementation Guide si inserisce nel contesto del sistema sanitario della Regione Lazio e definisce un insieme di profili **LcCup**, basati sullo standard **HL7® FHIR® R5**, per la rappresentazione e lo scambio delle informazioni relative alla gestione delle agende sanitarie e delle prenotazioni.

I profili forniscono un modello informativo interoperabile per descrivere le principali risorse coinvolte nella configurazione delle agende, nella pubblicazione delle disponibilità e nella gestione delle prenotazioni, supportando la condivisione delle informazioni tra sistemi informativi operanti in un contesto multi-applicativo.

## Cosa modellano i profili LcCup

1. **Organizzazioni** (`LcCup-Organization`)
2. **Servizi, équipe e professionitsit** (`LcCup-HealthcareService`, `LcCup-CareTeam`, `LcCup-Practitioner`)
3. **Agende e disponibilità** (`LcCup-Schedule`, `LcCup-Slot`)
4. **Pazienti, prescrizioni e prenotazioni** (`LcCup-Patient`, `LcCup-ServiceRequest`, `LcCup-Appointment`)
5. **Prestazioni virtuali** (`virtualService` ed eventuali estensioni dedicate)

## Ambito tecnico

| Fase | Risorse LcCup | Descrizione |
|---|---|---|
| Pianificazione | `Schedule` | Configurazione delle agende |
| Disponibilità | `Slot` | Gestione delle fasce orarie prenotabili |
| Prescrizione | `ServiceRequest` | Prescrizione della prestazione, ove prevista |
| Prenotazione | `Appointment` | Associazione del paziente a una disponibilità |
## Standard di riferimento

- HL7 FHIR **R5** (5.0.0)
- PNLA — classi priorità **U / B / D / P**

## Stato

Guida in **draft**, versione `0.1.0`.

**Progetto Simplifier:** [LazioCrea](https://simplifier.net/LazioCrea)

**Package:** `lazio.crea.cup.irt` v0.1.0

**URL canonica** (identificatore FHIR nelle risorse; non ancora risolvibile via browser): `https://www.fhir.laziocrea.it`

Nella guida i link cliccabili puntano al progetto Simplifier.
