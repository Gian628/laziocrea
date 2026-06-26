// ============================================================
// VALUE SETS - Terminologie CUP Italia
// ============================================================

// ------------------------------------------------------------
// Tipo Agenda CUP
// Distingue tra agende SSN istituzionali, ALPI e private
// ------------------------------------------------------------
ValueSet: VsTipoAgendaCup
Id: vs-tipo-agenda-cup
Title: "Tipo Agenda CUP"
Description: "Classificazione del tipo di agenda gestita dal CUP"
* ^status = #draft
* ^experimental = true
* include codes from system CsTipoAgendaCup

CodeSystem: CsTipoAgendaCup
Id: cs-tipo-agenda-cup
Title: "Codici Tipo Agenda CUP"
* ^status = #draft
* ^experimental = true
* #SSN    "SSN Istituzionale"  "Agenda in regime del Servizio Sanitario Nazionale"
* #ALPI   "ALPI"               "Attività Libero-Professionale Intramuraria"
* #PRIV   "Privata"            "Agenda in regime privato"
* #CONV   "Convenzionata"      "Agenda presso struttura privata accreditata SSN"

// ------------------------------------------------------------
// Canale di Prenotazione
// Come è stata effettuata la prenotazione
// ------------------------------------------------------------
ValueSet: VsCanalePrenotazioneCup
Id: vs-canale-prenotazione-cup
Title: "Canale Prenotazione CUP"
Description: "Modalità attraverso cui è stata effettuata la prenotazione"
* ^status = #draft
* ^experimental = true
* include codes from system CsCanalePrenotazioneCup

CodeSystem: CsCanalePrenotazioneCup
Id: cs-canale-prenotazione-cup
Title: "Codici Canale Prenotazione CUP"
* ^status = #draft
* ^experimental = true
* #SPORTELLO  "Sportello CUP"    "Prenotazione effettuata allo sportello fisico"
* #TELEFONO   "Telefono"         "Prenotazione telefonica tramite call center CUP"
* #WEB        "Web/Portale"      "Prenotazione online tramite portale regionale o FSE"
* #APP        "App Mobile"       "Prenotazione tramite applicazione mobile"
* #FARMACIA   "Farmacia"         "Prenotazione tramite farmacia abilitata"
* #MMG        "MMG/PLS"          "Prenotazione diretta dal Medico di Medicina Generale"
* #TELEMEDICINA "Telemedicina"   "Prenotazione tramite Telemedicina nazionale IRT"

// ------------------------------------------------------------
// Modalità di Erogazione (CUP Lazio Crea → IRT)
// ------------------------------------------------------------
ValueSet: VsModalitaErogazione
Id: vs-modalita-erogazione
Title: "Modalità di Erogazione"
Description: "Come viene erogata la prestazione: in presenza o a distanza"
* ^status = #draft
* ^experimental = true
* include codes from system CsModalitaErogazione

CodeSystem: CsModalitaErogazione
Id: cs-modalita-erogazione
Title: "Codici Modalità di Erogazione"
* ^status = #draft
* ^experimental = true
* #IN_PRESENZA     "In presenza"      "Prestazione erogata presso la struttura sanitaria"
* #TELECONSULTO    "Teleconsulto"     "Visita a distanza tramite videochiamata"
* #TELEMONITORAGGIO "Telemonitoraggio" "Monitoraggio clinico a distanza del paziente"

// ------------------------------------------------------------
// Classe di Priorità CUP (D.M. Liste d'Attesa)
// Le 4 classi definite dalla normativa italiana
// ------------------------------------------------------------
ValueSet: VsClassePrioritaCup
Id: vs-classe-priorita-cup
Title: "Classe di Priorità CUP"
Description: """
  Classi di priorità per le prestazioni ambulatoriali, secondo la normativa
  italiana sulle liste d'attesa (DPCM 2017 e L.107/2024):
  - U: entro 72 ore
  - B: entro 10 giorni
  - D: entro 30 giorni (visite) / 60 giorni (accertamenti)
  - P: entro 120 giorni
"""
* ^status = #draft
* ^experimental = true
* include codes from system CsClassePrioritaCup

CodeSystem: CsClassePrioritaCup
Id: cs-classe-priorita-cup
Title: "Codici Classe Priorità CUP"
* ^status = #draft
* ^experimental = true
* #U  "Urgente"       "Da eseguire entro 72 ore"
* #B  "Breve"         "Da eseguire entro 10 giorni"
* #D  "Differibile"   "Da eseguire entro 30 gg (visita) o 60 gg (accertamento)"
* #P  "Programmabile" "Da eseguire entro 120 giorni"

// ------------------------------------------------------------
// Stato Slot CUP (subset di Slot.status con descrizioni IT)
// ------------------------------------------------------------
ValueSet: VsStatoSlotCup
Id: vs-stato-slot-cup
Title: "Stato Slot CUP"
Description: "Stati ammessi per uno slot nell'agenda CUP"
* ^status = #draft
* ^experimental = true
* http://terminology.hl7.org/CodeSystem/v2-0276#free       "Libero"
* http://terminology.hl7.org/CodeSystem/v2-0276#busy       "Occupato"
* http://terminology.hl7.org/CodeSystem/v2-0276#busy-unavailable "Non disponibile"
* http://terminology.hl7.org/CodeSystem/v2-0276#busy-tentative  "Prenotazione tentativa"
