# Scenari d'uso CUP

Esempi concreti dei principali flussi di prenotazione CUP Lazio e integrazione IRT.

## Scenario 1 — Prenotazione SSN con impegnativa

Flusso tipico: il MMG emette l'impegnativa, l'assistito prenota al CUP.

```
MMG emette impegnativa (ServiceRequest)
        ↓
Assistito contatta CUP (sportello / telefono / web)
        ↓
CUP cerca slot liberi → Schedule → Slot[status=free]
        ↓
CUP crea Appointment collegato a Slot e ServiceRequest
        ↓
Slot.status diventa busy
        ↓
Assistito riceve codice prenotazione CUP
```

### Istanze di esempio

**Impegnativa SSN:**
{{json:LazioCrea/esempio-impegnativa-ssn}}

**Prenotazione:**
{{json:LazioCrea/esempio-prenotazione-visita}}

---

## Scenario 2 — Teleconsulto → invio a IRT

1. Prenotazione su agenda con `lccup-modalita-erogazione = TELECONSULTO`.
2. Lazio Crea invia `LcCup-Appointment` a IRT.
3. IRT restituisce URL sessione → `lccup-link-teleconsulto`.
4. Notifica al paziente con link video.

{{json:LazioCrea/esempio-prenotazione-teleconsulto}}

---

## Scenario 3 — Pubblicazione agende verso IRT

Lazio Crea espone le agende teleconsulto (`LcCup-Schedule` + `LcCup-Slot`)
per consentire a IRT di conoscere la disponibilità e ricevere le prenotazioni.

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
