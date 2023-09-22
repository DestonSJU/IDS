CREATE TABLE IF NOT EXISTS child_mortality(
   Year                    INTEGER  NOT NULL PRIMARY KEY 
  ,Underﬁve_mortality_rate VARCHAR(7) NOT NULL
  ,Infant_mortality_rate   VARCHAR(4) NOT NULL
  ,Neonatal_mortality_rate VARCHAR(4)
);
INSERT INTO child_mortality(Year,Underﬁve_mortality_rate,Infant_mortality_rate,Neonatal_mortality_rate) VALUES (1990,'93.4','64.8','36.8');
INSERT INTO child_mortality(Year,Underﬁve_mortality_rate,Infant_mortality_rate,Neonatal_mortality_rate) VALUES (1991,'92.1','63.9','36.3');
INSERT INTO child_mortality(Year,Underﬁve_mortality_rate,Infant_mortality_rate,Neonatal_mortality_rate) VALUES (1992,'90.9','63.1','35.9');
INSERT INTO child_mortality(Year,Underﬁve_mortality_rate,Infant_mortality_rate,Neonatal_mortality_rate) VALUES (1993,'89.7','62.3','35.4');
INSERT INTO child_mortality(Year,Underﬁve_mortality_rate,Infant_mortality_rate,Neonatal_mortality_rate) VALUES (1994,'88.7','61.4','??');
INSERT INTO child_mortality(Year,Underﬁve_mortality_rate,Infant_mortality_rate,Neonatal_mortality_rate) VALUES (1995,'87.3','60.5','34.4');
INSERT INTO child_mortality(Year,Underﬁve_mortality_rate,Infant_mortality_rate,Neonatal_mortality_rate) VALUES (1996,'85.6','59.4','33.7');
INSERT INTO child_mortality(Year,Underﬁve_mortality_rate,Infant_mortality_rate,Neonatal_mortality_rate) VALUES (1997,'??','58.2','33.1');
INSERT INTO child_mortality(Year,Underﬁve_mortality_rate,Infant_mortality_rate,Neonatal_mortality_rate) VALUES (1998,'82.1','56.9','32.3');
INSERT INTO child_mortality(Year,Underﬁve_mortality_rate,Infant_mortality_rate,Neonatal_mortality_rate) VALUES (1999,'79.9','55.4','31.5');
INSERT INTO child_mortality(Year,Underﬁve_mortality_rate,Infant_mortality_rate,Neonatal_mortality_rate) VALUES (2000,'77.5','53.9','30.7');
INSERT INTO child_mortality(Year,Underﬁve_mortality_rate,Infant_mortality_rate,Neonatal_mortality_rate) VALUES (2001,'74.8','52.1','29.8');
INSERT INTO child_mortality(Year,Underﬁve_mortality_rate,Infant_mortality_rate,Neonatal_mortality_rate) VALUES (2002,'72','??','28.9');
INSERT INTO child_mortality(Year,Underﬁve_mortality_rate,Infant_mortality_rate,Neonatal_mortality_rate) VALUES (2003,'69.2','48.6','28');
INSERT INTO child_mortality(Year,Underﬁve_mortality_rate,Infant_mortality_rate,Neonatal_mortality_rate) VALUES (2004,'66.7','46.9','??');
INSERT INTO child_mortality(Year,Underﬁve_mortality_rate,Infant_mortality_rate,Neonatal_mortality_rate) VALUES (2005,'??','45.1','26.1');
INSERT INTO child_mortality(Year,Underﬁve_mortality_rate,Infant_mortality_rate,Neonatal_mortality_rate) VALUES (2006,'61.1','43.4','25.3');
INSERT INTO child_mortality(Year,Underﬁve_mortality_rate,Infant_mortality_rate,Neonatal_mortality_rate) VALUES (2007,'58.5','??','24.4');
INSERT INTO child_mortality(Year,Underﬁve_mortality_rate,Infant_mortality_rate,Neonatal_mortality_rate) VALUES (2008,'56.2','40.3','23.6');
INSERT INTO child_mortality(Year,Underﬁve_mortality_rate,Infant_mortality_rate,Neonatal_mortality_rate) VALUES (2009,'53.7','38.8','22.9');
INSERT INTO child_mortality(Year,Underﬁve_mortality_rate,Infant_mortality_rate,Neonatal_mortality_rate) VALUES (2010,'??','37.4','22.2');
INSERT INTO child_mortality(Year,Underﬁve_mortality_rate,Infant_mortality_rate,Neonatal_mortality_rate) VALUES (2011,'49.3','36','21.5');
INSERT INTO child_mortality(Year,Underﬁve_mortality_rate,Infant_mortality_rate,Neonatal_mortality_rate) VALUES (2012,'47.3','34.7','20.8');
INSERT INTO child_mortality(Year,Underﬁve_mortality_rate,Infant_mortality_rate,Neonatal_mortality_rate) VALUES (2013,'45.5','33.6','20.2');
INSERT INTO child_mortality(Year,Underﬁve_mortality_rate,Infant_mortality_rate,Neonatal_mortality_rate) VALUES (2014,'43.7','??','19.6');
INSERT INTO child_mortality(Year,Underﬁve_mortality_rate,Infant_mortality_rate,Neonatal_mortality_rate) VALUES (2015,'42.2','31.4','19.1');
INSERT INTO child_mortality(Year,Underﬁve_mortality_rate,Infant_mortality_rate,Neonatal_mortality_rate) VALUES (2016,'40.8','30.5','18.6');

UPDATE Child_mortality
SET Underﬁve_mortality_rate	 = (SELECT MEDIAN(Underﬁve_mortality_rate) FROM Child_mortality)
WHERE Underﬁve_mortality_rate IS '??';

UPDATE Child_mortality
SET Infant_mortality_rate= (SELECT MEDIAN(Infant_mortality_rate) FROM Child_mortality)
WHERE Infant_mortality_rate IS '??';

UPDATE Child_mortality
SET Neonatal_mortality_rate	 = (SELECT MEDIAN(Neonatal_mortality_rate) FROM Child_mortality)
WHERE Neonatal_mortality_rate IS '??';

SELECT *
FROM Child_mortality;

SELECT Year, MIN(Infant_mortality_rate)
FROM Child_mortality;

SELECT Year, MAX(Infant_mortality_rate)
FROM Child_mortality;

SELECT AVG(Neonatal_mortality_rate)
FROM Child_mortality;

SELECT Year
FROM Child_mortality
WHERE Neonatal_mortality_rate > 27.5;

SELECT Year, Infant_mortality_rate
FROM Child_mortality
ORDER BY Infant_mortality_rate DESC;

SELECT MIN(Underﬁve_mortality_rate), MAX(Underﬁve_mortality_rate), AVG(Underﬁve_mortality_rate), VARIANCE(Underﬁve_mortality_rate), STDEV(Underﬁve_mortality_rate) FROM Child_mortality;

SELECT MIN(Infant_mortality_rate), MAX(Infant_mortality_rate), AVG(Infant_mortality_rate), VARIANCE(Infant_mortality_rate), STDEV(Infant_mortality_rate) FROM Child_mortality;

SELECT MIN(Neonatal_mortality_rate), MAX(Neonatal_mortality_rate), AVG(Neonatal_mortality_rate), VARIANCE(Neonatal_mortality_rate), STDEV(Neonatal_mortality_rate) FROM Child_mortality;

ALTER TABLE Child_mortality
ADD COLUMN 'Above-five_mortality_rate';

UPDATE Child_mortality SET "Above-five_mortality_rate" = '10.8' WHERE Year= 1990;
UPDATE Child_mortality SET "Above-five_mortality_rate" = '10.4' WHERE Year= 1991;
UPDATE Child_mortality SET "Above-five_mortality_rate" = '10.2' WHERE Year= 1992;
UPDATE Child_mortality SET "Above-five_mortality_rate" = '9.9' WHERE Year= 1993;
UPDATE Child_mortality SET "Above-five_mortality_rate" = '9.7' WHERE Year= 1994;
UPDATE Child_mortality SET "Above-five_mortality_rate" = '9.6' WHERE Year= 1995;
UPDATE Child_mortality SET "Above-five_mortality_rate" = '9.5' WHERE Year= 1996;
UPDATE Child_mortality SET "Above-five_mortality_rate" = '9.2' WHERE Year= 1997;
UPDATE Child_mortality SET "Above-five_mortality_rate" = '9.0' WHERE Year= 1998;
UPDATE Child_mortality SET "Above-five_mortality_rate" = '8.9' WHERE Year= 1999;
UPDATE Child_mortality SET "Above-five_mortality_rate" = '8.7' WHERE Year= 2000;
UPDATE Child_mortality SET "Above-five_mortality_rate" = '8.6' WHERE Year= 2001;
UPDATE Child_mortality SET "Above-five_mortality_rate" = '8.5' WHERE Year= 2002;
UPDATE Child_mortality SET "Above-five_mortality_rate" = '8.4' WHERE Year= 2003;
UPDATE Child_mortality SET "Above-five_mortality_rate" = '8.3' WHERE Year= 2004;
UPDATE Child_mortality SET "Above-five_mortality_rate" = '8.1' WHERE Year= 2005;
UPDATE Child_mortality SET "Above-five_mortality_rate" = '8.0' WHERE Year= 2006;
UPDATE Child_mortality SET "Above-five_mortality_rate" = '7.8' WHERE Year= 2007;
UPDATE Child_mortality SET "Above-five_mortality_rate" = '7.7' WHERE Year= 2008;
UPDATE Child_mortality SET "Above-five_mortality_rate" = '7.6' WHERE Year= 2009;
UPDATE Child_mortality SET "Above-five_mortality_rate" = '7.5' WHERE Year= 2010;
UPDATE Child_mortality SET "Above-five_mortality_rate" = '7.4' WHERE Year= 2011;
UPDATE Child_mortality SET "Above-five_mortality_rate" = '7.2' WHERE Year= 2012;
UPDATE Child_mortality SET "Above-five_mortality_rate" = '7.1' WHERE Year= 2013;
UPDATE Child_mortality SET "Above-five_mortality_rate" = '7.0' WHERE Year= 2014;
UPDATE Child_mortality SET "Above-five_mortality_rate" = '6.8' WHERE Year= 2015;
UPDATE Child_mortality SET "Above-five_mortality_rate" = '6.7' WHERE Year= 2016;

SELECT *
FROM Child_mortality;
