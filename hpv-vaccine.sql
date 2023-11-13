SET @maxid := (SELECT MAX(person_vaccine_id) FROM person_vaccine);
INSERT INTO person_vaccine(person_vaccine_id,vaccine_name,vaccine_code,vaccine_group,export_vaccine_code,combine_vaccine,active_status,dx_icd10)
VALUES 
(@maxid + 1,'HPV(Cecolin2)(Z258) เข็ม1', 'HPVC21','HPVC','HPVC21','N','Y','Z258'),
(@maxid + 2,'HPV(Cecolin2)(Z258) เข็ม2', 'HPVC22','HPVC','HPVC22','N','Y','Z258'),
(@maxid + 3,'HPV(Cecolin2)(Z258) เข็ม3', 'HPVC23','HPVC','HPVC23','N','Y','Z258'),
(@maxid + 4,'HPV(CERVARIX2)(Z258) เข็ม1', 'HPVV21','HPVV','HPVV21','N','Y','Z258'),
(@maxid + 5,'HPV(CERVARIX2)(Z258) เข็ม2', 'HPVV22','HPVV','HPVV22','N','Y','Z258'),
(@maxid + 6,'HPV(CERVARIX2)(Z258) เข็ม3', 'HPVV23','HPVV','HPVV23','N','Y','Z258'),
(@maxid + 7,'HPV(GARDASIL4)(Z258) เข็ม1', 'HPVG41','HPVG','HPVG41','N','Y','Z258'),
(@maxid + 8,'HPV(GARDASIL4)(Z258) เข็ม2', 'HPVG42','HPVG','HPVG42','N','Y','Z258'),
(@maxid + 9,'HPV(GARDASIL4)(Z258) เข็ม3', 'HPVG43','HPVG','HPVG43','N','Y','Z258'),
(@maxid + 10,'HPV(GARDASIL9)(Z258) เข็ม1', 'HPVG91','HPVG','HPVG91','N','Y','Z258'),
(@maxid + 11,'HPV(GARDASIL9)(Z258) เข็ม2', 'HPVG92','HPVG','HPVG92','N','Y','Z258'),
(@maxid + 12,'HPV(GARDASIL9)(Z258) เข็ม3', 'HPVG93','HPVG','HPVG93','N','Y','Z258');

SET @maxid := (SELECT MAX(vaccine_combination_id) FROM vaccine_combination);
INSERT INTO vaccine_combination(vaccine_combination_id,vaccine_code,vaccine_combine_code)
VALUES 
(@maxid + 1,'HPVC21','HPVC21'),
(@maxid + 2,'HPVC22','HPVC22'),
(@maxid + 3,'HPVC23','HPVC23'),
(@maxid + 4,'HPVV21','HPVV21'),
(@maxid + 5,'HPVV22','HPVV22'),
(@maxid + 6,'HPVV23','HPVV23'),
(@maxid + 7,'HPVG41','HPVG41'),
(@maxid + 8,'HPVG42','HPVG42'),
(@maxid + 9,'HPVG43','HPVG43'),
(@maxid + 10,'HPVG91','HPVG91'),
(@maxid + 11,'HPVG92','HPVG92'),
(@maxid + 12,'HPVG93','HPVG93');

ALTER TABLE provis_vcctype MODIFY COLUMN code char(10);

INSERT INTO provis_vcctype(code,name)
VALUES 
('HPVC21','HPVC21'),
('HPVC22','HPVC22'),
('HPVC23','HPVC23'),
('HPVV21','HPVV21'),
('HPVV22','HPVV22'),
('HPVV23','HPVV23'),
('HPVG41','HPVG41'),
('HPVG42','HPVG42'),
('HPVG43','HPVG43'),
('HPVG91','HPVG91'),
('HPVG92','HPVG92'),
('HPVG93','HPVG93');

update serial set serial_no=(select max(person_vaccine_id) from person_vaccine) where serial.name='person_vaccine_id';

INSERT INTO moph_claim_vaccine (moph_vaccine_code) VALUES ('HPVC21'),('HPVC22'),('HPVC23'),('HPVV21'),('HPVV22'),('HPVV23'),('HPVG41'),('HPVG42'),('HPVG43'),('HPVG91'),('HPVG92'),('HPVG93');