# {{page-title}}

## Contesto

Questa Implementation Guide si configura nel **contesto sanitario regionale del Lazio**.

I profili **LcCup** descrivono agende, disponibilità e prenotazioni del **CUP Regionale Lazio**, con estensioni per l'integrazione verso **IRT** (telemedicina regionale).

La guida è curata da **Lazio Crea**, ASR.

## Cosa modellano i profili LcCup

1. **Agende e fasce orarie** (`LcCup-Schedule`, `LcCup-Slot`)
2. **Impegnative e prenotazioni** (`LcCup-ServiceRequest`, `LcCup-Appointment`)
3. **Equipe e servizi** (`LcCup-CareTeam`, `LcCup-HealthcareService`, `LcCup-Organization`)
4. **Teleconsulto** — `modalita-erogazione`, `virtualService`, estensioni metadati IRT

## Ambito tecnico

| Fase | Risorsa LcCup | Descrizione |
|---|---|---|
| Prescrizione | LcCup-ServiceRequest | Impegnativa SSN |
| Offerta | LcCup-Schedule + LcCup-Slot | Agenda e fasce orarie |
| Prenotazione | LcCup-Appointment | Prenotazione con codice CUP |
| Teleconsulto | virtualService + CareTeam | Sessione video ed equipe |

## Standard di riferimento

- HL7 FHIR **R5** (5.0.0)
- PNLA — classi priorità **U / B / D / P**

## Stato

Guida in **draft**, versione `0.1.0`.

**URL canonica:** `https://www.fhir.laziocrea.it`
