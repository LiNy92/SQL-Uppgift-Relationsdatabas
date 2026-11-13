# Inlämningsuppgift 1 - Relationsdatabas


Normalisering: Databasen ska vara strukturerad enligt tredje normalformen
(3NF). Skriv en kort text (max en halvsida) där du motiverar varför din design
uppfyller 1NF, 2NF och 3NF.



Normalisering: 

Kolumnerna i tabellen syftar direkt på tabellens huvudämne. Kunder är strukturerad med att fylla på uppgifter om organisationsnummer, företagsnamn, e-post och telefonnummer. Denna har en egen primärnyckel. Därefter är konsulterna strukturerade i en egen tabell med egen primärnyckel där uppgifter som personnr, namn, timpris och huvudsakliga specialitet är angivet. Respektive tabell samlar sin egen unika information. 

Därefter skapades en kopplingstabell som gäller uppdrag. En kund kan ha flera olika uppdrag över tid och en konsult kan vara med på fler olika. Däremot har varje enskilt uppdrag en specifik kund och en specifik konsult. I kopplingstabellen finns även start-/slutdatum och uppgift, vilket också är direkt kopplat och relevant för varje specifikt uppdrag.  

Detta utgör tredje normalformen då alla kolumner i tabellerna är kopplat till deras huvudämne och lagras under rätt tabell. Tabellerna är uppdelade i kunder och konsulter som håller sin relevanta information.  

Assignment-tabellen, kopplingstabellen, hanterar relationen mellan dessa. Varje rad i den tabellen representerar ett uppdrag som knyts samman med en kund, en konsult och med tillhörande start och slutdatum samt den specifika uppgiften för uppdraget. Genom att använda kund- och konsultId som gemensam primärnyckel i kopplingstabellen så är informationen strikt länkad vilket gör att informationen inte lagras dubbelt. 

Det gör däremot att en konsult inte kan ta nytt uppdrag hos samma kund över tid men i detta fall är det detta som har efterfrågats. En lösning på det hade annars varit att ha ett eget Id som primärnyckel i tabellen för uppdragen. 

 
