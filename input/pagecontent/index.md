# Gestione Agende CUP Regione Lazio (Lazio Crea) → Telemedicina nazionale IRT

Questa **Implementation Guide (IG)** definisce i profili HL7 FHIR R4 per:

1. la gestione delle **agende del CUP Regione Lazio**, gestite da **Lazio Crea**
2. l'**invio delle prenotazioni** alla **Telemedicina nazionale IRT**

**URL canonica:** `https://www.fhir.laziocrea.it`

## Scopo

L'IG modella il ciclo completo di prenotazione ambulatoriale nel Lazio:
dall'impegnativa del medico, alla disponibilità dell'agenda CUP, fino alla prenotazione confermata all'assistito.

Quando la prestazione è erogabile a distanza, l'IG descrive come il CUP Lazio Crea instrada la prenotazione verso **IRT** (Infrastruttura di Rete per la Telemedicina), con:
- **modalità di erogazione** (in presenza, teleconsulto, telemonitoraggio)
- **link alla sessione** sulla piattaforma IRT
- **sede virtuale** (`Location` con tipo VR)

È allineata con la **PNLA** (Piattaforma Nazionale Liste di Attesa, L.107/2024).

## Risorse modellate

| Risorsa FHIR | Profilo | Cosa rappresenta |
|---|---|---|
| `Schedule` | IT-CUP-Schedule | L'**agenda** CUP (ambulatorio o teleconsulto IRT) |
| `Slot` | IT-CUP-Slot | La **fascia oraria** (libera o occupata) |
| `Appointment` | IT-CUP-Appointment | La **prenotazione** da inviare a IRT |
| `ServiceRequest` | IT-CUP-ServiceRequest | L'**impegnativa** SSN del medico prescrittore |

## Flusso CUP Lazio Crea → IRT

```
Prenotazione CUP (Appointment, status: booked)
        ↓
Lazio Crea verifica modalità = TELECONSULTO
        ↓
Invio prenotazione a Telemedicina nazionale IRT
        ↓
IRT crea sessione e restituisce link video
        ↓
Appointment aggiornato con ext-link-teleconsulto
        ↓
Notifica al paziente (SMS/email con link IRT)
```

## Relazioni tra risorse

```
ServiceRequest (impegnativa MMG)
        ↓ basedOn
Appointment (prenotazione CUP)
        ↓ slot
Slot (fascia oraria)
        ↓ schedule
Schedule (agenda CUP Regione Lazio)
        ↓ actor
HealthcareService + Location + Practitioner
```

## Autori

**Lazio Crea** — Regione Lazio.
