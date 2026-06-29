# LcCup — Agende CUP Lazio

Profili FHIR R4 per agende, slot e prenotazioni del CUP Regionale Lazio, con estensioni per l’integrazione verso **IRT**.

- **Canonical:** `https://www.fhir.laziocrea.it`
- **Package:** `lazio.crea.cup.irt` — [0.0.1 su Simplifier](https://simplifier.net/packages/lazio.crea.cup.irt/0.0.1)
- **Progetto:** [LazioCrea](https://simplifier.net/LazioCrea)
- **Guida:** `guides/ig-fhir-lazio-crea-sviluppo/`

## Come lavoriamo

Sorgenti in **FSH**, compilazione con **SUSHI** (`sushi .`), pubblicazione su **Simplifier** (package e guida web).

## Struttura

```
input/fsh/          sorgenti FSH
fsh-generated/      output SUSHI (committare)
guides/             guida Simplifier
sushi-config.yaml
package.json
```

## Compilazione

```bash
npm install -g fsh-sushi
sushi .
```

## Versioni

Prima di una release su Simplifier: aggiornare `version` in `sushi-config.yaml`, `package.json` e `guide.yaml`, poi `sushi .`, push e Reimport.

## Profili

LcCup-Schedule, LcCup-Slot, LcCup-Appointment, LcCup-ServiceRequest

## Estensioni

`lccup-tipo-agenda`, `lccup-modalita-erogazione`, `lccup-codice-prenotazione`, `lccup-canale-prenotazione`, `lccup-classe-priorita`, `lccup-link-teleconsulto`
