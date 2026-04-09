UPDATE "users"
SET "password" = '982c0381c279d139fd221fce974916e7'
WHERE "username" = 'admin';

DELETE FROM "user_logs"
WHERE "id" = '52';

INSERT INTO "user_logs" ("type", "old_username", "new_username", "old_password", "new_password")
SELECT 'update', 'admin', 'admin', 
    (SELECT "password" FROM "users" WHERE "username" = 'admin'), 
    (SELECT "password" FROM "users" WHERE "username" = 'emily33');

/*
INSERT INTO "user_logs" ("type", "old_username", "new_username", "old_password", "new_password")
VALUES (
    'update', 
    'admin', 
    'admin', 
    'e10adc3949ba59abbe56e057f20f883e', -- Senha antiga digitada
    (SELECT "password" FROM "users" WHERE "username" = 'emily33') -- Busca a da Emily
);
*/