# Inlämningsuppgift 1 - Relationsdatabas

## Normalisering

Kolumnerna i tabellen syftar direkt på tabellens huvudämne. Kunder är strukturerad med att fylla på uppgifter om organisationsnummer, företagsnamn, e-post och telefonnummer. Denna har en egen primärnyckel. Därefter är konsulterna strukturerade i en egen tabell med egen primärnyckel där uppgifter som personnr, namn, timpris och huvudsakliga specialitet är angivet. Respektive tabell samlar sin egen unika information. 

Därefter skapades en kopplingstabell som gäller uppdrag. En kund kan ha flera olika uppdrag över tid och en konsult kan vara med på fler olika. Däremot har varje enskilt uppdrag en specifik kund och en specifik konsult. I kopplingstabellen finns även start-/slutdatum och uppgift, vilket också är direkt kopplat och relevant för varje specifikt uppdrag.  

Detta utgör tredje normalformen då alla kolumner i tabellerna är kopplat till deras huvudämne och lagras under rätt tabell. Tabellerna är uppdelade i kunder och konsulter som håller sin relevanta information.  

Assignment-tabellen, kopplingstabellen, hanterar relationen mellan dessa. Varje rad i den tabellen representerar ett uppdrag som knyts samman med en kund, en konsult och med tillhörande start och slutdatum samt den specifika uppgiften för uppdraget. Genom att använda kund- och konsultId som gemensam primärnyckel i kopplingstabellen så är informationen strikt länkad vilket gör att informationen inte lagras dubbelt. 

Det gör däremot att en konsult inte kan ta nytt uppdrag hos samma kund över tid men i detta fall är det detta som har efterfrågats. En lösning på det hade annars varit att uppdragen har ett eget Id som primärnyckel och att kund- och kusult-id endast fungarade som främmande nycklar i tabellen. 

## DevSevOps-reflektioner
Sec: Om din databas nås via en publik webbapplikation, på vilket sätt skyddar du systemet så att en angripare inte kan skriva skadlig SQL-kod i ett inmatningsfält och radera hela din databas (SQL Injection)?

Svar: Genom parametrisering, separera kommandots struktur från datan. Detta med hjälp av platshållare så att kommandot från användaren skickas in som en parameter. Databasen söker då efter parameterns värde oavsett vad den innhåller för eventuell skadlig kod utan att agera på den. 

Ops: Om FailSafe IT växer till tusentals kunder och miljontals uppdrag, vilken databasfunktion bör du implementera på tabellerna för att säkerställa att sökningar efter specifika organisationsnummer fortfarande går blixtsnabbt?

Svar: Genom att implementera index. Exempelvis Non-Clustered Index för att skapa en sorterad sökväg. 
 
