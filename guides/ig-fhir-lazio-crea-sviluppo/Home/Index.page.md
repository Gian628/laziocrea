# {{page-title}}

<div class="alert alert-warning">
Questa pagina è da considerare <b>IN LAVORAZIONE</b>.

Il contenuto del sito rappresenterà a regime la Guida di Implementazione FHIR LcCup per il **CUP Regionale Lazio**.

Attualmente viene descritta una panoramica del progetto \[si veda {{pagelink:Home/Contesto/Panoramica-di-progetto.page.md}}\],
ed è possibile consultare le risorse FHIR rilasciate e attualmente in uso.
</div>

<div class="alert alert-danger">
Questa guida di implementazione fa riferimento all'ambiente di <b>sviluppo</b>, di conseguenza le risorse potrebbero essere soggette a revisione e modifiche.
</div>

## Novità

- Profili **LcCup** (Schedule, Slot, Appointment, ServiceRequest, CareTeam, HealthcareService, Organization)
- Estensioni CUP e metadati IRT (`modalita-erogazione`, `time-quantum`, …)
- FHIR **R5** — teleconsulto con `virtualService` e equipe (`CareTeam`)

## Come leggere questa guida

Questa guida presenta diverse sezioni elencate nella barra dei menù in alto.

- **Home**: la presente pagina, pagina iniziale della Implementation Guide.
- **Contesto**: panoramica del progetto e modello delle relazioni tra risorse.
- **Profili ed Estensioni**: libreria profili LcCup ed estensioni.
- **Terminologia**: ValueSet e CodeSystem del CUP Regionale Lazio.
- **API**: esempi di ricerca FHIR (agende, slot, prenotazioni).
- **Scenari**: flussi operativi del CUP e integrazione con IRT.
- **Esempi**: libreria completa degli esempi FHIR.

## Risorse modellate

<fql>
from StructureDefinition
where kind = 'resource' and derivation = 'constraint'
select name, title, description
order by name
</fql>
