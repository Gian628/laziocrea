# {{page-title}}

## Il modello concettuale

Quattro profili **LcCup** coprono il ciclo di prenotazione del CUP Regionale Lazio.
Per le prestazioni a distanza, `LcCup-Appointment` e le relative estensioni consentono l’integrazione con **IRT**.

### 1. LcCup-Schedule → l'agenda

Ogni ambulatorio o servizio espone una o più **agende** (`LcCup-Schedule`):

- `actor`: HealthcareService, Location e/o Practitioner
- `lccup-tipo-agenda`: SSN, ALPI, Privata, Convenzionata
- `lccup-modalita-erogazione`: in presenza o teleconsulto (per l'integrazione con IRT)

### 2. LcCup-Slot → la fascia oraria

Fasce orarie (`LcCup-Slot`) dentro un'agenda:

- `free` → prenotabile
- `busy` → occupato da un Appointment
- `busy-unavailable` / `busy-tentative`

La modalità tele/presenza è definita a livello di agenda (e confermata sulla prenotazione), non sul singolo slot.

### 3. LcCup-ServiceRequest → l'impegnativa

Impegnativa SSN con NRE, codice prestazione, classe priorità U/B/D/P.

### 4. LcCup-Appointment → la prenotazione

Collega slot, impegnativa, partecipanti ed estensioni LcCup:

- `lccup-codice-prenotazione` — codice consegnato all'assistito
- `lccup-canale-prenotazione` — sportello, web, telefono...
- `lccup-modalita-erogazione` — presenza o teleconsulto
- `lccup-link-teleconsulto` — URL sessione IRT (se teleconsulto)

## Diagramma risorse

```
LcCup-ServiceRequest (impegnativa)
        │
        │ basedOn
        ▼
LcCup-Appointment (prenotazione) ─── lccup-link-teleconsulto ──► IRT
        │
        │ slot
        ▼
LcCup-Slot (fascia oraria)
        │
        │ schedule
        ▼
LcCup-Schedule (agenda CUP Regionale Lazio)
        │
        │ actor
        ▼
HealthcareService + Location (+ Practitioner opzionale)
```

## Ciclo di vita dell'Appointment

```
proposed → booked → fulfilled
              ↓
         cancelled / noshow
```

## Flussi verso IRT

### Pubblicazione agende (da definire: push o pull)

Il CUP Regionale Lazio rende disponibili ad IRT le agende teleconsulto (`LcCup-Schedule` + `LcCup-Slot`).

```
CUP Regionale Lazio                    IRT
        │                               │
        │  Schedule + Slot (TELECONSULTO) │
        ├──────────────────────────────►│   oppure
        │◄──────────────────────────────┤   IRT richiede le agende
        │                               │
```

### Prenotazione teleconsulto

```
Prenotazione LcCup-Appointment (booked, TELECONSULTO)
        ↓
Scambio con IRT (contenuto: Appointment)
        ↓
Aggiornamento con lccup-link-teleconsulto
        ↓
Notifica all'assistito
```
