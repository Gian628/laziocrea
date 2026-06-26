# Gestione Agende CUP Regione Lazio (Lazio Crea) → Telemedicina nazionale IRT

Implementation Guide FHIR R4 per la gestione delle agende del **CUP Regione Lazio** (Lazio Crea) e l'**invio delle prenotazioni alla Telemedicina nazionale IRT**.

**URL canonica:** `https://www.fhir.laziocrea.it`

## Struttura del progetto

```
laziocrea/
├── input/
│   ├── fsh/                        ← SORGENTE: editare questi file
│   │   ├── profiles/               ← Profili FHIR
│   │   ├── extensions/             ← Estensioni (CUP Lazio, IRT...)
│   │   ├── valuesets/              ← Code system e value set
│   │   └── examples/               ← Istanze di esempio
│   └── pagecontent/                ← Pagine Markdown dell'IG
├── fsh-generated/                  ← OUTPUT di SUSHI (rigenerato automaticamente)
├── sushi-config.yaml               ← Configurazione progetto
├── .github/workflows/sushi.yml     ← CI/CD su push
└── .gitignore
```

## Workflow di sviluppo

```
1. Editi i file .fsh in input/fsh/
2. sushi .
3. Verifichi output in fsh-generated/resources/
4. git push → GitHub Action rigenera e commita i JSON (su main o release)
5. Simplifier.net sincronizza via webhook dal branch collegato
```

## Compilazione locale

```bash
sushi .
# Output in: fsh-generated/resources/
```

## Collegamento Simplifier.net

Simplifier collega **un singolo branch** per progetto (`main`, `release`, ecc.).
Ogni push sul branch configurato aggiorna Simplifier via webhook.

| Branch | Uso |
|---|---|
| `develop` | Sviluppo: SUSHI compila ma non committa JSON |
| `release` | Staging: JSON committati, Simplifier per review |
| `main` | Produzione: JSON stabili |

## Risorse modellate

| Profilo | Risorsa base | Descrizione |
|---|---|---|
| IT-CUP-Schedule | Schedule | Agenda CUP (in presenza o teleconsulto IRT) |
| IT-CUP-Slot | Slot | Fascia oraria |
| IT-CUP-Appointment | Appointment | Prenotazione CUP da inviare a IRT |
| IT-CUP-ServiceRequest | ServiceRequest | Impegnativa SSN |

## Estensioni

| Estensione | Applicata a | Descrizione |
|---|---|---|
| ext-tipo-agenda | Schedule | SSN / ALPI / Privata / Convenzionata |
| ext-modalita-erogazione | Schedule, Appointment | In presenza / Teleconsulto / Telemonitoraggio |
| ext-codice-prenotazione | Appointment | Numero CUP consegnato all'utente |
| ext-canale-prenotazione | Appointment | Sportello / Telefono / Web / Telemedicina... |
| ext-classe-priorita-cup | Appointment, ServiceRequest | U / B / D / P |
| ext-link-teleconsulto | Appointment | URL sessione IRT |
