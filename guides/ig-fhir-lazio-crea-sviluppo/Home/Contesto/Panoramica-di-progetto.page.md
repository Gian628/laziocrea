# {{page-title}}

## Chi è Lazio Crea

**Lazio Crea** è l'Azienda dei Servizi Regionali in Sanità del Lazio (ASR).
Gestisce, tra gli altri servizi, il **Centro Unico di Prenotazione (CUP)** regionale.

## Perché i profili LcCup

I profili **LcCup** sono stati definiti per il contesto specifico del **CUP Lazio**, con l'obiettivo di:

1. **Gestire le agende** degli ambulatori e servizi prenotabili nel Lazio
2. **Integrarsi con la Telemedicina nazionale IRT**, inviando prenotazioni e agende per prestazioni erogabili a distanza
3. **Garantire interoperabilità** con la PNLA e gli standard FHIR R4

## Ambito tecnico

| Fase | Risorsa LcCup | Descrizione |
|---|---|---|
| Prescrizione | LcCup-ServiceRequest | Impegnativa SSN (NRE, priorità U/B/D/P) |
| Offerta | LcCup-Schedule + LcCup-Slot | Agenda e fasce orarie CUP Lazio |
| Prenotazione | LcCup-Appointment | Prenotazione con codice CUP e canale |
| Teleconsulto | estensioni LcCup | `lccup-modalita-erogazione`, `lccup-link-teleconsulto` |

## Standard di riferimento

- HL7 FHIR R4 (4.0.1)
- PNLA — Piattaforma Nazionale Liste di Attesa (L.107/2024)
- Normativa classi di priorità **U / B / D / P**

## Pubblico di riferimento

- Sviluppatori sistemi CUP Lazio Crea
- Integratori piattaforma IRT
- Referenti clinico-organizzativi Regione Lazio

## Stato

Guida in stato **draft** (versione `0.3.0`). Risorse soggette a revisione.

**URL canonica:** `https://www.fhir.laziocrea.it`
