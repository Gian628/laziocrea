# {{page-title}}

Esempi di **ricerca FHIR R5** sul server del CUP Regionale Lazio. Sostituire `{fhir-base}` con l’URL base dell’ambiente (sviluppo/produzione).

Le risposte devono rispettare i profili **LcCup** (`Schedule`, `Slot`, `Appointment`).

## Header consigliati

```
Accept: application/fhir+json
```

Per limitare ai profili LcCup (se supportato dal server):

```
GET {fhir-base}/Schedule?_profile=https://www.fhir.laziocrea.it/StructureDefinition/lccup-schedule
```

---

## Schedule (agende)

### Agende di una struttura

Per `actor` usare la `Location`, l’`Organization` o l’`HealthcareService` dell’ambulatorio.

```
GET {fhir-base}/Schedule?actor=Location/{id}&active=true
```

### Agende per specialità (es. cardiologia)

Codice SNOMED specialità `394579002` (Cardiologia), come negli esempi LcCup.

```
GET {fhir-base}/Schedule?specialty=http://snomed.info/sct|394579002&active=true
```

### Agende per tipo prestazione

```
GET {fhir-base}/Schedule?service-type=http://snomed.info/sct|408471009&active=true
```

Combinazione specialità + prestazione:

```
GET {fhir-base}/Schedule?specialty=http://snomed.info/sct|394579002&service-type=http://snomed.info/sct|408471009&active=true
```

### Agenda per identificatore CUP

```
GET {fhir-base}/Schedule?identifier=https://cup.regione.lazio.it/agende|AGN-LAZIO-CARDIO-001
```

### Singola agenda

```
GET {fhir-base}/Schedule/{id}
```

---

## Slot (disponibilità)

### Slot liberi in un intervallo di date

```
GET {fhir-base}/Slot?status=free&start=ge2025-04-01T00:00:00+02:00&start=le2025-04-30T23:59:59+02:00
```

### Slot liberi di un’agenda

```
GET {fhir-base}/Slot?schedule=Schedule/{id}&status=free
```

Agenda + intervallo:

```
GET {fhir-base}/Slot?schedule=Schedule/{id}&status=free&start=ge2025-04-15T00:00:00+02:00&start=le2025-04-15T23:59:59+02:00
```

### Slot per cardiologia in un giorno

Due passi tipici: cercare le agende, poi gli slot.

```
GET {fhir-base}/Schedule?specialty=http://snomed.info/sct|394579002&active=true
```

```
GET {fhir-base}/Slot?schedule=Schedule/{id-agenda}&status=free&start=ge2025-04-15T00:00:00+02:00&start=le2025-04-15T23:59:59+02:00
```

### Singolo slot

```
GET {fhir-base}/Slot/{id}
```

---

## Appointment (prenotazioni)

### Prenotazione per codice CUP

Se esposto come search parameter su `identifier`:

```
GET {fhir-base}/Appointment?identifier=https://cup.regione.lazio.it/prenotazioni|PRN-2025-00123456
```

### Prenotazioni in un periodo

```
GET {fhir-base}/Appointment?date=ge2025-04-15T00:00:00+02:00&date=le2025-04-15T23:59:59+02:00&status=booked
```

---

## Teleconsulto (IRT)

La modalità (`modalita-erogazione`) è sull'**Appointment** (obbligatoria in prenotazione). Per le agende teleconsulto si deduce da `actor` CareTeam e da `Slot.serviceType` → HealthcareService con `type=PIATTAFORMA_TELEVISITA`.

Esempio agenda teleconsulto in guida: {{link:LazioCrea/esempio-agenda-teleconsulto}}

---

## Note

- I parametri effettivamente supportati dipendono dalla configurazione del server FHIR del CUP.
- Per la validazione delle risorse: operazione `$validate` (vedi sezione Validazione, in preparazione).
