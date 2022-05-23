# IPP VT2022 - Smartbox
# Deltagare från grupp 20 för kodning: Serhad Y., Filip N., Alexander Y., och Yakoub D.

En filtrerad branch av hela projektet ligger i "merged"-branchen. Notera att appen fortfarande inte är klar och saknar vissa funktioner.
Framtida patch-uppdatering lär inkludera:
    
    + Tillägg av funktion som kalkylerar med Watt-nivå, uppskattad volym och önskad temperatur
      som parameter, och resultat ger tid som krävs för maten att bli klar.
    + Tillägg av värde som tilldelas från Arduino-kod till temperaturindikatorn genom bluetooth.
    + Tillägg av språkbyte.
    * Fixa fullständig användning för iOS-version till Apple-enheter.
    * Fixa temperaturinmatning från lista till indikator
    * Fixa ordentliga följbara instruktioner som används praktiskt med matlådan.
    * Fixa fullständig inställning för Farenheit genom hela uppbygget av appens alla .dart

OBS att p.g.a versionsuppdateringar så har jag (SERHAD) behövt under vissa tillfällen ladda upp kod som egentligen är skrivet av andra i gruppen.
Dessa tillfällen är:

    - Första commit-upplägget för appen av FILIP, där han skrev koden för main.dart med implementation av 
      huvudsidan med temperaturindikatorn och knappen för inställningar vid botten av skärmen.
    - Senaste commit-upplägget av YAKOUB, där han skrev koden för Arduinofilen "Matl_da_Arduino.ino". 
      Denna kod har lagts upp av mig (SERHAD) i main-branchen p.g.a felhantering av versioner. 
      Dock ser man detta i "new branch" att (YAKOUB) la upp denna kod. Koden rättad av (ALEXANDER)
      från teknisk fysik. 
