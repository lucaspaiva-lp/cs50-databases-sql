SELECT username
FROM users
JOIN messages
    ON messages.from_user_id = users.id
GROUP BY to_user_id
ORDER BY COUNT(*) DESC
LIMIT 1;