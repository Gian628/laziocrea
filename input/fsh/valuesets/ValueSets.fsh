// ============================================================
// VALUE SETS e CODE SYSTEMS — CUP Lazio
// ============================================================

ValueSet: VsTipoAgenda
Id: vs-tipo-agenda
Title: "Tipo Agenda"
* ^status = #draft
* ^experimental = true
* include codes from system CsTipoAgenda

CodeSystem: CsTipoAgenda
Id: cs-tipo-agenda
Title: "Codici Tipo Agenda"
* ^status = #draft
* ^experimental = true
* #SSN    "SSN Istituzionale"  "Agenda in regime SSN"
* #ALPI   "ALPI"               "Attività Libero-Professionale Intramuraria"
* #PRIV   "Privata"            "Agenda in regime privato"
* #CONV   "Convenzionata"      "Agenda struttura privata accreditata SSN"

ValueSet: VsCanalePrenotazione
Id: vs-canale-prenotazione
Title: "Canale Prenotazione"
* ^status = #draft
* ^experimental = true
* include codes from system CsCanalePrenotazione

CodeSystem: CsCanalePrenotazione
Id: cs-canale-prenotazione
Title: "Codici Canale Prenotazione"
* ^status = #draft
* ^experimental = true
* #SPORTELLO    "Sportello CUP"    "Prenotazione allo sportello"
* #TELEFONO     "Telefono"         "Call center CUP Lazio"
* #WEB          "Web/Portale"      "Portale regionale o FSE"
* #APP          "App Mobile"       "Applicazione mobile"
* #FARMACIA     "Farmacia"         "Farmacia abilitata"
* #MMG          "MMG/PLS"          "Prenotazione dal medico di base"
* #TELEMEDICINA "Telemedicina"     "Piattaforma telemedicina IRT"

ValueSet: VsModalitaErogazione
Id: vs-modalita-erogazione
Title: "Modalità di Erogazione"
* ^status = #draft
* ^experimental = true
* include codes from system CsModalitaErogazione

CodeSystem: CsModalitaErogazione
Id: cs-modalita-erogazione
Title: "Codici Modalità Erogazione"
* ^status = #draft
* ^experimental = true
* #IN_PRESENZA      "In presenza"       "Presso la struttura sanitaria"
* #TELECONSULTO     "Teleconsulto"      "Videochiamata via IRT"
* #TELEMONITORAGGIO "Telemonitoraggio"  "Monitoraggio clinico a distanza"

ValueSet: VsClassePriorita
Id: vs-classe-priorita
Title: "Classe di Priorità"
* ^status = #draft
* ^experimental = true
* include codes from system CsClassePriorita

CodeSystem: CsClassePriorita
Id: cs-classe-priorita
Title: "Codici Classe Priorità"
* ^status = #draft
* ^experimental = true
* #U  "Urgente"       "Entro 72 ore"
* #B  "Breve"         "Entro 10 giorni"
* #D  "Differibile"   "Entro 30/60 giorni"
* #P  "Programmabile" "Entro 120 giorni"

ValueSet: VsStatoSlot
Id: vs-stato-slot
Title: "Stato Slot"
* ^status = #draft
* ^experimental = true
* http://terminology.hl7.org/CodeSystem/v2-0276#free            "Libero"
* http://terminology.hl7.org/CodeSystem/v2-0276#busy            "Occupato"
* http://terminology.hl7.org/CodeSystem/v2-0276#busy-unavailable "Non disponibile"
* http://terminology.hl7.org/CodeSystem/v2-0276#busy-tentative  "Prenotazione tentativa"

ValueSet: VsTipoIdentificatore
Id: vs-tipo-identificatore
Title: "Tipo Identificatore Agenda"
* ^status = #draft
* ^experimental = true
* include codes from system CsTipoIdentificatore

CodeSystem: CsTipoIdentificatore
Id: cs-tipo-identificatore
Title: "Codici Tipo Identificatore"
* ^status = #draft
* ^experimental = true
* #99INV "Mnemonico CUP" "Codice mnemonico agenda nel sistema CUP"

ValueSet: VsTipoServizio
Id: vs-tipo-servizio
Title: "Tipo HealthcareService"
* ^status = #draft
* ^experimental = true
* include codes from system CsTipoServizio

CodeSystem: CsTipoServizio
Id: cs-tipo-servizio
Title: "Codici Tipo Servizio"
* ^status = #draft
* ^experimental = true
* #platform   "Piattaforma"  "Servizio piattaforma telemedicina (es. TELEVISIT)"
* #prestazione "Prestazione" "Prestazione clinica specifica"

ValueSet: VsCanaleVirtuale
Id: vs-canale-virtuale
Title: "Canale Servizio Virtuale"
* ^status = #draft
* ^experimental = true
* include codes from system CsCanaleVirtuale

CodeSystem: CsCanaleVirtuale
Id: cs-canale-virtuale
Title: "Codici Canale Virtuale"
* ^status = #draft
* ^experimental = true
* #Videocall "Videocall" "Sessione video"

ValueSet: VsEventStatus
Id: vs-event-status
Title: "Stato Evento"
* ^status = #draft
* ^experimental = true
* include codes from system CsEventStatus

CodeSystem: CsEventStatus
Id: cs-event-status
Title: "Codici Stato Evento"
* ^status = #draft
* ^experimental = true
* #PENDING   "In attesa"    "Evento in attesa di conferma o erogazione"
* #CONFIRMED "Confermato"   "Evento confermato"
* #COMPLETED "Completato"   "Evento completato"
