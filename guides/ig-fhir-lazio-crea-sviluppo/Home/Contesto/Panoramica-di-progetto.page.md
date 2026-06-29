# {{page-title}}

## Contesto

Questa Implementation Guide si configura nel **contesto sanitario regionale del Lazio**.

I profili **LcCup** descrivono agende, disponibilità e prenotazioni del **CUP Regionale Lazio**, con estensioni per l’integrazione verso **IRT** (telemedicina regionale) nelle prestazioni erogabili a distanza.

La guida è curata da **Lazio Crea**, Azienda dei Servizi Regionali in Sanità del Lazio (ASR).

## Cosa modellano i profili LcCup

1. **Agende e fasce orarie** prenotabili (`LcCup-Schedule`, `LcCup-Slot`)
2. **Impegnative e prenotazioni** (`LcCup-ServiceRequest`, `LcCup-Appointment`)
3. **Modalità di erogazione** e **link alla sessione** per il teleconsulto (`lccup-modalita-erogazione`, `lccup-link-teleconsulto`)

## Integrazione con IRT

Per il teleconsulto, CUP e IRT si scambiano almeno l’offerta (`Schedule` / `Slot`) e la prenotazione (`Appointment`). La modalità tecnica dello scambio (invio o richiesta delle agende) è ancora in definizione.

## Ambito tecnico

| Fase | Risorsa LcCup | Descrizione |
|---|---|---|
| Prescrizione | LcCup-ServiceRequest | Impegnativa SSN (NRE, priorità U/B/D/P) |
| Offerta | LcCup-Schedule + LcCup-Slot | Agenda e fasce orarie |
| Prenotazione | LcCup-Appointment | Prenotazione con codice CUP, canale e modalità |
| Teleconsulto | estensioni LcCup | Modalità erogazione e link sessione IRT |

## Standard di riferimento

- HL7 FHIR R4 (4.0.1)
- PNLA — Piattaforma Nazionale Liste di Attesa (L.107/2024)
- Normativa classi di priorità **U / B / D / P**

## Stato

Guida in **draft**, versione `0.0.2`.

**URL canonica:** `https://www.fhir.laziocrea.it`
