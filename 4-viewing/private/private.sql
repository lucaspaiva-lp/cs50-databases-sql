CREATE TABLE codigo (
    sentence_id INTEGER,
    character_start INTEGER,
    phrase_length INTEGER
);

-- DROP TABLE codigo;

INSERT INTO codigo (
    sentence_id,
    character_start,
    phrase_length
)
VALUES
    (14,98,4),
    (114,3,5),
    (618,72,9),
    (630,7,3),
    (932,12,5),
    (2230,50,7),
    (2346,44,10),
    (3041,14,5);

-- DROP VIEW message;

CREATE VIEW message AS
SELECT substr(sentence, character_start, phrase_length) AS phrase
FROM sentences
JOIN codigo ON sentences.id = codigo.sentence_id;

-- select * from message;