# {{page-title}}

<div class="alert alert-warning">
Questa pagina è da considerare <b>IN LAVORAZIONE</b>.

Il contenuto del sito rappresenterà a regime la Guida di Implementazione FHIR LcCup per il CUP della Regione Lazio (Lazio Crea).

Attualmente viene descritta una panoramica del progetto \[si veda {{pagelink:Home/Contesto/Panoramica-di-progetto.page.md}}\],
ed è possibile consultare le risorse FHIR rilasciate e attualmente in uso.
</div>

<div class="alert alert-danger">
Questa guida di implementazione fa riferimento all'ambiente di <b>sviluppo</b>, di conseguenza le risorse potrebbero essere soggette a revisione e modifiche.
</div>

## Novità

- Profili **LcCup** per Schedule, Slot, Appointment, ServiceRequest
- Estensioni per teleconsulto IRT (`lccup-modalita-erogazione`, `lccup-link-teleconsulto`)
- Esempi prenotazione in presenza e teleconsulto

## Come leggere questa guida

Questa guida presenta diverse sezioni elencate nella barra dei menù in alto.

- **Home**: la presente pagina, pagina iniziale della Implementation Guide.
- **Contesto**: panoramica del progetto e modello delle relazioni tra risorse.
- **Profili ed Estensioni**: libreria profili LcCup ed estensioni.
- **Terminologia**: ValueSet e CodeSystem del CUP Lazio.
- **Scenari**: flussi operativi CUP e integrazione IRT.
- **Esempi**: libreria completa degli esempi FHIR.

## Risorse modellate

<fql>
from StructureDefinition
where kind = 'resource' and derivation = 'constraint'
select name, title, description
order by name
</fql>
