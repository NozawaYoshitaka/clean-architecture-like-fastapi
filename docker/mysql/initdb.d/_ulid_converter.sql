-- Define ULID_DECODE and ULID_ENCODE which convert a ulid string to a binary and vice versa.

delimiter //
DROP FUNCTION IF EXISTS ULID_DECODE//
CREATE FUNCTION ULID_DECODE (s CHAR(26)) RETURNS BINARY(16) DETERMINISTIC
BEGIN
DECLARE s_base32 CHAR(26);
SET s_base32 = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(UPPER(s), 'J', 'I'), 'K', 'J'), 'M', 'K'), 'N', 'L'), 'P', 'M'), 'Q', 'N'), 'R', 'O'), 'S', 'P'), 'T', 'Q'), 'V', 'R'), 'W', 'S'), 'X', 'T'), 'Y', 'U'), 'Z', 'V');
RETURN UNHEX(CONCAT(LPAD(CONV(SUBSTRING(s_base32, 1, 2), 32, 16), 2, '0'), LPAD(CONV(SUBSTRING(s_base32, 3, 12), 32, 16), 15, '0'), LPAD(CONV(SUBSTRING(s_base32, 15, 12), 32, 16), 15, '0')));
END//

DROP FUNCTION IF EXISTS ULID_ENCODE//
CREATE FUNCTION ULID_ENCODE (b BINARY(16)) RETURNS CHAR(26) DETERMINISTIC
BEGIN
DECLARE s_hex CHAR(32);
SET s_hex = LPAD(HEX(b), 32, '0');
RETURN REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CONCAT(LPAD(CONV(SUBSTRING(s_hex, 1, 2), 16, 32), 2, '0'), LPAD(CONV(SUBSTRING(s_hex, 3, 15), 16, 32), 12, '0'), LPAD(CONV(SUBSTRING(s_hex, 18, 15), 16, 32), 12, '0')), 'V', 'Z'), 'U', 'Y'), 'T', 'X'), 'S', 'W'), 'R', 'V'), 'Q', 'T'), 'P', 'S'), 'O', 'R'), 'N', 'Q'), 'M', 'P'), 'L', 'N'), 'K', 'M'), 'J', 'K'), 'I', 'J');
END//
delimiter ;
