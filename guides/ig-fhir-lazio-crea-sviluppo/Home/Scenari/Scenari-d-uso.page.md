# Scenari d'uso

Flussi principali del **CUP Regionale Lazio** e integrazione con **IRT**.

## Scenario 1 — Prenotazione SSN con impegnativa

Flusso tipico: il MMG emette l'impegnativa, l'assistito prenota al CUP.

```
MMG emette impegnativa (ServiceRequest)
        ↓
Assistito contatta il CUP Regionale Lazio (sportello / telefono / web)
        ↓
CUP cerca slot liberi → Schedule → Slot[status=free]
        ↓
CUP crea Appointment collegato a Slot e ServiceRequest
        ↓
Slot.status diventa busy
        ↓
Assistito riceve codice prenotazione
```

### Istanze di esempio

**Impegnativa SSN:**
{{json:LazioCrea/esempio-impegnativa-ssn}}

**Prenotazione:**
{{json:LazioCrea/esempio-prenotazione-visita}}

---

## Scenario 2 — Teleconsulto con IRT

1. Slot liberi sull'agenda equipe (`actor` = CareTeam); `Slot.serviceType` → HealthcareService piattaforma (`PIATTAFORMA_TELEVISITA`).
2. Prenotazione con `modalita-erogazione = TELE_CONSULTO` sull'**Appointment**.
3. Sessione video in **`virtualService`** (R5).
4. Metadati IRT come estensioni (`event-status`, `pathology`, …).

{{json:LazioCrea/esempio-prenotazione-teleconsulto}}

---

## Scenario 3 — Agende teleconsulto verso IRT

Il CUP Regionale Lazio espone le agende teleconsulto (`LcCup-Schedule` + `LcCup-Slot`) affinché IRT conosca la disponibilità.

La direzione dello scambio (invio dal CUP o richiesta da IRT) è in fase di definizione; le risorse FHIR restano le stesse.

{{json:LazioCrea/esempio-agenda-teleconsulto}}

---

## Scenario 4 — Disdetta

```
Appointment.status: booked → cancelled
Slot.status: busy → free   (slot torna disponibile)
```

---

## Scenario 5 — Mancata presentazione (No-show)

```
Appointment.status: booked → noshow
```

I no-show vengono tracciati per il monitoraggio delle liste d'attesa (PNLA).
