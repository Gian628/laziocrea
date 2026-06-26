# Libreria Estensioni LcCup

Estensioni definite per il CUP Lazio e l'integrazione con la Telemedicina nazionale IRT.

## Tutte le estensioni

<fql>
from StructureDefinition
where type = 'Extension' and derivation = 'constraint'
select name, title, description, url
order by name
</fql>

## Estensioni principali

| Id | Descrizione |
|---|---|
| lccup-tipo-agenda | SSN / ALPI / Privata / Convenzionata |
| lccup-modalita-erogazione | In presenza / Teleconsulto / Telemonitoraggio |
| lccup-codice-prenotazione | Codice CUP al paziente |
| lccup-canale-prenotazione | Sportello / Web / Telemedicina... |
| lccup-classe-priorita | U / B / D / P |
| lccup-link-teleconsulto | URL sessione IRT |
