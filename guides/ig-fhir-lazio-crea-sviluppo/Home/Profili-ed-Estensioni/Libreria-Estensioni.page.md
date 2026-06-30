# Libreria Estensioni

Estensioni per il **CUP Regionale Lazio** e l'integrazione con **IRT**.

Gli id non usano il prefisso `lccup-` (namespace: `https://www.fhir.laziocrea.it/StructureDefinition/...`).

## Tutte le estensioni

<fql>
from StructureDefinition
where type = 'Extension' and derivation = 'constraint'
select name, title, description, url
order by name
</fql>

## CUP

| Id | Descrizione |
|---|---|
| tipo-agenda | SSN / ALPI / Privata / Convenzionata |
| modalita-erogazione | In presenza / Teleconsulto / Telemonitoraggio |
| codice-prenotazione | Codice CUP al paziente |
| canale-prenotazione | Sportello / Web / Telemedicina... |
| classe-priorita | U / B / D / P |

## IRT (da metadati fornitore)

| Id | Descrizione |
|---|---|
| time-quantum | Durata slot in minuti |
| created-by | Creatore agenda |
| managing-organization | Struttura gestore agenda |
| visible / draft / slot-initialized | Stato agenda |
| selectable / allows-enrollment | Flag struttura |
| appointment-organization | Struttura su appuntamento |
| pathology | Riferimento patologia/quesito |
| event-status | Stato workflow evento (ex eventColor) |
| documents-deleted | Documenti eliminati |

## Sessione video

In R5 si usa l'elemento standard **`Appointment.virtualService`** (non un'estensione).
