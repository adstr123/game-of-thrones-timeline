DROP TABLE IF EXISTS Houses;
CREATE TABLE Houses (
	HouseID INTEGER PRIMARY KEY,
	Name varchar(255)
);
INSERT INTO Houses (Name) VALUES ('Arryn'), ('Greyjoy'), ('Lannister'), ('Stark'), ('Targaryen'), ('Frey');

DROP TABLE IF EXISTS Characters;
CREATE TABLE Characters (
	CharacterID INTEGER PRIMARY KEY,
	FirstName varchar(255),
	Surname varchar(255),
	HouseID int,
	FOREIGN KEY (HouseID) REFERENCES Houses(HouseID)
);
INSERT INTO Characters (FirstName, Surname, HouseID) VALUES ('Jon', 'Arryn', 0), ('Lysa', 'Arryn', 0), ('Robin', 'Arryn', 1);
INSERT INTO Characters (FirstName, Surname, HouseID) VALUES ('Balon', 'Greyjoy', 2), ('Yara', 'Greyjoy', 2), ('Theon', 'Greyjoy', 2), ('Euron', 'Greyjoy', 2), ('Aeron', 'Greyjoy', 2);
INSERT INTO Characters (FirstName, Surname, HouseID) VALUES ('Tywin', 'Lannister', 3), ('Cersei', 'Lannister', 3), ('Jaime', 'Lannister', 3), ('Tyrion', 'Lannister', 3), ('Joffrey', 'Baratheon', 3), ('Myrcella', 'Baratheon', 3), ('Tommen', 'Baratheon', 3), ('Kevan', 'Lannister', 3), ('Lancel', 'Lannister', 3), ('Martyn', 'Lannister', 3), ('Willem', 'Lannister', 3);
INSERT INTO Characters (FirstName, Surname, HouseID) VALUES ('Eddard', 'Stark', 4), ('Catelyn', 'Stark', 4), ('Robb', 'Stark', 4), ('Talisa', 'Stark', 4), ('Sansa', 'Stark', 4), ('Arya', 'Stark', 4), ('Brandon', 'Stark', 4), ('Rickon Stark', 'Stark', 4), ('Lyanna', 'Stark', 4), ('Jon', 'Snow', 4), ('Benjen', 'Stark', 4);
INSERT INTO Characters (FirstName, Surname, HouseID) VALUES ('Viserys', 'Targaryen', 5), ('Daenerys', 'Targaryen', 5), ('Aemon', 'Targaryen', 5);
INSERT INTO Characters (FirstName, Surname, HouseID) VALUES ('Walder', 'Frey', 6), ('Joyeuse', 'Frey', 6), ('Kitty', 'Frey', 6);

DROP TABLE IF EXISTS Events;
CREATE TABLE Events (
	EventID INTEGER PRIMARY KEY,
	Title varchar(255),
	Description varchar(255),
	Season int,
	Episode int,
	CharacterID int,
	FOREIGN KEY (CharacterID) REFERENCES Characters(CharacterID)
);
INSERT INTO Events (Title, Description, Season, Episode, CharacterID) VALUES ('Test Event', "Hello world", 1, 1, 1), ('Test Event', "Hello world", 1, 1, 2), ('Test Event', "Hello world", 1, 1, 3), ('Test Event', "Hello world", 1, 1, 4), ('Test Event', "Hello world", 1, 1, 5), ('Test Event', "Hello world", 1, 1, 6), ('Test Event', "Hello world", 1, 1, 7), ('Test Event', "Hello world", 1, 1, 8), ('Test Event', "Hello world", 1, 1, 9), ('Test Event', "Hello world", 1, 1, 10), ('Test Event', "Hello world", 1, 1, 11), ('Test Event', "Hello world", 1, 1, 12), ('Test Event', "Hello world", 1, 1, 13), ('Test Event', "Hello world", 1, 1, 14), ('Test Event', "Hello world", 1, 1, 15), ('Test Event', "Hello world", 1, 1, 16), ('Test Event', "Hello world", 1, 1, 17), ('Test Event', "Hello world", 1, 1, 18), ('Test Event', "Hello world", 1, 1, 19), ('Test Event', "Hello world", 1, 1, 21), ('Test Event', "Hello world", 1, 1, 22), ('Test Event', "Hello world", 1, 1, 23), ('Test Event', "Hello world", 1, 1, 24), ('Test Event', "Hello world", 1, 1, 25), ('Test Event', "Hello world", 1, 1, 26), ('Test Event', "Hello world", 1, 1, 27), ('Test Event', "Hello world", 1, 1, 28), ('Test Event', "Hello world", 1, 1, 29), ('Test Event', "Hello world", 1, 1, 30), ('Test Event', "Hello world", 1, 1, 31), ('Test Event', "Hello world", 1, 1, 32), ('Test Event', "Hello world", 1, 1, 33), ('Test Event', "Hello world", 1, 1, 34), ('Test Event', "Hello world", 1, 1, 35), ('Test Event', "Hello world", 1, 1, 36);
INSERT INTO Events (Title, Description, Season, Episode, CharacterID) VALUES ('Deserter Execution', "Eddard Stark executes a deserter from the Night's Watch named Will. Will tries to warn Eddard about the return of the White Walkers, but Eddard dismisses him as a madman. Eddard's sons Robb, Bran, and Jon accompany him to the execution. Eddard makes a point of telling Bran that the man who passes the sentence should swing the sword and take responsibility for his own decisions.", 1, 1, 20), ('Direwolf Discovery', "On the way back to Winterfell, the party finds a dead stag and a dead female direwolf. The direwolf is found with her litter of six living pups. Eddard's first instinct is to kill them, but Jon tells his father that since the direwolf is the sigil of House Stark, the pups may be an omen. Eddard agrees to let his children look after them on the condition that they clean, raise, and feed them with no help from the servants.", 1, 1, 20), ('Meeting the King', "King Robert Baratheon travels to Winterfell, meaning to name Eddard as Hand of the King to replace the dead Jon Arryn. He ponders refusal. However, when Robert arrives, he makes it clear that he badly needs Eddard's help in King's Landing. He also sweetens the deal by offering to betroth his son and heir Joffrey to Eddard's daughter Sansa. Eddard remains uncertain until a secret letter from Lysa Arryn, Catelyn's sister, implicates the Lannisters in the death of Jon Arryn. Eddard decides to accept to investigate both Jon Arryn's death and a potential plot against the king.", 1, 1, 20), ('Bran in Danger', "Bran is found comatose at the base of a disused tower following an apparent climbing accident. Eddard reluctantly decides to leave as planned, to his wife's distress. Eddard, Arya, Sansa, and the royal party head south to King's Landing.", 1, 2, 20), ('Death of a Direwolf', "On the road to King's Landing, Joffrey is bitten by Arya's direwolf Nymeria after Joffrey attacks Arya. Eddard is brought before the king and instructed to punish Arya. Joffrey lies about the cause of the incident and Sansa supports him, enraging Arya. Queen Cersei insists that a direwolf must be punished and Robert orders that Sansa's direwolf, Lady, must be killed in Nymeria's place. Eddard attends to the matter himself, to Sansa's anger.", 1, 2, 20), ('Bran Attempted Assassination', "Littlefinger tells Eddard that Catelyn has followed him to the city. Catelyn tells Eddard that she has traveled south to report an assassination attempt against Bran. The assassin was killed but was carrying a Valyrian steel knife. Littlefinger identifies the blade as one that he lost in a bet with Tyrion Lannister, and they conclude that the Lannisters were also behind Bran's original injuries. Eddard agrees to try to expose the truth.", 1, 3, 20), ('The Resignation', "A rift opens between Eddard and Robert when Eddard refuses to sanction the assassination of Daenerys Targaryen upon hearing she is pregnant with Khal Drogo's child. Eddard resigns as Hand and prepares to return to Winterfell. Littlefinger gives Eddard another lead, keeping him in the city.", 1, 5, 20), ('The Resignation', "A rift opens between Eddard and Robert when Eddard refuses to sanction the assassination of Daenerys Targaryen upon hearing she is pregnant with Khal Drogo's child. Eddard resigns as Hand and prepares to return to Winterfell. Littlefinger gives Eddard another lead, keeping him in the city.", 1, 5, 20), ('Fight with Jaime', "Eddard finds another of Robert's bastards, a baby girl named Barra in one of Littlefinger's brothels. As Eddard leaves the brothel, he is confronted by Ser Jaime Lannister. Jaime kills Jory and Eddard's other bodyguards. He proceeds to engage Eddard in single combat. A Lannister guardsman interferes and stabs Eddard in the leg, angering Jaime. He tells Eddard that he wants his brother back and leaves.", 1, 5, 20), ('The Hunt', "Cersei is enraged that Eddard will not be punished. Robert goes on a hunting expedition and Eddard sits as King in his absence. Whilst the King is gone, Eddard consults The Lineage book and sees that in every match between a Baratheon and a member of another house, the Baratheon black hair always dominates. He realizes with shock that this means that Joffrey and the other royal children are not Robert's and have no claim to the Iron Throne.", 1, 6, 20), ('Death of a King', "Robert is mortally wounded while on the hunt. Robert has Eddard write his will, naming Eddard Protector of the Realm to rule until Joffrey comes of age. Eddard writes to Robert's brother and true heir, Stannis, urging him to take the crown. Renly also offers Eddard the use of soldiers in securing Cersei and her children, but Eddard refuses to dishonor Robert's last few hours by spilling blood and frightening children. Robert dies and Joffrey takes the throne.", 1, 7, 20), ('The Capture', "Cersei tears up the letter proclaiming Eddard as Protector of the Realm. Eddard tells Joffrey that he has no right to the Iron Throne and commands the City Watch to take him and his mother into custody. Instead, the City Watch turns on Eddard's men and kills them. Eddard is incarcerated in the black cells under the Red Keep.", 1, 7, 20), ('Death of Eddard', "Eddard is taken to the front steps of the Great Sept of Baelor. Having relented to Varys' request, Eddard confesses that he intended to seize the throne for himself and recognizes Joffrey as the rightful king. Joffrey, however, ignores his mother's counsel that Eddard be exiled and orders his immediate execution. Ser Ilyn Payne swings the Lord of Winterfell's own sword Ice. Sansa watches as Payne decapitates Eddard.", 1, 9, 20), ('Humiliation of Eddard', "Eddard's head is placed on a spike above the Traitor's Walk in the Red Keep.", 1, 10, 20);