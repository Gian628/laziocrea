# {{page-title}}

## Il modello concettuale

Il ciclo di prenotazione del **CUP Lazio** (Lazio Crea) usa quattro profili **LcCup**.
Le prenotazioni con teleconsulto vengono inviate alla **Telemedicina nazionale IRT**.

### 1. LcCup-Schedule → l'Agenda

Ogni ambulatorio espone una o più **agende** (`LcCup-Schedule`):

- `actor`: HealthcareService, Location, Practitioner
- `lccup-tipo-agenda`: SSN, ALPI, Privata, Convenzionata
- `lccup-modalita-erogazione`: in presenza o teleconsulto (integrazione IRT)

### 2. LcCup-Slot → la Fascia Oraria

Fasce orarie (`LcCup-Slot`) dentro un'agenda:

- `free` → prenotabile
- `busy` → occupato da un Appointment
- `busy-unavailable` / `busy-tentative`

### 3. LcCup-ServiceRequest → l'Impegnativa

Impegnativa SSN con NRE, codice prestazione, classe priorità U/B/D/P.

### 4. LcCup-Appointment → la Prenotazione

Collega slot, impegnativa, partecipanti ed estensioni LcCup:

- `lccup-codice-prenotazione` — codice CUP al paziente
- `lccup-canale-prenotazione` — sportello, web, telemedicina...
- `lccup-modalita-erogazione` — presenza o teleconsulto
- `lccup-link-teleconsulto` — URL IRT (se teleconsulto)

## Diagramma

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
LcCup-Schedule (agenda CUP Lazio)
        │
        │ actor
        ▼
HealthcareService + Location + Practitioner
```

## Ciclo di vita dell'Appointment

```
proposed → booked → fulfilled
              ↓
         cancelled / noshow
```

## Flusso CUP Lazio Crea → IRT

```
Prenotazione LcCup-Appointment (booked)
        ↓
Lazio Crea verifica lccup-modalita-erogazione = TELECONSULTO
        ↓
Invio a Telemedicina nazionale IRT
        ↓
Aggiornamento con lccup-link-teleconsulto
        ↓
Notifica al paziente
```
