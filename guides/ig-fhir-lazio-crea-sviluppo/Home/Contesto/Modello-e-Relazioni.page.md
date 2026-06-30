# {{page-title}}

## Il modello concettuale

Sette profili **LcCup** coprono prenotazione CUP e integrazione IRT.

### LcCup-Schedule

- `actor`: **CareTeam** (teleconsulto) oppure Location / Practitioner (presenza)
- Estensioni: `tipo-agenda`, `modalita-erogazione`, `time-quantum`, `created-by`, …

### LcCup-Slot

- `serviceType` come **CodeableReference** (HealthcareService o concept SNOMED)

### LcCup-Appointment

- `subject` + `participant` (paziente, **equipe** CareTeam, professionista opzionale)
- `supportingInformation` → prestazione clinica (teleconsulto)
- **`virtualService`** — sessione videocall (R5)
- Estensioni: `codice-prenotazione`, `event-status`, `pathology`, …

### LcCup-CareTeam / HealthcareService / Organization

Modellano equipe, piattaforma TELEVISIT e struttura STS (da esempi IRT).

## Diagramma teleconsulto

```
LcCup-Organization
        ▲
        │ managingOrganization
LcCup-CareTeam ◄──── actor ──── LcCup-Schedule ──── LcCup-Slot
        │                                              │
        │ participant[equipe]                          │
        ▼                                              ▼
LcCup-Appointment ── virtualService ──► sessione video
        │
        ├── supportingInformation → LcCup-HealthcareService (prestazione)
        └── basedOn → LcCup-ServiceRequest
```

## Ciclo di vita

```
proposed → booked → fulfilled
              ↓
         cancelled / noshow
```

Post-prenotazione: popolamento di `virtualService`, `event-status`, eventuale `participant[professionista]`.
