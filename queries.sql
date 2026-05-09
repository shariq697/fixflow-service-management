Appendix C: SQL Queries Used in FixFlow
C.1 – Retrieve all tickets with requester and technician information
SELECT t.ticket_id, t.title, t.status, t.priority, u.full_name AS user_name, tech.full_name AS technician_name
FROM tickets t
JOIN users u ON t.user_id = u.user_id
LEFT JOIN technicians tech ON t.technician_id = tech.technician_id
ORDER BY t.ticket_id;
*Used on ticket page to display all tickets, along with the user who created and the tech assigned to it

C.2 – Retrieve all users
SELECT * FROM users
ORDER BY full_name;
*Used on the Users page and when using the dropdown in Create Ticket form

C.3 – Insert a new user
INSERT INTO users (full_name, email, department)
VALUES (%s, %s, %s);
*Used when creating a new user through the Create User form

C.4 – Retrieve all technicians 
SELECT * FROM technicians
ORDER BY full_name;
*Used when populating the technician dropdown in Edit Ticket form

C.5 – Insert a new ticket
INSERT INTO tickets (user_id, title, description, priority, status)
VALUES (%s, %s, %s, %s, 'Open');
*Used when creating a new ticket

C.6 – Retrieve a specific ticket with user and technicians’ details
SELECT t.ticket_id, t.user_id, t.technician_id, t.title, t.description, t.status, t.priority, t.created_at, u.full_name AS user_name, u.email AS user_email, u.department, tech.full_name AS technician_name
FROM tickets t
JOIN users u ON t.user_id = u.user_id
LEFT JOIN technicians tech ON t.technician_id = tech.technician_id
WHERE t.ticket_id = %s;
*Used on Ticket Details page to display full information for one ticket, including requester and technician information 

C.7 – Update a ticket
UPDATE tickets
SET title = %s,
description = %s,
status = %s,
priority = %s,
technician_id = %s
WHERE ticket_id = %s;
*Used when editing a ticket

C.8 – Delete a ticket
DELTE FROM tickets
WHERE ticket_id = %s;
*Used when deleting a ticket from Tickets page

C.9 – Retrieve comments for a ticket
SELECT * FROM ticket_comments
WHERE ticket_id = %s
ORDER BY created_at DESC, comment_id DESC;
*Used on Ticket Details page to display all comments for a ticket



C.10 – Insert a comment
INSERT INTO ticket_comments (ticket_id, comment_text, commented_by)
VALUES (%s, %s, %s);
*Used when adding a comment to a ticket

C.11 – Delete a comment
DELETE FROM ticket_comments
WHERE comment_id = %s;
*Used when deleting a comment from Ticket Details page

C.12 – Delete a user
DELETE FROM users
WHERE user_id = %s;
*Used when deleting a user from the Users page
