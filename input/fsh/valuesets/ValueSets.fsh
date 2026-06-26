// ============================================================
// VALUE SETS LcCup - Terminologie CUP Lazio (Lazio Crea)
// ============================================================

ValueSet: VsLcCupTipoAgenda
Id: lccup-vs-tipo-agenda
Title: "LcCup - Tipo Agenda"
Description: "Classificazione tipo agenda CUP Lazio"
* ^status = #draft
* ^experimental = true
* include codes from system CsLcCupTipoAgenda

CodeSystem: CsLcCupTipoAgenda
Id: lccup-cs-tipo-agenda
Title: "LcCup - Codici Tipo Agenda"
* ^status = #draft
* ^experimental = true
* #SSN    "SSN Istituzionale"  "Agenda in regime SSN"
* #ALPI   "ALPI"               "Attività Libero-Professionale Intramuraria"
* #PRIV   "Privata"            "Agenda in regime privato"
* #CONV   "Convenzionata"      "Agenda struttura privata accreditata SSN"

ValueSet: VsLcCupCanalePrenotazione
Id: lccup-vs-canale-prenotazione
Title: "LcCup - Canale Prenotazione"
Description: "Canali di prenotazione CUP Lazio"
* ^status = #draft
* ^experimental = true
* include codes from system CsLcCupCanalePrenotazione

CodeSystem: CsLcCupCanalePrenotazione
Id: lccup-cs-canale-prenotazione
Title: "LcCup - Codici Canale Prenotazione"
* ^status = #draft
* ^experimental = true
* #SPORTELLO    "Sportello CUP"    "Prenotazione allo sportello"
* #TELEFONO     "Telefono"         "Call center CUP Lazio"
* #WEB          "Web/Portale"      "Portale regionale o FSE"
* #APP          "App Mobile"       "Applicazione mobile"
* #FARMACIA     "Farmacia"         "Farmacia abilitata"
* #MMG          "MMG/PLS"          "Prenotazione dal medico di base"
* #TELEMEDICINA "Telemedicina"     "Piattaforma Telemedicina nazionale IRT"

ValueSet: VsLcCupModalitaErogazione
Id: lccup-vs-modalita-erogazione
Title: "LcCup - Modalità di Erogazione"
Description: "Erogazione in presenza o a distanza (integrazione IRT)"
* ^status = #draft
* ^experimental = true
* include codes from system CsLcCupModalitaErogazione

CodeSystem: CsLcCupModalitaErogazione
Id: lccup-cs-modalita-erogazione
Title: "LcCup - Codici Modalità Erogazione"
* ^status = #draft
* ^experimental = true
* #IN_PRESENZA      "In presenza"       "Presso la struttura sanitaria"
* #TELECONSULTO     "Teleconsulto"      "Videochiamata via IRT"
* #TELEMONITORAGGIO "Telemonitoraggio"  "Monitoraggio clinico a distanza"

ValueSet: VsLcCupClassePriorita
Id: lccup-vs-classe-priorita
Title: "LcCup - Classe di Priorità"
Description: "Classi U/B/D/P per liste d'attesa (PNLA)"
* ^status = #draft
* ^experimental = true
* include codes from system CsLcCupClassePriorita

CodeSystem: CsLcCupClassePriorita
Id: lccup-cs-classe-priorita
Title: "LcCup - Codici Classe Priorità"
* ^status = #draft
* ^experimental = true
* #U  "Urgente"       "Entro 72 ore"
* #B  "Breve"         "Entro 10 giorni"
* #D  "Differibile"   "Entro 30/60 giorni"
* #P  "Programmabile" "Entro 120 giorni"

ValueSet: VsLcCupStatoSlot
Id: lccup-vs-stato-slot
Title: "LcCup - Stato Slot"
Description: "Stati ammessi per uno slot CUP Lazio"
* ^status = #draft
* ^experimental = true
* http://terminology.hl7.org/CodeSystem/v2-0276#free            "Libero"
* http://terminology.hl7.org/CodeSystem/v2-0276#busy            "Occupato"
* http://terminology.hl7.org/CodeSystem/v2-0276#busy-unavailable "Non disponibile"
* http://terminology.hl7.org/CodeSystem/v2-0276#busy-tentative  "Prenotazione tentativa"
