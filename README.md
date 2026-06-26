# LcCup — Agende CUP Lazio

Profili FHIR R4 per agende, slot e prenotazioni del CUP Regione Lazio (Lazio Crea), con estensioni per l’integrazione verso la telemedicina IRT.

- Package: `it.laziocrea.lccup`
- Canonical: `https://www.fhir.laziocrea.it`
- Progetto Simplifier: [LazioCrea](https://simplifier.net/LazioCrea)
- Guida: `guides/ImplementationGuideFHIRAgendeCUPLazio/` (id `ig-fhir-agende-cup-lazio`)

## Struttura

```
input/fsh/          sorgenti FSH
fsh-generated/      JSON generati da SUSHI (committare)
guides/             guida Simplifier (guide.yaml, *.page.md, toc.yaml)
sushi-config.yaml   configurazione SUSHI
```

## Compilazione locale

```bash
npm install -g fsh-sushi
sushi .
```

Output in `fsh-generated/resources/`.

## GitHub Actions

Workflow: `.github/workflows/sushi.yml` — al momento solo avvio manuale (`workflow_dispatch`).

Su `push` (se riattivato): esegue `sushi .` e può committare `fsh-generated/` su `main`/`release` quando i JSON cambiano. Permessi richiesti: *Read and write* in Settings → Actions.

## Simplifier

Push → Reimport. Prima attivazione: `guides/ImplementationGuideFHIRAgendeCUPLazio/guide.yaml` → *Update → Edit: Create IG and start updating in IG Editor*.

Widget nelle pagine: slug progetto `LazioCrea`, es. `{{tree:LazioCrea/lccup-schedule}}`.

## Profili

| Nome | Risorsa |
|------|---------|
| LcCup-Schedule | Schedule |
| LcCup-Slot | Slot |
| LcCup-Appointment | Appointment |
| LcCup-ServiceRequest | ServiceRequest |

## Estensioni

`lccup-tipo-agenda`, `lccup-modalita-erogazione`, `lccup-codice-prenotazione`, `lccup-canale-prenotazione`, `lccup-classe-priorita`, `lccup-link-teleconsulto`

## Git

Versionare: `input/fsh/`, `fsh-generated/`, `guides/`.
