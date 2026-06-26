# Modello e Relazioni tra Risorse

## Il modello concettuale

Il ciclo di prenotazione del **CUP Regione Lazio** (Lazio Crea) coinvolge quattro risorse FHIR che si collegano in cascata.
Le prenotazioni con modalità teleconsulto vengono poi inviate alla **Telemedicina nazionale IRT**.

### 1. Schedule → l'Agenda

Ogni ambulatorio/servizio espone una o più **agende** (`Schedule`). Un'agenda è associata a:
- un `HealthcareService` (il servizio erogante, es. "Cardiologia Clinica")  
- una `Location` (la sede fisica, es. "Ambulatorio 3 - Padiglione A")
- opzionalmente un `Practitioner` (il professionista dedicato)

L'estensione `tipoAgenda` classifica l'agenda come SSN, ALPI, Privata o Convenzionata.

### 2. Slot → la Fascia Oraria

Ogni agenda contiene N **slot** (`Slot`), ciascuno con una durata precisa (es. 20 minuti).  
Ogni slot ha uno stato:
- `free` → prenotabile dal CUP
- `busy` → già occupato da un `Appointment`
- `busy-unavailable` → bloccato (medico assente, chiusura, ecc.)
- `busy-tentative` → prenotazione in corso di conferma

### 3. ServiceRequest → l'Impegnativa

Prima di prenotare in regime SSN, il paziente deve avere un'**impegnativa** (`ServiceRequest`) del proprio MMG o specialista. Contiene:
- il **codice prestazione** (nomenclatore nazionale/regionale)
- il **NRE** (Numero Ricetta Elettronica) come identificatore
- la **classe di priorità** U/B/D/P
- il medico prescrittore e il paziente

### 4. Appointment → la Prenotazione

La **prenotazione** (`Appointment`) collega tutto:
- riferisce lo **slot** prenotato
- riferisce l'**impegnativa** (`basedOn`)
- ha come partecipanti il **paziente**, il **professionista** e la **sede**
- porta le estensioni: codice CUP, canale di prenotazione, classe priorità, modalità erogazione
- se `modalità = TELECONSULTO`, viene inviata a IRT e arricchita con `ext-link-teleconsulto`

## Diagramma delle relazioni

{% include relazioni-diagramma.svg %}

## Ciclo di vita dell'Appointment

```
[proposta prenotazione]  →  status: proposed
        ↓
[prenotazione confermata]  →  status: booked
        ↓                            ↓
[prestazione erogata]        [disdetta]
status: fulfilled            status: cancelled
                                     ↓
                          [mancata presentazione]
                           status: noshow
```
