# LcCup — Agende CUP Lazio (Lazio Crea) → Telemedicina IRT

Implementation Guide FHIR R4 dei profili **LcCup** per il **CUP Regione Lazio**,
sviluppata da **Lazio Crea** (Azienda dei Servizi Regionali in Sanità del Lazio).

I profili sono pensati per gestire agende e prenotazioni del CUP Lazio e per
integrarsi con la **Telemedicina nazionale IRT**.

**URL canonica:** `https://www.fhir.laziocrea.it`

---

## Gli strumenti: chi fa cosa

Nel mondo FHIR ci sono **quattro pezzi** che spesso si confondono. Nel nostro progetto non tutti sono attivi.

```
  input/fsh/*.fsh                    guides/**/*.page.md
        │                                    │
        ▼                                    │
     SUSHI (sushi .)                         │  (testi guida, non compilati)
        │                                    │
        ▼                                    ▼
  fsh-generated/*.json  ──────────►  Simplifier.net  ← percorso che usiamo
        │
        │  (solo se usate IG Publisher in locale)
        ▼
  publisher.jar  +  ig.ini  +  pagecontent/
        │
        ▼
  output/index.html  ← sito HL7 “classico” (opzionale)
```

| Strumento | Cosa fa | Lo usiamo? |
|---|---|---|
| **SUSHI** | Compila FSH → JSON FHIR in `fsh-generated/` | ✅ sempre |
| **GitHub Actions** (`sushi.yml`) | Esegue SUSHI su ogni push e, su `main`/`release`, committa i JSON se cambiati | ✅ sì |
| **Simplifier** | Mostra profili + guida online da `guides/` e `fsh-generated/` | ✅ sì (guida ufficiale) |
| **IG Publisher** (`publisher.jar`) | Genera un sito HTML statico in `output/` | ❌ no (opzionale, solo locale) |

---

## Due percorsi per la documentazione

| | **Simplifier** (attivo) | **IG Publisher** (opzionale) |
|---|---|---|
| **Cartella testi** | `guides/ImplementationGuideFHIRAgendeCUPLazio/` | `input/pagecontent/` |
| **Menu / indice** | `guide.yaml` + `toc.yaml` | `input/includes/menu.xml` |
| **Config build** | — | `ig.ini` |
| **Comando** | Push su GitHub → Simplifier sincronizza | `java -jar publisher.jar -ig .` |
| **Risultato** | Guida su simplifier.net con widget `{{tree:...}}` | Cartella `output/` con HTML da aprire in browser |

**Importante:** `guides/` e `pagecontent/` sono **due sistemi diversi**. Non si sostituiscono. Nel repo oggi c’è solo `guides/`; `pagecontent/` non c’è perché la guida la pubblichiamo su Simplifier.

---

## A cosa servono `ig.ini`, `pagecontent/` e `publisher.jar`

### `ig.ini`

File di configurazione **solo per IG Publisher**. Dice al Publisher:

- quale `ImplementationGuide-*.json` usare come radice (nel nostro caso quello generato da SUSHI in `fsh-generated/`)
- quale template HTML HL7 applicare

```ini
[IG]
ig = fsh-generated/resources/ImplementationGuide-it.laziocrea.lccup.json
template = hl7.fhir.template#current
```

**Simplifier non legge `ig.ini`.** Resta nel repo per compatibilità e per chi volesse un giorno generare il sito HL7 in locale.

### `input/pagecontent/`

Cartella di **pagine Markdown per IG Publisher** (es. `index.md`, `contesto.md`). Il Publisher le converte in HTML e le mette nel menu insieme alle pagine auto-generate dei profili.

- Formato: Markdown semplice + link `.html`
- **Non** supporta i widget Simplifier (`{{tree:...}}`, FQL, tab custom)
- **Non presente** in questo repo: non ci serve finché pubblichiamo solo su Simplifier

### `publisher.jar`

È il **compilatore del sito HL7** (IG Publisher ufficiale). In locale:

```bash
sushi .                              # 1. FSH → JSON
java -jar publisher.jar -ig .        # 2. JSON + pagecontent → output/
# Risultato: output/index.html
```

Richiede Java e il JAR scaricato da HL7. **Non gira** nel nostro workflow GitHub: l’Action esegue solo SUSHI.

---

## Struttura del progetto

```
laziocrea/
├── input/fsh/              ← Sorgenti FSH (profili, estensioni, esempi)
├── guides/                 ← Guida Simplifier (NON per IG Publisher)
│   └── ImplementationGuideFHIRAgendeCUPLazio/
│       ├── guide.yaml      (id: ig-fhir-agende-cup-lazio)
│       ├── toc.yaml
│       ├── styles/LcCup-css/
│       └── Home/           ← pagine .page.md
├── fsh-generated/          ← JSON FHIR (output SUSHI)
├── sushi-config.yaml       ← metadati IG + gruppi risorse (per SUSHI)
├── ig.ini                  ← config IG Publisher (opzionale, non usato da Simplifier)
└── .github/workflows/sushi.yml  ← automazione: solo SUSHI, non Publisher
```

---

## Workflow quotidiano (cosa fate voi)

```
1. Modificate input/fsh/*.fsh  e/o  guides/**/*.page.md
2. git commit + git push
3. GitHub Actions compila FSH con SUSHI
4. Simplifier riceve il webhook e aggiorna profili + guida
```

---

## Script automatico GitHub Actions — spiegazione semplice

Il file `.github/workflows/sushi.yml` **non è Simplifier** e **non è IG Publisher**.
È uno script che gira sui server GitHub ogni volta che qualcuno fa push.

### Cosa fa (e cosa no)

| Fa | Non fa |
|---|---|
| Esegue `sushi .` | Non esegue `publisher.jar` |
| Rigenera `fsh-generated/*.json` | Non tocca `guides/` |
| Su `main`/`release`, committa i JSON se cambiati | Non pubblica da solo su Simplifier (serve webhook già configurato) |

### Quando parte

- **Push** su `main`, `develop`, `release`
- **Pull request** verso `main` o `release` (solo verifica SUSHI, senza commit)

### Il commit automatico: quando succede?

```
Voi pushate su main
        │
        ▼
GitHub Actions: sushi .
        │
        ├── JSON uguali a prima?  → fine, nessun commit nuovo
        │
        └── JSON diversi?  → github-actions[bot] crea UN commit:
                             "chore: rigenera FHIR JSON da FSH [skip ci]"
                             e fa push
```

| Push su… | SUSHI gira? | Commit automatico? |
|---|---|---|
| `feature/...`, `develop` | ✅ | ❌ |
| `main` / `release`, FSH invariato | ✅ | ❌ |
| `main` / `release`, FSH modificato | ✅ | ✅ (solo se JSON cambiano) |

Il tag `[skip ci]` nel messaggio del bot **evita il loop**: il push del bot non rilancia il workflow.

**In pratica:** non avrete un commit nuovo a ogni push, ma solo quando modificate FSH e SUSHI produce JSON diversi (su `main` o `release`).

### Errore 403 sul push del bot

Il token di GitHub Actions non ha permesso di scrivere sul repo.

**Repo → Settings → Actions → General → Workflow permissions → Read and write permissions**

Se `main` è protetto, consentire push a **GitHub Actions** / `github-actions[bot]`.

---

## Simplifier — collegamento GitHub

Simplifier legge il repo (webhook o Reimport). Non usa `ig.ini` né `publisher.jar`.

### Prima attivazione guida

1. Push con `guides/` + `fsh-generated/`
2. Simplifier → **Reimport**
3. File manager → `guides/ImplementationGuideFHIRAgendeCUPLazio/guide.yaml`
4. **Update → Edit: Create IG and start updating in IG Editor** (una tantum)
5. Tab **Guides** → guida visibile

### Se 403 su Simplifier

GitHub → **Settings → Integrations → GitHub Apps** → app Simplifier → **Configure** → dare accesso al repo `laziocrea`.

---

## Profili LcCup

| Profilo | Risorsa | Descrizione |
|---|---|---|
| LcCup-Schedule | Schedule | Agenda CUP Lazio |
| LcCup-Slot | Slot | Fascia oraria |
| LcCup-Appointment | Appointment | Prenotazione → IRT se teleconsulto |
| LcCup-ServiceRequest | ServiceRequest | Impegnativa SSN |

## Estensioni LcCup

| Id | Descrizione |
|---|---|
| lccup-tipo-agenda | SSN / ALPI / Privata / Convenzionata |
| lccup-modalita-erogazione | In presenza / Teleconsulto / Telemonitoraggio |
| lccup-codice-prenotazione | Codice CUP al paziente |
| lccup-canale-prenotazione | Sportello / Web / Telemedicina... |
| lccup-classe-priorita | U / B / D / P |
| lccup-link-teleconsulto | URL sessione IRT |
