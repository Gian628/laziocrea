# LcCup — Agende CUP Lazio

Profili FHIR R4 per agende, slot e prenotazioni del CUP Regione Lazio (Lazio Crea), con estensioni per l’integrazione verso la telemedicina IRT.

- Package: `it.laziocrea.lccup`
- Canonical: `https://www.fhir.laziocrea.it`
- Progetto Simplifier: [LazioCrea](https://simplifier.net/LazioCrea)
- Guida: `guides/ImplementationGuideFHIRAgendeCUPLazio/` (id `ig-fhir-agende-cup-lazio`)

## Struttura

```
input/fsh/          sorgenti FSH
fsh-generated/      JSON generati da SUSHI (vanno committati)
guides/             guida pubblicata su Simplifier
sushi-config.yaml   configurazione SUSHI
ig.ini              solo per IG Publisher in locale (opzionale)
```

La documentazione online è in `guides/`, non in `input/pagecontent/`. Quella cartella (e `menu.xml`) servirebbero solo se si volesse generare un sito HTML con IG Publisher (`publisher.jar` → cartella `output/`). Al momento non la usiamo.

## Compilazione locale

```bash
npm install -g fsh-sushi
sushi .
```

Output in `fsh-generated/resources/`.

## GitHub Actions

Workflow: `.github/workflows/sushi.yml`

Al momento è configurato solo con `workflow_dispatch` (avvio manuale da tab Actions). Se si riattivano i trigger su `push`, il job esegue `sushi .` e, su `main`/`release`, può committare i JSON aggiornati con `github-actions[bot]`. Un commit automatico viene creato solo se `fsh-generated/` cambia davvero.

Per la scrittura sul repo servono i permessi *Read and write* in Settings → Actions → Workflow permissions.

## Simplifier

Dopo il push: Reimport dal webhook (o manuale). La prima volta aprire `guides/ImplementationGuideFHIRAgendeCUPLazio/guide.yaml` e usare *Update → Edit: Create IG and start updating in IG Editor*.

URL guida (indicativo): `https://simplifier.net/guide/ig-fhir-agende-cup-lazio/home?version=current`

Nei file `.page.md` i widget usano lo slug progetto `LazioCrea`, ad es. `{{tree:LazioCrea/lccup-schedule}}`.

## Profili

| Nome | Risorsa |
|------|---------|
| LcCup-Schedule | Schedule |
| LcCup-Slot | Slot |
| LcCup-Appointment | Appointment |
| LcCup-ServiceRequest | ServiceRequest |

## Estensioni principali

`lccup-tipo-agenda`, `lccup-modalita-erogazione`, `lccup-codice-prenotazione`, `lccup-canale-prenotazione`, `lccup-classe-priorita`, `lccup-link-teleconsulto`

## .gitignore

Non ignorare `fsh-generated/`, `guides/` o `input/fsh/`. Sono ignorati output e cache del Publisher (`output/`, `input-cache/`, ecc.).
